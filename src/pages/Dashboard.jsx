import { useEffect, useMemo, useState } from 'react'
import {
  usersAPI,
  adminBookingsAPI,
  sessionsAPI,
  branchesAPI,
  workoutsAPI,
} from '../services/api'
import {
  AreaChart,
  Area,
  BarChart,
  Bar,
  CartesianGrid,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
  PieChart,
  Pie,
  Cell,
} from 'recharts'
import {
  Users,
  CalendarCheck,
  MapPin,
  Activity,
  Target,
  RefreshCw,
  Clock3,
  TrendingUp,
} from 'lucide-react'

const PALETTE = ['#22c55e', '#0ea5e9', '#f59e0b', '#6366f1', '#ef4444']

const PRESETS = {
  last7: { label: 'Last 7 days', days: 7 },
  last30: { label: 'Last 30 days', days: 30 },
  last90: { label: 'Last 90 days', days: 90 },
  last365: { label: 'Last 12 months', days: 365 },
  thisYear: { label: 'This year', from: (today) => new Date(today.getFullYear(), 0, 1) },
  all: { label: 'All time', from: null, to: null },
}

const toArray = (payload) => {
  if (!payload) return []
  if (Array.isArray(payload)) return payload
  if (Array.isArray(payload.data)) return payload.data
  if (Array.isArray(payload?.data?.data)) return payload.data.data
  return []
}

const startOfDay = (date = new Date()) => {
  const d = new Date(date)
  d.setHours(0, 0, 0, 0)
  return d
}

const normalizeDateInput = (value) => {
  if (!value) return null
  if (value instanceof Date) return value
  if (typeof value === 'string') {
    const trimmed = value.trim()
    // handle "YYYY-MM-DD" or "YYYY-MM-DD HH:MM:SS"
    if (/^\d{4}-\d{2}-\d{2}$/.test(trimmed)) return `${trimmed}T00:00:00`
    if (/^\d{4}-\d{2}-\d{2}\s+\d{2}:\d{2}:\d{2}/.test(trimmed)) return trimmed.replace(' ', 'T')
    return trimmed
  }
  return value
}

const isoDay = (value) => {
  const parsed = normalizeDateInput(value)
  if (!parsed) return null
  const d = parsed instanceof Date ? parsed : new Date(parsed)
  if (Number.isNaN(d.getTime())) return null
  return d.toISOString().slice(0, 10)
}

const resolveRange = (filter) => {
  const today = startOfDay()
  const todayIso = isoDay(today)

  if (filter.preset && filter.preset !== 'custom') {
    const preset = PRESETS[filter.preset]
    if (preset) {
      const from = preset.days
        ? (() => {
            const d = new Date(today)
            d.setDate(d.getDate() - (preset.days - 1))
            return isoDay(d)
          })()
        : preset.from
        ? isoDay(preset.from(today))
        : null

      const hasTo = Object.prototype.hasOwnProperty.call(preset, 'to')
      const to = hasTo ? (preset.to ? isoDay(preset.to(today)) : null) : todayIso

      return { from, to, label: preset.label }
    }
  }

  const from = filter.from || null
  const to = filter.to || null
  const label = from ? `${from} to ${to || '∞'}` : to ? `Until ${to}` : 'All time'
  return { from, to, label }
}

const isWithinRange = (dateStr, from, to) => {
  const iso = isoDay(dateStr)
  if (!iso) return false
  if (from && iso < from) return false
  if (to && iso > to) return false
  return true
}

const filterByDate = (items, accessor, from, to) => {
  return toArray(items).filter((item) => {
    const raw = typeof accessor === 'function' ? accessor(item) : item?.[accessor]
    return isWithinRange(raw, from, to)
  })
}

