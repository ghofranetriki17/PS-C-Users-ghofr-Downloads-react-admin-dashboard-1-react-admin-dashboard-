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

  // Récupération des vidéos depuis l'API
  const fetchVideos = async () => {
    try {
      setLoading(true);
      const res = await videosAPI.list();
      if (res.success) setVideos(res.data);
    } catch (err) {
      console.error(err);
      alert("Erreur lors du chargement des vidéos.");
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
    if (!form.coach_id || !form.title || !form.video_url) {
      alert("Veuillez remplir tous les champs obligatoires !");
      return;
    }
    try {
      const res = await videosAPI.create(form);
      if (res.success) {
        setVideos([res.data, ...videos]);
        setForm({ coach_id: "", title: "", description: "", video_url: "" });
      } else {
        alert("Erreur lors de l'ajout de la vidéo");
      }
    } catch (err) {
      console.error(err);
      alert("Erreur API lors de l'ajout");
    }
  };

  const handleDelete = async (id) => {
    if (!window.confirm("Supprimer cette vidéo ?")) return;
    try {
      const res = await videosAPI.delete(id);
      if (res.success) {
        setVideos(videos.filter((v) => v.id !== id));
      } else {
        alert("Erreur lors de la suppression");
      }
    } catch (err) {
      console.error(err);
      alert("Erreur API lors de la suppression");
    }
  };

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-4">Gestion des vidéos</h1>

      {/* Formulaire ajout */}
      <form onSubmit={handleSubmit} className="mb-6 p-4 bg-surface-700 rounded-lg space-y-3">
        <h2 className="text-xl font-semibold">Ajouter une vidéo</h2>
        <div className="flex flex-col md:flex-row gap-3">
          <input
            type="number"
            name="coach_id"
            placeholder="ID du coach"
            value={form.coach_id}
            onChange={handleChange}
            className="p-2 rounded bg-surface-600 text-white flex-1"
          />
          <input
            type="text"
            name="title"
            placeholder="Titre"
            value={form.title}
            onChange={handleChange}
            className="p-2 rounded bg-surface-600 text-white flex-1"
          />
          <input
            type="text"
            name="description"
            placeholder="Description"
            value={form.description}
            onChange={handleChange}
            className="p-2 rounded bg-surface-600 text-white flex-1"
          />
          <input
            type="text"
            name="video_url"
            placeholder="URL de la vidéo"
            value={form.video_url}
            onChange={handleChange}
            className="p-2 rounded bg-surface-600 text-white flex-1"
          />
        </div>
        <button type="submit" className="px-4 py-2 bg-blue-600 hover:bg-blue-500 rounded text-white">
          Ajouter
        </button>
      </form>

      {/* Tableau */}
      {loading ? (
        <p>Chargement des vidéos...</p>
      ) : (
        <div className="overflow-x-auto">
          <table className="min-w-full bg-surface-700 text-sm border border-surface-600">
            <thead className="bg-surface-600 text-left">
              <tr>
                <th className="px-4 py-2 border-b">ID</th>
                <th className="px-4 py-2 border-b">Coach</th>
                <th className="px-4 py-2 border-b">Titre</th>
                <th className="px-4 py-2 border-b">Description</th>
                <th className="px-4 py-2 border-b">URL</th>
                <th className="px-4 py-2 border-b">Créé le</th>
                <th className="px-4 py-2 border-b">Actions</th>
              </tr>
            </thead>
            <tbody>
              {videos.map((video) => (
                <tr key={video.id} className="hover:bg-surface-600">
                  <td className="px-4 py-2 border-b">{video.id}</td>
                  <td className="px-4 py-2 border-b">{video.coach?.name ?? video.coach_id}</td>
                  <td className="px-4 py-2 border-b">{video.title}</td>
                  <td className="px-4 py-2 border-b">{video.description}</td>
                  <td className="px-4 py-2 border-b">
                    <a
                      href={video.video_url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-blue-400 hover:underline"
                    >
                      Voir
                    </a>
                  </td>
                  <td className="px-4 py-2 border-b">{new Date(video.created_at).toLocaleString()}</td>
                  <td className="px-4 py-2 border-b space-x-2">
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
