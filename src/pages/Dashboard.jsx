import { useState, useEffect } from 'react'
import { usersAPI, adminBookingsAPI, sessionsAPI, workoutsAPI, branchesAPI } from '../services/api'
import {
  BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer,
  PieChart, Pie, Cell, LineChart, Line, AreaChart, Area
} from 'recharts'

const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#8884D8']

export default function Dashboard() {
  const [stats, setStats] = useState({
    activeUsers: 0,
    totalBookings: 0,
    workoutsToday: 0,
    revenue: 0,
    loading: true
  })
  const [chartData, setChartData] = useState({
    userGrowth: [],
    bookingTrends: [],
    sessionTypes: [],
    branchPerformance: []
  })
  const [recentActivity, setRecentActivity] = useState([])

  useEffect(() => {
    loadDashboardData()
  }, [])

  const loadDashboardData = async () => {
    try {
      setStats(prev => ({ ...prev, loading: true }))

      // Fetch all data in parallel
      const [usersData, bookingsData, sessionsData, workoutsData, branchesData] = await Promise.all([
        usersAPI.list(),
        adminBookingsAPI.list(),
        sessionsAPI.list(),
        workoutsAPI.list(),
        branchesAPI.list()
      ])

      // Calculate stats
      const activeUsers = Array.isArray(usersData) ? usersData.length : 0
      const totalBookings = Array.isArray(bookingsData) ? bookingsData.length : 0
      
      // Calculate today's workouts (mock - you might need actual date filtering)
      const today = new Date().toISOString().split('T')[0]
      const workoutsToday = Array.isArray(workoutsData) ? 
        workoutsData.filter(w => w.created_at?.includes(today)).length : 0

      // Mock revenue calculation (you'll need actual payment data)
      const revenue = totalBookings * 25 // Assuming average $25 per booking

      setStats({
        activeUsers,
        totalBookings,
        workoutsToday,
        revenue,
        loading: false
      })

      // Prepare chart data
      prepareChartData(usersData, bookingsData, sessionsData, branchesData)
      prepareRecentActivity(bookingsData, sessionsData)

    } catch (error) {
      console.error('Error loading dashboard data:', error)
      setStats(prev => ({ ...prev, loading: false }))
    }
  }

  const prepareChartData = (users, bookings, sessions, branches) => {
    // User growth over time (last 7 days mock data)
    const userGrowth = generateLast7DaysData(users, 'created_at')
    
    // Booking trends (last 7 days)
    const bookingTrends = generateLast7DaysData(bookings, 'created_at')
    
    // Session types distribution
    const sessionTypes = calculateSessionTypes(sessions)
    
    // Branch performance
    const branchPerformance = calculateBranchPerformance(branches, bookings)

    setChartData({
      userGrowth,
      bookingTrends,
      sessionTypes,
      branchPerformance
    })
  }

  const generateLast7DaysData = (data, dateField) => {
    const days = []
    for (let i = 6; i >= 0; i--) {
      const date = new Date()
      date.setDate(date.getDate() - i)
      const dateStr = date.toISOString().split('T')[0]
      
      const count = Array.isArray(data) ? 
        data.filter(item => item[dateField]?.includes(dateStr)).length : 0
      
      days.push({
        date: date.toLocaleDateString('en-US', { weekday: 'short' }),
        count
      })
    }
    return days
  }

  const calculateSessionTypes = (sessions) => {
    if (!Array.isArray(sessions)) return []
    
    const typeCount = sessions.reduce((acc, session) => {
      const type = session.course_type || 'General'
      acc[type] = (acc[type] || 0) + 1
      return acc
    }, {})

    return Object.entries(typeCount).map(([name, value]) => ({ name, value }))
  }

  const calculateBranchPerformance = (branches, bookings) => {
    if (!Array.isArray(branches) || !Array.isArray(bookings)) return []
    
    return branches.map(branch => {
      const branchBookings = bookings.filter(booking => 
        booking.branch_id === branch.id
      ).length
      
      return {
        name: branch.name,
        bookings: branchBookings,
        revenue: branchBookings * 25 // Mock revenue calculation
      }
    })
  }

  const prepareRecentActivity = (bookings, sessions) => {
    const activities = []
    
    // Recent bookings
    if (Array.isArray(bookings)) {
      const recentBookings = bookings.slice(0, 3)
      recentBookings.forEach(booking => {
        activities.push({
          type: 'booking',
          message: `✅ User booked ${booking.session_name || 'session'}`,
          time: booking.created_at
        })
      })
    }

    // Recent sessions
    if (Array.isArray(sessions)) {
      const recentSessions = sessions.slice(0, 2)
      recentSessions.forEach(session => {
        activities.push({
          type: 'session',
          message: `🕒 New session: ${session.name || 'Training Session'}`,
          time: session.created_at
        })
      })
    }

    // Sort by time and limit to 5 activities
    activities.sort((a, b) => new Date(b.time) - new Date(a.time))
    setRecentActivity(activities.slice(0, 5))
  }

  if (stats.loading) {
    return (
      <div className="space-y-6">
        <h1 className="text-2xl md:text-3xl font-bold">Dashboard Overview</h1>
        <div className="flex justify-center items-center h-64">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-brand-500"></div>
        </div>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h1 className="text-2xl md:text-3xl font-bold">Dashboard Overview</h1>
        <button 
          onClick={loadDashboardData}
          className="px-4 py-2 bg-brand-500 text-white rounded-lg hover:bg-brand-600 transition-colors"
        >
          Refresh Data
        </button>
      </div>

      {/* Stats Cards */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <StatCard 
          title="Active Users" 
          value={stats.activeUsers} 
          change="+12%"
          icon="👥"
        />
        <StatCard 
          title="Total Bookings" 
          value={stats.totalBookings} 
          change="+8%"
          icon="📅"
        />
        <StatCard 
          title="Workouts Today" 
          value={stats.workoutsToday} 
          change="+5%"
          icon="💪"
        />
        <StatCard 
          title="Revenue" 
          value={`$${stats.revenue.toLocaleString()}`} 
          change="+15%"
          icon="💰"
        />
      </div>

      {/* Charts Grid */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* User Growth Chart */}
        <ChartCard title="User Growth (Last 7 Days)">
          <ResponsiveContainer width="100%" height={300}>
            <AreaChart data={chartData.userGrowth}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="date" />
              <YAxis />
              <Tooltip />
              <Area type="monotone" dataKey="count" stroke="#0088FE" fill="#0088FE" fillOpacity={0.3} />
            </AreaChart>
          </ResponsiveContainer>
        </ChartCard>

        {/* Booking Trends */}
        <ChartCard title="Booking Trends (Last 7 Days)">
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={chartData.bookingTrends}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="date" />
              <YAxis />
              <Tooltip />
              <Bar dataKey="count" fill="#00C49F" />
            </BarChart>
          </ResponsiveContainer>
        </ChartCard>

        {/* Session Types Distribution */}
        <ChartCard title="Session Types Distribution">
          <ResponsiveContainer width="100%" height={300}>
            <PieChart>
              <Pie
                data={chartData.sessionTypes}
                cx="50%"
                cy="50%"
                labelLine={false}
                label={({ name, percent }) => `${name} ${(percent * 100).toFixed(0)}%`}
                outerRadius={80}
                fill="#8884d8"
                dataKey="value"
              >
                {chartData.sessionTypes.map((entry, index) => (
                  <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                ))}
              </Pie>
              <Tooltip />
            </PieChart>
          </ResponsiveContainer>
        </ChartCard>

        {/* Branch Performance */}
        <ChartCard title="Branch Performance">
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={chartData.branchPerformance}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="name" />
              <YAxis />
              <Tooltip />
              <Legend />
              <Bar dataKey="bookings" fill="#8884d8" name="Bookings" />
              <Bar dataKey="revenue" fill="#82ca9d" name="Revenue ($)" />
            </BarChart>
          </ResponsiveContainer>
        </ChartCard>
      </div>

      {/* Recent Activity */}
      <section className="rounded-xl border border-gray-200 dark:border-gray-800 p-6">
        <div className="font-semibold mb-4 text-lg">Recent Activity</div>
        <div className="space-y-3">
          {recentActivity.length > 0 ? (
            recentActivity.map((activity, index) => (
              <div key={index} className="flex items-center space-x-3 p-3 bg-gray-50 dark:bg-gray-800 rounded-lg">
                <span className="text-lg">{activity.message.split(' ')[0]}</span>
                <div className="flex-1">
                  <p className="text-sm">{activity.message}</p>
                  <p className="text-xs text-gray-500">
                    {new Date(activity.time).toLocaleString()}
                  </p>
                </div>
              </div>
            ))
          ) : (
            <p className="text-gray-500 text-center py-4">No recent activity</p>
          )}
        </div>
      </section>
    </div>
  )
}

// Stat Card Component
function StatCard({ title, value, change, icon }) {
  const isPositive = change.startsWith('+')
  
  return (
    <div className="p-6 rounded-xl border border-gray-200 dark:border-gray-800 bg-white dark:bg-gray-900 shadow-sm">
      <div className="flex justify-between items-start">
        <div>
          <div className="text-sm text-gray-500 font-medium">{title}</div>
          <div className="mt-2 text-3xl font-bold text-gray-900 dark:text-white">
            {value}
          </div>
        </div>
        <div className="text-2xl">{icon}</div>
      </div>
      <div className={`mt-2 text-sm font-medium ${isPositive ? 'text-green-600' : 'text-red-600'}`}>
        {change} from last week
      </div>
    </div>
  )
}

// Chart Card Component
function ChartCard({ title, children }) {
  return (
    <div className="p-6 rounded-xl border border-gray-200 dark:border-gray-800 bg-white dark:bg-gray-900 shadow-sm">
      <h3 className="font-semibold mb-4 text-gray-900 dark:text-white">{title}</h3>
      {children}
    </div>
  )
}