import React, { useState, useEffect } from "react";
import { videosAPI } from "../services/api"; // chemin vers ton fichier api.js

export default function Videos() {
  const [videos, setVideos] = useState([]);
  const [form, setForm] = useState({
    coach_id: "",
    title: "",
    description: "",
    video_url: "",
  });
  const [loading, setLoading] = useState(false);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");

  const toArray = (payload) => {
    if (Array.isArray(payload)) return payload;
    if (Array.isArray(payload?.data)) return payload.data;
    if (Array.isArray(payload?.videos)) return payload.videos;
    return [];
  };

  // Récupération des vidéos depuis l'API
  const fetchVideos = async () => {
    try {
      setLoading(true);
      const res = await videosAPI.list();
      setVideos(toArray(res));
      setError("");
    } catch (err) {
      console.error(err);
      setError("Erreur lors du chargement des vidéos.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchVideos();
  }, []);

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    if (!form.coach_id || !form.title || !form.video_url) {
      setError("Veuillez remplir tous les champs obligatoires !");
      return;
    }
    try {
      setSaving(true);
      const res = await videosAPI.create(form);
      const created = res?.data ?? res;
      if (created) {
        setVideos((prev) => [created, ...prev]);
        setForm({ coach_id: "", title: "", description: "", video_url: "" });
      } else {
        setError("Erreur lors de l'ajout de la vidéo.");
      }
    } catch (err) {
      console.error(err);
      setError(err?.response?.data?.message || "Erreur API lors de l'ajout.");
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async (id) => {
    if (!window.confirm("Supprimer cette vidéo ?")) return;
    setError("");
    try {
      const res = await videosAPI.delete(id);
      const ok = res?.success !== false;
      if (ok) {
        setVideos((prev) => prev.filter((v) => v.id !== id));
      } else {
        setError("Erreur lors de la suppression.");
      }
    } catch (err) {
      console.error(err);
      setError(err?.response?.data?.message || "Erreur API lors de la suppression.");
    }
  };

  return (
    <div className="space-y-6 p-6">
      <div className="flex flex-col gap-2 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">Gestion des vidéos</h1>
          <p className="text-sm text-gray-500 dark:text-gray-400">Ajoutez, consultez ou supprimez les vidéos d'entraînement.</p>
        </div>
        <button
          onClick={fetchVideos}
          className="px-4 py-2 rounded-lg bg-gray-100 dark:bg-surface-800 border border-gray-200 dark:border-surface-700 hover:bg-gray-200 dark:hover:bg-surface-700 text-sm"
        >
          Rafraîchir
        </button>
      </div>

      {error && (
        <div className="panel bg-red-50 border-red-200 text-red-700 dark:bg-red-900/30 dark:border-red-800 dark:text-red-100">
          {error}
        </div>
      )}

      {/* Formulaire ajout */}
      <form onSubmit={handleSubmit} className="panel space-y-4">
        <div className="flex items-center justify-between gap-3">
          <h2 className="text-xl font-semibold text-gray-900 dark:text-white">Ajouter une vidéo</h2>
          {saving && <span className="text-xs text-gray-500 dark:text-gray-400">Enregistrement...</span>}
        </div>
        <div className="flex flex-col md:flex-row gap-3">
          <input
            type="number"
            name="coach_id"
            placeholder="ID du coach"
            value={form.coach_id}
            onChange={handleChange}
            className="p-2 rounded-lg border border-gray-200 dark:border-surface-700 bg-white dark:bg-surface-800 text-sm text-gray-900 dark:text-gray-100 flex-1"
          />
          <input
            type="text"
            name="title"
            placeholder="Titre"
            value={form.title}
            onChange={handleChange}
            className="p-2 rounded-lg border border-gray-200 dark:border-surface-700 bg-white dark:bg-surface-800 text-sm text-gray-900 dark:text-gray-100 flex-1"
          />
          <input
            type="text"
            name="description"
            placeholder="Description"
            value={form.description}
            onChange={handleChange}
            className="p-2 rounded-lg border border-gray-200 dark:border-surface-700 bg-white dark:bg-surface-800 text-sm text-gray-900 dark:text-gray-100 flex-1"
          />
          <input
            type="text"
            name="video_url"
            placeholder="URL de la vidéo"
            value={form.video_url}
            onChange={handleChange}
            className="p-2 rounded-lg border border-gray-200 dark:border-surface-700 bg-white dark:bg-surface-800 text-sm text-gray-900 dark:text-gray-100 flex-1"
          />
        </div>
        <button
          type="submit"
          disabled={saving}
          className="px-4 py-2 bg-brand-500 hover:bg-brand-400 rounded-lg text-white font-semibold disabled:opacity-60"
        >
          {saving ? "Ajout..." : "Ajouter"}
        </button>
      </form>

      {/* Tableau */}
      {loading ? (
        <div className="panel text-center text-gray-500 dark:text-gray-400">Chargement des vidéos...</div>
      ) : (
        <div className="panel overflow-x-auto">
          <table className="min-w-full text-sm">
            <thead className="bg-gray-50 dark:bg-surface-800 text-left">
              <tr>
                <th className="px-4 py-2 border-b border-gray-200 dark:border-surface-700">ID</th>
                <th className="px-4 py-2 border-b border-gray-200 dark:border-surface-700">Coach</th>
                <th className="px-4 py-2 border-b border-gray-200 dark:border-surface-700">Titre</th>
                <th className="px-4 py-2 border-b border-gray-200 dark:border-surface-700">Description</th>
                <th className="px-4 py-2 border-b border-gray-200 dark:border-surface-700">URL</th>
                <th className="px-4 py-2 border-b border-gray-200 dark:border-surface-700">Créé le</th>
                <th className="px-4 py-2 border-b border-gray-200 dark:border-surface-700">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-200 dark:divide-surface-700">
              {videos.map((video) => (
                <tr key={video.id} className="hover:bg-gray-50 dark:hover:bg-surface-800">
                  <td className="px-4 py-2">{video.id}</td>
                  <td className="px-4 py-2">{video.coach?.name ?? video.coach_id}</td>
                  <td className="px-4 py-2">{video.title}</td>
                  <td className="px-4 py-2 text-gray-600 dark:text-gray-300">{video.description}</td>
                  <td className="px-4 py-2">
                    <a
                      href={video.video_url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-brand-600 dark:text-brand-400 hover:underline"
                    >
                      Voir
                    </a>
                  </td>
                  <td className="px-4 py-2">{video.created_at ? new Date(video.created_at).toLocaleString() : "-"}</td>
                  <td className="px-4 py-2 space-x-2">
                    <button
                      className="px-2 py-1 bg-red-600 rounded text-white hover:bg-red-500"
                      onClick={() => handleDelete(video.id)}
                    >
                      Supprimer
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