const flattenBookings = (bookingsGrouped) => {
  const groups = toArray(bookingsGrouped)
  if (!groups.length) return []

  const flat = []
  groups.forEach((group) => {
    const branchName = group.branch?.name ?? group.branch_name ?? group.name ?? 'Branch'
    const branchId = group.branch?.id ?? group.branch_id ?? group.id

    const sessions = toArray(group.sessions)
    if (sessions.length) {
      sessions.forEach((s) => {
        const session = s.session ?? s
        const bookings = toArray(s.bookings)

        if (bookings.length) {
          bookings.forEach((b) => {
            flat.push({
              branchId,
              branchName,
              sessionId: session?.id,
              sessionTitle: session?.title ?? 'Session',
              sessionDate: session?.session_date,
              maxParticipants: session?.max_participants,
              coachName: session?.coach?.name,
              courseName: session?.course?.name,
              bookedAt: b.booked_at ?? b.created_at ?? session?.session_date,
              userName: b.user?.name,
              userEmail: b.user?.email,
            })
          })
        } else {
          flat.push({
            branchId,
            branchName,
            sessionId: session?.id,
            sessionTitle: session?.title ?? 'Session',
            sessionDate: session?.session_date,
            maxParticipants: session?.max_participants,
            coachName: session?.coach?.name,
            courseName: session?.course?.name,
            bookedAt: session?.session_date,
            userName: null,
            userEmail: null,
          })
        }
      })
    } else if (group.booked_at) {
      flat.push({
        branchId,
        branchName,
        sessionId: group.session_id,
        sessionTitle: group.session_title ?? 'Session',
        sessionDate: group.session_date,
        maxParticipants: group.max_participants,
        courseName: group.course_name,
        coachName: group.coach_name,
        bookedAt: group.booked_at,
        userName: group.user_name,
        userEmail: group.user_email,
      })
    }
  })

  return flat
}

const computeStats = (users, branches, flatBookings, sessions, workouts) => {
  const totalCapacity = toArray(sessions).reduce(
    (sum, s) => sum + (Number.isFinite(s.max_participants) ? s.max_participants : 0),
    0
  )
  const bookedSeats = toArray(flatBookings).length
  const occupancy = totalCapacity ? Math.min(100, Math.round((bookedSeats / totalCapacity) * 100)) : 0

  return {
    members: toArray(users).length,
    branches: toArray(branches).length,
    bookings: bookedSeats,
    upcomingSessions: toArray(sessions).length,
    workoutsInRange: toArray(workouts).length,
    occupancy,
  }
}

const buildBookingsTrend = (flatBookings, range) => {
  const toDate = range.to ? new Date(range.to) : startOfDay()
  const fromDate = range.from
    ? new Date(range.from)
    : (() => {
        const d = new Date(toDate)
        d.setDate(d.getDate() - 29)
        return d
      })()

  const dayMs = 24 * 60 * 60 * 1000
  const totalDays = Math.max(0, Math.min(120, Math.round((toDate - fromDate) / dayMs)))
  const series = []

  for (let i = 0; i <= totalDays; i++) {
    const d = new Date(fromDate)
    d.setDate(d.getDate() + i)
    const key = isoDay(d)
    const count = flatBookings.filter((b) => isWithinRange(b.bookedAt || b.sessionDate, key, key)).length

    series.push({
      label: d.toLocaleDateString('en-US', { month: 'short', day: 'numeric' }),
      bookings: count,
    })
  }

  return series.length ? series : [{ label: '-', bookings: 0 }]
}

const buildBranchLoad = (branches, flatBookings) => {
  const branchMap = {}

  toArray(branches).forEach((b) => {
    branchMap[String(b.id)] = { name: b.name, bookings: 0 }
  })

  toArray(flatBookings).forEach((b) => {
    const key = String(b.branchId ?? 'other')
    if (!branchMap[key]) branchMap[key] = { name: b.branchName ?? 'Branch', bookings: 0 }
    branchMap[key].bookings += 1
  })

  return Object.values(branchMap)
}

const buildCourseMix = (sessions) => {
  const mix = {}
  toArray(sessions).forEach((s) => {
    const key = s.course?.name ?? 'General'
    mix[key] = (mix[key] || 0) + 1
  })
  return Object.entries(mix).map(([name, value]) => ({ name, value }))
}

