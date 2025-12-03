import { useState, useEffect } from 'react'
import { Outlet } from 'react-router-dom'
import Sidebar from './Sidebar.jsx'
import Navbar from './Navbar.jsx'

export default function Layout() {
  const [sidebarOpen, setSidebarOpen] = useState(false)
  const [dark, setDark] = useState(false)

  useEffect(() => {
    const saved = localStorage.getItem('prefers-dark')
    const prefersSystem = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches
    const shouldEnable = saved === null ? prefersSystem : saved === 'true'
    setDark(shouldEnable)
    document.documentElement.classList.toggle('dark', shouldEnable)
  }, [])

  const toggleDark = () => {
    setDark((d) => {
      const next = !d
      localStorage.setItem('prefers-dark', String(next))
      document.documentElement.classList.toggle('dark', next)
      return next
    })
  }

  return (
    <div className="h-full flex">
      <Sidebar open={sidebarOpen} onClose={() => setSidebarOpen(false)} />
      <div className="flex-1 flex flex-col min-w-0">
        <Navbar onToggleSidebar={() => setSidebarOpen((s) => !s)} dark={dark} onToggleDark={toggleDark} />
        <main className="p-4 md:p-6 lg:p-8 overflow-auto">
          <Outlet />
        </main>
      </div>
    </div>
  )
}
