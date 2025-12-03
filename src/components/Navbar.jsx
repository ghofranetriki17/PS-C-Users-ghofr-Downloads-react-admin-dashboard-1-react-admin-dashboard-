import { Moon, Sun, Bell, Search, PanelLeft, Menu } from 'lucide-react'
import { useState, useRef, useEffect } from 'react'
import AvatarMenu from './atoms/AvatarMenu.jsx'
import { useAuth } from '../context/AuthContext'

export default function Navbar({ onToggleSidebar, dark, onToggleDark }) {
  const [notifOpen, setNotifOpen] = useState(false)
  const notifRef = useRef(null)
  const { logout } = useAuth()

  useEffect(() => {
    const handler = (e) => { if (!notifRef.current?.contains(e.target)) setNotifOpen(false) }
    window.addEventListener('click', handler)
    return () => window.removeEventListener('click', handler)
  }, [])

  return (
    <header className="sticky top-0 z-30 border-b border-gray-200 dark:border-surface-600 bg-white/80 dark:bg-surface-900/80 backdrop-blur">
      <div className="flex items-center gap-2 px-4 md:px-6 h-16">
        <button className="md:hidden p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-surface-700" onClick={onToggleSidebar} aria-label="Toggle sidebar">
          <PanelLeft className="h-5 w-5" />
        </button>

        <div className="hidden md:flex items-center gap-3 text-brand-500 font-semibold">
          <div className="h-9 w-9 rounded-xl bg-brand-500/10 text-brand-600 dark:text-brand-400 flex items-center justify-center">
            <Menu className="h-5 w-5" />
          </div>
          <span>Gym Admin</span>
        </div>

        <div className="flex-1" />

        <div className="hidden md:flex items-center gap-2 max-w-md w-full">
          <div className="relative w-full">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-400 dark:text-gray-500" />
            <input
              className="w-full pl-9 pr-3 py-2 rounded-xl bg-gray-100 dark:bg-surface-800 border border-gray-200 dark:border-surface-700 outline-none focus:ring-2 focus:ring-brand-500 text-gray-900 dark:text-gray-100"
              placeholder="Search workouts, users, sessions"
            />
          </div>
        </div>

        <div className="flex items-center gap-2 ml-2">
          <button className="p-2 rounded-lg hover:bg-surface-700" onClick={onToggleDark} aria-label="Toggle theme">
            {dark ? <Sun className="h-5 w-5" /> : <Moon className="h-5 w-5" />}
          </button>

          <div className="relative" ref={notifRef}>
            <button className="p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-surface-700 relative" onClick={() => setNotifOpen(o => !o)} aria-haspopup="menu" aria-expanded={notifOpen}>
              <Bell className="h-5 w-5" />
              <span className="absolute -top-0.5 -right-0.5 h-2 w-2 bg-brand-500 rounded-full" />
            </button>

            {notifOpen && (
              <div className="absolute right-0 mt-2 w-72 rounded-xl border border-gray-200 dark:border-surface-600 bg-white dark:bg-surface-900 shadow-xl overflow-hidden">
                <div className="px-4 py-2 text-sm font-semibold border-b border-gray-200 dark:border-surface-600">Notifications</div>
                <ul className="max-h-80 overflow-auto divide-y divide-gray-100 dark:divide-surface-700">
                  <li className="p-3 text-sm hover:bg-gray-50 dark:hover:bg-surface-800">New booking confirmed for Session #102</li>
                  <li className="p-3 text-sm hover:bg-gray-50 dark:hover:bg-surface-800">Coach Amine updated availability</li>
                  <li className="p-3 text-sm hover:bg-gray-50 dark:hover:bg-surface-800">3 workouts completed today 🎉</li>
                </ul>
              </div>
            )}
          </div>

          <button onClick={logout} className="px-3 py-2 rounded-lg bg-brand-500 text-white font-semibold hover:bg-brand-400 shadow-sm">
            Logout
          </button>

          <AvatarMenu />
        </div>
      </div>
    </header>
  )
}
