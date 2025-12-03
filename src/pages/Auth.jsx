import { useState } from 'react'
import { useAuth } from '../context/AuthContext'
import { useNavigate } from 'react-router-dom'

export default function Auth() {
  const { login, register } = useAuth()
  const nav = useNavigate()

  const [isLogin, setIsLogin] = useState(true)
  const [loading, setLoading] = useState(false)
  const [form, setForm] = useState({ name:'', email:'', password:'', confirm:'' })
  const [error, setError] = useState('')

  const handle = (k, v) => setForm(s => ({ ...s, [k]: v }))

  const validateEmail = (e) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(e)
  const validatePassword = (p) => p.length >= 8 && /[0-9]/.test(p) && /[A-Z]/.test(p) && /[a-z]/.test(p)

  const submit = async () => {
    setError('')

    const email = form.email.trim()
    const password = form.password

    if (!validateEmail(email)) { 
      setError('Invalid email') 
      return 
    }

    if (isLogin) {
      if (!password) { 
        setError('Password is required') 
        return 
      }
    } else {
      if (!form.name.trim()) { setError('Name is required'); return }
      if (password !== form.confirm) { setError('Passwords do not match'); return }

      if (!validatePassword(password)) { 
        setError('Password must be 8+ chars with upper/lower/number') 
        return 
      }
    }

    setLoading(true)
    try {
      if (isLogin) {
        const me = await login(email, password)
        const role = String((me && (me.role ?? me?.data?.role ?? me?.user?.role)) || '').toLowerCase()
        if (role !== 'admin') throw new Error('Admin role required')
      } else {
        const me = await register({
          name: form.name.trim(),
          email,
          password,
          password_confirmation: form.confirm
        })
        if (String(me.role).toLowerCase() !== 'admin') throw new Error('Admin role required')
      }
      nav('/', { replace: true })
    } catch (e) {
      setError(e?.response?.data?.message || e.message || 'Error')
    } finally {
      setLoading(false)
    }
  }


  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-50 via-white to-slate-100 dark:from-surface-900 dark:via-surface-800 dark:to-surface-900 p-4">
      <div className="w-full max-w-md panel">
        <h1 className="text-center text-3xl font-extrabold text-brand-500">Fitness Admin</h1>

        <div className="mt-6 grid grid-cols-2 rounded-full border-2 border-brand-500 overflow-hidden">
          <button
            className={`py-2 font-semibold ${isLogin ? 'bg-brand-500 text-white' : 'bg-white text-gray-700 dark:bg-surface-700 dark:text-gray-300'}`}
            onClick={() => setIsLogin(true)}
          >Login</button>
          <button
            className={`py-2 font-semibold ${!isLogin ? 'bg-brand-500 text-white' : 'bg-white text-gray-700 dark:bg-surface-700 dark:text-gray-300'}`}
            onClick={() => setIsLogin(false)}
          >Register</button>
        </div>

        {!isLogin && (
          <div className="mt-5">
            <label className="text-sm text-gray-600 dark:text-gray-300">Full Name</label>
            <input
              className="mt-1 w-full rounded-lg bg-white dark:bg-surface-600 px-3 py-2 text-gray-900 dark:text-white outline-none border border-gray-200 dark:border-surface-600 focus:border-brand-500"
              placeholder="Your name"
              value={form.name}
              onChange={e => handle('name', e.target.value)}
            />
          </div>
        )}

        <div className="mt-4">
          <label className="text-sm text-gray-600 dark:text-gray-300">Email</label>
          <input
            className="mt-1 w-full rounded-lg bg-white dark:bg-surface-600 px-3 py-2 text-gray-900 dark:text-white outline-none border border-gray-200 dark:border-surface-600 focus:border-brand-500"
            placeholder="you@example.com" type="email"
            value={form.email}
            onChange={e => handle('email', e.target.value)}
          />
        </div>

        <div className="mt-4">
          <label className="text-sm text-gray-600 dark:text-gray-300">Password</label>
          <input
            className="mt-1 w-full rounded-lg bg-white dark:bg-surface-600 px-3 py-2 text-gray-900 dark:text-white outline-none border border-gray-200 dark:border-surface-600 focus:border-brand-500"
            placeholder="********" type="password"
            value={form.password}
            onChange={e => handle('password', e.target.value)}
          />
        </div>

        {!isLogin && (
          <div className="mt-4">
            <label className="text-sm text-gray-600 dark:text-gray-300">Confirm Password</label>
            <input
              className="mt-1 w-full rounded-lg bg-white dark:bg-surface-600 px-3 py-2 text-gray-900 dark:text-white outline-none border border-gray-200 dark:border-surface-600 focus:border-brand-500"
              placeholder="********" type="password"
              value={form.confirm}
              onChange={e => handle('confirm', e.target.value)}
            />
            <p className="mt-2 text-xs text-brand-400">Must include uppercase, lowercase and a number.</p>
          </div>
        )}

        {error && <div className="mt-4 rounded-lg bg-red-900/40 border border-red-700 px-3 py-2 text-red-200 text-sm">{error}</div>}

        <button
          onClick={submit}
          disabled={loading}
          className="mt-6 w-full rounded-full bg-brand-500 hover:bg-brand-400 text-surface-900 font-extrabold py-3 disabled:opacity-70"
        >
          {loading ? 'Loading...' : (isLogin ? 'Login' : 'Register')}
        </button>
      </div>
    </div>
  )
}
