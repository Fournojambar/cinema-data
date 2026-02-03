# Data Dictionary - Cinema Data Project

## Table : films
**Description :** Contient les informations principales sur les films. Cette table sera le coeur du modèle relationnel, relié à l’exploitation et aux distributeurs.

| Colonne       | Type      | Description |
|---------------|-----------|-------------|
| film_id       | SERIAL PK | Identifiant unique du film |
| titre_fr      | TEXT      | Titre français, issu de `titre_clean` |
| titre_original| TEXT      | Titre original si différent |
| annee_sortie  | INTEGER   | Année de sortie (CNC), correspond à `annee` |
| visa          | TEXT      | Numéro de visa CNC |
| duree         | INTEGER   | Durée du film (min), si disponible |
| genre_id      | INT FK    | Référence à la table `genres` (normalisation en cours) |
| pays_id       | INT FK    | Référence à la table `pays` (normalisation en cours) |

---

## Table : exploitation
**Description :** Contient les informations sur l’exploitation des films (dates de sortie, distributeur, copies, labels).

| Colonne           | Type      | Description |
|-------------------|-----------|-------------|
| exploitation_id   | SERIAL PK | Identifiant unique de l’exploitation |
| film_id           | INT FK    | Référence au film concerné |
| date_sortie       | DATE      | Date de sortie du film |
| type_exploitation | TEXT      | Type d’exploitation (ex : "premiere_exploitation") |
| nombre_copies     | INTEGER   | Nombre de copies à l’ouverture (etablissements_s1) |
| distributeur_id   | INT FK    | Référence au distributeur |
| classification    | TEXT      | Classification officielle |
| art_et_essai      | BOOLEAN   | Label art et essai (TRUE/FALSE) |

---

## Table : distributeurs
**Description :** Contient les distributeurs de films et leurs caractéristiques.

| Colonne           | Type      | Description |
|-------------------|-----------|-------------|
| distributeur_id   | SERIAL PK | Identifiant unique |
| nom               | TEXT      | Nom du distributeur, normalisé (`distributeur_clean`) |
| type_distributeur | TEXT      | Type (indépendant, grand groupe, etc.) |
| pays              | TEXT      | Pays principal d’activité |
| actif             | BOOLEAN   | Indique si le distributeur est actif aujourd’hui |

---

## Table : cnc_premiere_exclu
**Description :** Table brute issue du fichier CNC, consolidée et nettoyée, utilisée pour alimenter les tables `films`, `exploitation` et `distributeurs`.

| Colonne              | Type    | Description |
|----------------------|---------|-------------|
| annee                | INTEGER | Année de sortie (CNC) |
| numero_cnc           | TEXT    | Numéro CNC du film |
| visa                 | TEXT    | Numéro de visa |
| titre                | TEXT    | Titre original issu du fichier |
| genre                | TEXT    | Genre tel que fourni par le CNC |
| nationalite          | TEXT    | Nationalité du film |
| distributeur         | TEXT    | Distributeur tel que fourni par le CNC |
| classification       | TEXT    | Classification officielle |
| date_sortie          | DATE    | Date de première exploitation |
| art_et_essai         | TEXT    | "OUI"/"NON" ou NULL |
| etablissements_s1    | INTEGER | Nombre de copies |
| titre_clean          | TEXT    | Titre nettoyé et normalisé |
| distributeur_clean   | TEXT    | Distributeur nettoyé et normalisé |
