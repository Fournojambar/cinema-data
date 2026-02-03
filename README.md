# Cinema Data Project

Ce projet a pour objectif de constituer une **base de données relationnelle riche et consolidée autour de l’exploitation cinématographique en France**, à partir de **sources hétérogènes** : données institutionnelles du CNC, données professionnelles de l'AFCAE et du SCARE, API TMDB, scraping Allociné, et d’autres sources potentielles. L’idée est de croiser et consolider ces données pour produire des informations fiables et structurées.

Le projet est conçu pour **permettre la création d’analyses et d’outils à destination des professionnels** du cinéma, afin de les aider à piloter leur activité au quotidien et produire des bilans ponctuels.

Un autre objectif fondamental est de me faire **produire un projet exigeant et abouti**, intégrant les outils les plus incontournables de ma boîte à outils de data analyst junior (SQL avancé, Python, dataviz, modélisation de bases, documentation), dans le but de **monter en compétences** et de constituer un **portfolio solide et concret**.

---

## 🎯 Objectifs du projet

- Centraliser et nettoyer des données hétérogènes liées au cinéma
- Concevoir un modèle relationnel cohérent et documenté
- Permettre des analyses fiables (distributeurs, genres, exploitation, temporalités, labels, etc.)
- Disposer d’une base réutilisable dans un cadre professionnel indépendant
- Développer un projet complet et documenté pour le portfolio

---

## 🗂 Structure du projet

cinema-data/
├── data/
│ ├── raw/ # données sources brutes
│ └── cleaned/ # données nettoyées / normalisées
├── sql/
│ ├── exploration/
│ ├── cleaning/
│ ├── modeling/
│ └── analysis/
├── docs/
│ ├── data_dictionary.md
│ ├── modeling_choices.md
│ └── open_questions.md
├── notebooks/
├── assets/
│ └── schemas/
└── README.md

---

## 🛠 Stack technique

- Base de données : **PostgreSQL**
- Langage principal : **SQL**
- Outils complémentaires : Python (pandas, dataviz), Git, Notion pour documentation

---

## 📌 État actuel du projet

- Import des données CNC de premières exploitations
- Exploration SQL avancée (agrégations, fenêtres, rankings)
- Début de normalisation du modèle relationnel
- Structuration du projet et création de la documentation initiale

---

## 🧭 Étapes à venir

- Finalisation du modèle relationnel
- Nettoyage et normalisation complète des référentiels (genres, pays, distributeurs, labels)
- Documentation détaillée des choix de modélisation
- Intégration et croisement des autres sources (AFCAE, SCARE, TMDB, Allociné…)
- Développement d’analyses et d’outils destinés aux professionnels
- Production de contenus pour le portfolio