const buildSessionTimeline = (sessions) => {
  const grouped = {}

  toArray(sessions)
    .filter((s) => s.session_date)
    .forEach((s) => {
      const iso = isoDay(s.session_date)
      if (iso) grouped[iso] = (grouped[iso] || 0) + 1
    })

  const days = Object.keys(grouped)
    .sort()
    .slice(-14)
    .map((iso) => ({
      date: new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric' }),
      sessions: grouped[iso],
    }))

  return days.length ? days : [{ date: '-', sessions: 0 }]
}

export default function Dashboard() {
  const [loading, setLoading] = useState(true)
  const [refreshing, setRefreshing] = useState(false)
  const [errors, setErrors] = useState([])

  const [users, setUsers] = useState([])
  const [branches, setBranches] = useState([])
  const [bookings, setBookings] = useState([])
  const [sessions, setSessions] = useState([])
  const [upcoming, setUpcoming] = useState([])
  const [workouts, setWorkouts] = useState([])

  const [dateFilter, setDateFilter] = useState({ preset: 'all', from: '', to: '' })
  const resolvedRange = useMemo(() => resolveRange(dateFilter), [dateFilter])

  const flatBookings = useMemo(() => flattenBookings(bookings), [bookings])
  const flatBookingsFiltered = useMemo(
    () => filterByDate(flatBookings, (b) => b.bookedAt || b.sessionDate, resolvedRange.from, resolvedRange.to),
    [flatBookings, resolvedRange]
  )
  const usersFiltered = useMemo(
    () => filterByDate(users, 'created_at', resolvedRange.from, resolvedRange.to),
    [users, resolvedRange]
  )
  const workoutsFiltered = useMemo(
    () => filterByDate(workouts, 'created_at', resolvedRange.from, resolvedRange.to),
    [workouts, resolvedRange]
  )
  const sessionsFiltered = useMemo(
    () => filterByDate(sessions, 'session_date', resolvedRange.from, resolvedRange.to),
    [sessions, resolvedRange]
  )

  const stats = useMemo(
    () => computeStats(usersFiltered, branches, flatBookingsFiltered, sessionsFiltered, workoutsFiltered),
    [usersFiltered, branches, flatBookingsFiltered, sessionsFiltered, workoutsFiltered]
  )
  const bookingsTrend = useMemo(
    () => buildBookingsTrend(flatBookingsFiltered, resolvedRange),
    [flatBookingsFiltered, resolvedRange]
  )
  const branchLoad = useMemo(
    () => buildBranchLoad(branches, flatBookingsFiltered),
    [branches, flatBookingsFiltered]
  )
  const courseMix = useMemo(() => buildCourseMix(sessionsFiltered), [sessionsFiltered])
  const sessionTimeline = useMemo(() => buildSessionTimeline(sessionsFiltered), [sessionsFiltered])

  const upcomingList = useMemo(() => {
    const source = toArray(upcoming).length ? toArray(upcoming) : toArray(sessionsFiltered)
    return source
      .filter((s) => s.session_date)
      .sort((a, b) => new Date(a.session_date) - new Date(b.session_date))
      .slice(0, 6)
  }, [upcoming, sessionsFiltered])

  const activityFeed = useMemo(
    () =>
      flatBookingsFiltered
        .filter((b) => b.bookedAt)
        .sort((a, b) => new Date(b.bookedAt) - new Date(a.bookedAt))
        .slice(0, 6),
    [flatBookingsFiltered]
  )

  const loadDashboard = async () => {
    setRefreshing(true)
    setErrors([])
    try {
      const results = await Promise.allSettled([
        usersAPI.list(),
        adminBookingsAPI.list(),
        sessionsAPI.list(),
        branchesAPI.list(),
        workoutsAPI.list(),
        sessionsAPI.upcoming(),
      ])

      const safe = (idx) => (results[idx].status === 'fulfilled' ? results[idx].value : undefined)

      setUsers(toArray(safe(0)))
      setBookings(toArray(safe(1)))
      setSessions(toArray(safe(2)))
      setBranches(toArray(safe(3)))
      setWorkouts(toArray(safe(4)))
      setUpcoming(toArray(safe(5)))

      const errs = results
        .filter((r) => r.status === 'rejected')
        .map((r) => r.reason?.message || 'Request failed')
      if (errs.length) setErrors(errs)
    } catch (err) {
      setErrors([err?.message || 'Unable to load dashboard'])
    } finally {
      setLoading(false)
      setRefreshing(false)
    }
  }

  useEffect(() => {
    loadDashboard()
  }, [])

  const setPreset = (preset) => setDateFilter({ preset, from: '', to: '' })
  const applyCustomRange = () => setDateFilter((prev) => ({ ...prev, preset: 'custom' }))

  if (loading) {
    return (
      <div className="p-6 space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <p className="text-sm text-gray-400 uppercase tracking-wide">Dashboard</p>
            <h1 className="text-2xl font-bold">Loading data…</h1>
          </div>
          <div className="h-10 w-10 border-2 border-brand-500 border-t-transparent rounded-full animate-spin" />
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {[...Array(4)].map((_, i) => (
            <div key={i} className="panel h-28 bg-surface-800 animate-pulse" />
          ))}
        </div>
      </div>
    )
  }

  return (
    <div className="p-6 space-y-6">
      <header className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <p className="text-sm text-gray-400 uppercase tracking-wide">Operations</p>
          <h1 className="text-2xl md:text-3xl font-bold">Fitness platform dashboard</h1>
          <p className="text-gray-500 text-sm">Power BI–style filters across all widgets.</p>
        </div>
        <button
          onClick={loadDashboard}
          className="inline-flex items-center gap-2 px-4 py-2 rounded-xl bg-brand-500 text-black font-semibold shadow-lg shadow-brand-500/25 hover:shadow-brand-500/40 transition-all disabled:opacity-60"
          disabled={refreshing}
        >
          <RefreshCw className={`h-4 w-4 ${refreshing ? 'animate-spin' : ''}`} />
          {refreshing ? 'Refreshing…' : 'Refresh data'}
        </button>
      </header>

      <section className="panel space-y-3">
        <div className="flex flex-wrap items-center gap-3 justify-between">
          <div>
            <p className="text-sm text-gray-400 uppercase tracking-wide">Global date filter</p>
            <div className="text-sm text-gray-300">Showing: {resolvedRange.label}</div>
          </div>
          <div className="flex flex-wrap gap-2">
            {Object.entries(PRESETS).map(([key, cfg]) => (
              <button
                key={key}
                onClick={() => setPreset(key)}
                className={`px-3 py-1.5 rounded-lg text-sm border ${
                  dateFilter.preset === key
                    ? 'border-brand-500 bg-brand-500/10 text-white'
                    : 'border-surface-600 bg-surface-800 text-gray-200 hover:border-brand-500'
                }`}
              >
                {cfg.label}
              </button>
            ))}
          </div>
        </div>
        <div className="flex flex-wrap items-center gap-2">
          <input
            type="date"
            value={dateFilter.from}
            onChange={(e) => setDateFilter((p) => ({ ...p, from: e.target.value }))}
            className="rounded-lg bg-surface-800 border border-surface-600 px-3 py-2 text-sm"
          />
          <span className="text-gray-400">to</span>
          <input
            type="date"
            value={dateFilter.to}
            onChange={(e) => setDateFilter((p) => ({ ...p, to: e.target.value }))}
            className="rounded-lg bg-surface-800 border border-surface-600 px-3 py-2 text-sm"
          />
          <button
            onClick={applyCustomRange}
            className="px-3 py-2 rounded-lg bg-brand-500 text-black text-sm font-semibold"
          >
            Apply custom range
          </button>
        </div>
      </section>

      {errors.length > 0 && (
        <div className="panel border border-red-500/40 bg-red-500/10 text-red-100">
          <div className="font-semibold mb-2">Some requests failed</div>
          <ul className="list-disc list-inside text-sm space-y-1">
            {errors.map((e, i) => (
              <li key={i}>{e}</li>
            ))}
          </ul>
        </div>
      )}

      <section className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-5 gap-4">
        <StatCard title="Members" value={stats.members} icon={Users} hint="Users in range" />
        <StatCard title="Bookings" value={stats.bookings} icon={CalendarCheck} hint="Bookings in range" />
        <StatCard title="Sessions" value={stats.upcomingSessions} icon={Clock3} hint="Sessions in range" />
        <StatCard title="Branches" value={stats.branches} icon={MapPin} hint="Active locations" />
        <StatCard title="Workouts" value={stats.workoutsInRange} icon={Activity} hint="Workouts in range" />
      </section>

      <section className="grid grid-cols-1 xl:grid-cols-3 gap-6">
        <div className="panel xl:col-span-2">
          <div className="flex items-center justify-between mb-4">
            <div>
              <h3 className="font-semibold text-lg">Bookings over time</h3>
              <p className="text-sm text-gray-500">Trend across the selected period.</p>
            </div>
            <div className="px-3 py-1 rounded-full bg-surface-700 text-xs text-gray-300 flex items-center gap-1">
              <TrendingUp className="h-4 w-4" /> {bookingsTrend.reduce((s, d) => s + d.bookings, 0)} total
            </div>
          </div>
          <ResponsiveContainer width="100%" height={260}>
            <AreaChart data={bookingsTrend}>
              <CartesianGrid strokeDasharray="3 3" stroke="#1f2937" />
              <XAxis dataKey="label" stroke="#9ca3af" />
              <YAxis stroke="#9ca3af" allowDecimals={false} />
              <Tooltip />
              <Area type="monotone" dataKey="bookings" stroke="#22c55e" fill="#22c55e" fillOpacity={0.2} />
            </AreaChart>
          </ResponsiveContainer>
        </div>

        <div className="panel">
          <div className="flex items-center justify-between mb-4">
            <h3 className="font-semibold text-lg">Occupancy</h3>
            <Target className="h-5 w-5 text-brand-400" />
          </div>
          <div className="text-4xl font-bold">{stats.occupancy}%</div>
          <p className="text-gray-400 text-sm">Booked seats vs capacity in this period.</p>
          <div className="mt-4 h-3 rounded-full bg-surface-700 overflow-hidden">
            <div
              className="h-full bg-gradient-to-r from-brand-500 to-emerald-400"
              style={{ width: `${stats.occupancy}%` }}
            />
          </div>
          <div className="mt-6">
            <h4 className="font-semibold mb-2 text-sm">Session volume</h4>
            <ResponsiveContainer width="100%" height={130}>
              <BarChart data={sessionTimeline}>
                <CartesianGrid strokeDasharray="3 3" stroke="#1f2937" />
                <XAxis dataKey="date" stroke="#9ca3af" />
                <YAxis stroke="#9ca3af" allowDecimals={false} />
                <Tooltip />
                <Bar dataKey="sessions" fill="#0ea5e9" radius={[6, 6, 0, 0]} />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>
      </section>

      <section className="grid grid-cols-1 xl:grid-cols-3 gap-6">
        <div className="panel xl:col-span-2">
          <div className="flex items-center justify-between mb-4">
            <h3 className="font-semibold text-lg">Branch performance</h3>
            <span className="text-xs text-gray-400">Bookings by branch (filtered)</span>
          </div>
          <ResponsiveContainer width="100%" height={260}>
            <BarChart data={branchLoad}>
              <CartesianGrid strokeDasharray="3 3" stroke="#1f2937" />
              <XAxis dataKey="name" stroke="#9ca3af" />
              <YAxis stroke="#9ca3af" allowDecimals={false} />
              <Tooltip />
              <Bar dataKey="bookings" fill="#6366f1" radius={[6, 6, 0, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </div>
        <div className="panel">
          <div className="flex items-center justify-between mb-4">
            <h3 className="font-semibold text-lg">Course mix</h3>
            <span className="text-xs text-gray-400">{courseMix.length} categories</span>
          </div>
          <ResponsiveContainer width="100%" height={260}>
            <PieChart>
              <Pie
                data={courseMix}
                dataKey="value"
                nameKey="name"
                cx="50%"
                cy="50%"
                outerRadius={90}
                label={({ name, percent }) => `${name} ${(percent * 100).toFixed(0)}%`}
              >
                {courseMix.map((entry, idx) => (
                  <Cell key={entry.name} fill={PALETTE[idx % PALETTE.length]} />
                ))}
              </Pie>
              <Tooltip />
            </PieChart>
          </ResponsiveContainer>
        </div>
      </section>

      <section className="grid grid-cols-1 xl:grid-cols-3 gap-6">
        <div className="panel xl:col-span-2">
          <div className="flex items-center justify-between mb-4">
            <h3 className="font-semibold text-lg">Sessions in range</h3>
            <span className="text-xs text-gray-400">First 6</span>
          </div>
          <div className="divide-y divide-surface-700">
            {upcomingList.length ? (
              upcomingList.map((s) => (
                <div key={s.id} className="py-3 flex justify-between items-start gap-3">
                  <div>
                    <div className="font-semibold">{s.title ?? 'Session'}</div>
                    <div className="text-sm text-gray-400">
                      {s.session_date
                        ? new Date(s.session_date).toLocaleString('en-US', {
                            weekday: 'short',
                            month: 'short',
                            day: 'numeric',
                            hour: '2-digit',
                            minute: '2-digit',
                          })
                        : '—'}
                    </div>
                    <div className="text-xs text-gray-500">
                      {s.branch?.name ?? 'Branch'} • {s.course?.name ?? 'Course'} • {s.coach?.name ?? 'Coach'}
                    </div>
                  </div>
                  <div className="text-right">
                    <div className="text-sm text-gray-400">Capacity</div>
                    <div className="font-semibold">
                      {s.users_count ?? 0}/{s.max_participants ?? '∞'}
                    </div>
                  </div>
                </div>
              ))
            ) : (
              <div className="py-6 text-center text-gray-500">No sessions in this range.</div>
            )}
          </div>
        </div>

        <div className="panel">
          <div className="flex items-center justify-between mb-4">
            <h3 className="font-semibold text-lg">Latest bookings</h3>
            <span className="text-xs text-gray-400">Filtered by date</span>
          </div>
          <div className="space-y-3">
            {activityFeed.length ? (
              activityFeed.map((a, idx) => (
                <div key={idx} className="p-3 rounded-lg bg-surface-800 border border-surface-700">
                  <div className="flex justify-between items-center">
                    <div className="font-semibold text-sm">{a.sessionTitle ?? 'Session'}</div>
                    <div className="text-xs text-gray-400">
                      {a.bookedAt ? new Date(a.bookedAt).toLocaleString() : '—'}
                    </div>
                  </div>
                  <div className="text-xs text-gray-400">
                    {a.branchName} • {a.courseName ?? 'Course'} • {a.userName ?? 'Member'}
                  </div>
                </div>
              ))
            ) : (
              <div className="py-6 text-center text-gray-500">No booking activity in this range.</div>
            )}
          </div>
        </div>
      </section>
    </div>
  )
}

function StatCard({ title, value, icon: Icon, hint }) {
  return (
    <div className="panel flex items-start justify-between">
      <div>
        <p className="text-xs uppercase text-gray-400 tracking-wide">{title}</p>
        <div className="text-3xl font-bold mt-2">{value}</div>
        <p className="text-xs text-gray-500 mt-1">{hint}</p>
      </div>
      <div className="h-10 w-10 rounded-xl bg-brand-500/10 text-brand-400 flex items-center justify-center">
        <Icon className="h-5 w-5" />
      </div>
    </div>
  )
}
