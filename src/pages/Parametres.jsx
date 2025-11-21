import { useState, useEffect } from 'react'
import { parametresAPI } from '../services/api'
import {
  Save, Plus, Trash2, Settings, Globe, Mail, 
  Phone, Facebook, Instagram, Linkedin, Image, FileText
} from 'lucide-react'
import clsx from 'clsx'

const GROUPES = [
  { value: 'site', label: 'Site', icon: <Globe className="h-4 w-4" /> },
  { value: 'contact', label: 'Contact', icon: <Mail className="h-4 w-4" /> },
  { value: 'social', label: 'Réseaux Sociaux', icon: <Facebook className="h-4 w-4" /> },
  { value: 'seo', label: 'SEO', icon: <FileText className="h-4 w-4" /> },
  { value: 'general', label: 'Général', icon: <Settings className="h-4 w-4" /> },
]

const TYPES = [
  { value: 'text', label: 'Texte' },
  { value: 'textarea', label: 'Texte long' },
  { value: 'number', label: 'Nombre' },
  { value: 'boolean', label: 'Booléen' },
  { value: 'image', label: 'Image URL' },
  { value: 'file', label: 'Fichier URL' },
  { value: 'json', label: 'JSON' },
]

export default function Parametres() {
  const [parametres, setParametres] = useState([])
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [selectedGroupe, setSelectedGroupe] = useState('site')
  const [showAddModal, setShowAddModal] = useState(false)
  const [editingParam, setEditingParam] = useState(null)
  const [newParam, setNewParam] = useState({
    cle: '',
    valeur: '',
    type: 'text',
    groupe: 'site',
    description: ''
  })

  useEffect(() => {
    loadParametres()
  }, [selectedGroupe])

  const loadParametres = async () => {
    try {
      setLoading(true)
      const response = await parametresAPI.list({ groupe: selectedGroupe })
      setParametres(response.data || [])
    } catch (error) {
      console.error('Erreur chargement paramètres:', error)
    } finally {
      setLoading(false)
    }
  }

  const handleSave = async (param) => {
    try {
      setSaving(true)
      await parametresAPI.update(param.id, {
        valeur: param.valeur,
        type: param.type,
        description: param.description
      })
      alert('Paramètre mis à jour avec succès')
      loadParametres()
    } catch (error) {
      console.error('Erreur sauvegarde:', error)
      alert('Erreur lors de la sauvegarde')
    } finally {
      setSaving(false)
    }
  }

  const handleBulkSave = async () => {
    try {
      setSaving(true)
      const parametresToUpdate = parametres.map(p => ({
        cle: p.cle,
        valeur: p.valeur,
        type: p.type,
        groupe: p.groupe,
        description: p.description
      }))
      
      await parametresAPI.bulkUpdate(parametresToUpdate)
      alert('Tous les paramètres ont été sauvegardés')
      loadParametres()
    } catch (error) {
      console.error('Erreur sauvegarde:', error)
      alert('Erreur lors de la sauvegarde')
    } finally {
      setSaving(false)
    }
  }

  const handleCreate = async () => {
    try {
      setSaving(true)
      await parametresAPI.createOrUpdate(newParam)
      alert('Paramètre créé avec succès')
      setShowAddModal(false)
      setNewParam({
        cle: '',
        valeur: '',
        type: 'text',
        groupe: selectedGroupe,
        description: ''
      })
      loadParametres()
    } catch (error) {
      console.error('Erreur création:', error)
      alert('Erreur lors de la création')
    } finally {
      setSaving(false)
    }
  }

  const handleDelete = async (id) => {
    if (!confirm('Êtes-vous sûr de vouloir supprimer ce paramètre ?')) return
    
    try {
      await parametresAPI.delete(id)
      alert('Paramètre supprimé')
      loadParametres()
    } catch (error) {
      console.error('Erreur suppression:', error)
      alert('Erreur lors de la suppression')
    }
  }

  const handleValueChange = (id, value) => {
    setParametres(parametres.map(p => 
      p.id === id ? { ...p, valeur: value } : p
    ))
  }

  const renderInput = (param) => {
    const commonClass = "w-full px-3 py-2 bg-surface-700 border border-surface-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-brand-500"

    switch (param.type) {
      case 'textarea':
        return (
          <textarea
            value={param.valeur || ''}
            onChange={(e) => handleValueChange(param.id, e.target.value)}
            className={clsx(commonClass, 'min-h-[100px]')}
            placeholder={param.description}
          />
        )
      
      case 'boolean':
        return (
          <label className="flex items-center gap-3 cursor-pointer">
            <input
              type="checkbox"
              checked={param.valeur === 'true' || param.valeur === true}
              onChange={(e) => handleValueChange(param.id, e.target.checked.toString())}
              className="w-5 h-5 rounded border-surface-600 bg-surface-700 text-brand-500 focus:ring-2 focus:ring-brand-500"
            />
            <span className="text-sm text-gray-300">
              {param.valeur === 'true' || param.valeur === true ? 'Activé' : 'Désactivé'}
            </span>
          </label>
        )
      
      case 'number':
        return (
          <input
            type="number"
            value={param.valeur || ''}
            onChange={(e) => handleValueChange(param.id, e.target.value)}
            className={commonClass}
            placeholder={param.description}
          />
        )
      
      default:
        return (
          <input
            type="text"
            value={param.valeur || ''}
            onChange={(e) => handleValueChange(param.id, e.target.value)}
            className={commonClass}
            placeholder={param.description}
          />
        )
    }
  }

  return (
    <div className="p-6">
      {/* Header */}
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-gray-100">Paramètres du Site</h1>
          <p className="text-sm text-gray-400 mt-1">Gérez les paramètres statiques de votre application</p>
        </div>
        <div className="flex gap-2">
          <button
            onClick={() => setShowAddModal(true)}
            className="flex items-center gap-2 px-4 py-2 bg-brand-500 hover:bg-brand-600 text-white rounded-lg text-sm font-medium transition-colors"
          >
            <Plus className="h-4 w-4" />
            Ajouter
          </button>
          <button
            onClick={handleBulkSave}
            disabled={saving}
            className="flex items-center gap-2 px-4 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg text-sm font-medium transition-colors disabled:opacity-50"
          >
            <Save className="h-4 w-4" />
            {saving ? 'Sauvegarde...' : 'Tout Sauvegarder'}
          </button>
        </div>
      </div>

      {/* Groupes */}
      <div className="flex gap-2 mb-6 overflow-x-auto pb-2">
        {GROUPES.map((groupe) => (
          <button
            key={groupe.value}
            onClick={() => setSelectedGroupe(groupe.value)}
            className={clsx(
              'flex items-center gap-2 px-4 py-2 rounded-lg text-sm font-medium whitespace-nowrap transition-colors',
              selectedGroupe === groupe.value
                ? 'bg-brand-500 text-white'
                : 'bg-surface-700 text-gray-300 hover:bg-surface-600'
            )}
          >
            {groupe.icon}
            {groupe.label}
          </button>
        ))}
      </div>

      {/* Liste des paramètres */}
      {loading ? (
        <div className="flex items-center justify-center h-64">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-brand-500"></div>
        </div>
      ) : (
        <div className="space-y-4">
          {parametres.length === 0 ? (
            <div className="text-center py-12 bg-surface-800 rounded-xl border border-surface-600">
              <Settings className="h-12 w-12 text-gray-500 mx-auto mb-3" />
              <p className="text-gray-400">Aucun paramètre dans ce groupe</p>
              <button
                onClick={() => setShowAddModal(true)}
                className="mt-4 text-brand-400 hover:text-brand-300 text-sm font-medium"
              >
                Créer le premier paramètre
              </button>
            </div>
          ) : (
            parametres.map((param) => (
              <div
                key={param.id}
                className="bg-surface-800 border border-surface-600 rounded-xl p-4"
              >
                <div className="flex items-start justify-between mb-3">
                  <div className="flex-1">
                    <div className="flex items-center gap-2 mb-1">
                      <h3 className="font-semibold text-gray-100">{param.cle}</h3>
                      <span className="px-2 py-0.5 bg-surface-700 text-brand-400 text-xs rounded-md">
                        {param.type}
                      </span>
                    </div>
                    {param.description && (
                      <p className="text-sm text-gray-400">{param.description}</p>
                    )}
                  </div>
                  <button
                    onClick={() => handleDelete(param.id)}
                    className="p-2 hover:bg-red-500/10 text-red-400 hover:text-red-300 rounded-lg transition-colors"
                  >
                    <Trash2 className="h-4 w-4" />
                  </button>
                </div>
                
                <div className="space-y-2">
                  {renderInput(param)}
                  
                  <button
                    onClick={() => handleSave(param)}
                    disabled={saving}
                    className="flex items-center gap-2 px-3 py-1.5 bg-surface-700 hover:bg-surface-600 text-gray-300 rounded-lg text-sm transition-colors disabled:opacity-50"
                  >
                    <Save className="h-3 w-3" />
                    Sauvegarder
                  </button>
                </div>
              </div>
            ))
          )}
        </div>
      )}

      {/* Modal Ajouter */}
      {showAddModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-surface-800 rounded-xl border border-surface-600 w-full max-w-md">
            <div className="p-6 border-b border-surface-600">
              <h2 className="text-xl font-bold text-gray-100">Nouveau Paramètre</h2>
            </div>
            
            <div className="p-6 space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">
                  Clé *
                </label>
                <input
                  type="text"
                  value={newParam.cle}
                  onChange={(e) => setNewParam({ ...newParam, cle: e.target.value })}
                  className="w-full px-3 py-2 bg-surface-700 border border-surface-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-brand-500"
                  placeholder="ex: site_nom"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">
                  Type *
                </label>
                <select
                  value={newParam.type}
                  onChange={(e) => setNewParam({ ...newParam, type: e.target.value })}
                  className="w-full px-3 py-2 bg-surface-700 border border-surface-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-brand-500"
                >
                  {TYPES.map((type) => (
                    <option key={type.value} value={type.value}>
                      {type.label}
                    </option>
                  ))}
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">
                  Groupe *
                </label>
                <select
                  value={newParam.groupe}
                  onChange={(e) => setNewParam({ ...newParam, groupe: e.target.value })}
                  className="w-full px-3 py-2 bg-surface-700 border border-surface-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-brand-500"
                >
                  {GROUPES.map((groupe) => (
                    <option key={groupe.value} value={groupe.value}>
                      {groupe.label}
                    </option>
                  ))}
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">
                  Valeur
                </label>
                <input
                  type="text"
                  value={newParam.valeur}
                  onChange={(e) => setNewParam({ ...newParam, valeur: e.target.value })}
                  className="w-full px-3 py-2 bg-surface-700 border border-surface-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-brand-500"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">
                  Description
                </label>
                <textarea
                  value={newParam.description}
                  onChange={(e) => setNewParam({ ...newParam, description: e.target.value })}
                  className="w-full px-3 py-2 bg-surface-700 border border-surface-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-brand-500"
                  rows="3"
                />
              </div>
            </div>

            <div className="p-6 border-t border-surface-600 flex gap-3">
              <button
                onClick={() => setShowAddModal(false)}
                className="flex-1 px-4 py-2 bg-surface-700 hover:bg-surface-600 text-gray-300 rounded-lg text-sm font-medium transition-colors"
              >
                Annuler
              </button>
              <button
                onClick={handleCreate}
                disabled={!newParam.cle || saving}
                className="flex-1 px-4 py-2 bg-brand-500 hover:bg-brand-600 text-white rounded-lg text-sm font-medium transition-colors disabled:opacity-50"
              >
                {saving ? 'Création...' : 'Créer'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}