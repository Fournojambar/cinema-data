# Modeling Choices – cinema-data

Ce fichier décrit les choix de modélisation pour la base `cinema-data`, ainsi que les justifications associées.  
Il servira de référence pour toute modification future de la structure ou des relations entre tables.

---

## 1. Tables principales

### films
- `film_id` (PK) : identifiant unique auto-incrémenté.
- `titre_fr` : titre français du film.
- `titre_original` : titre original si différent.
- `annee_sortie` : année de sortie en France (issue de `annee` de `cnc_premiere_exclu`).
- `visa` : code de visa CNC.
- `duree` : durée du film en minutes.
- `genre_id` : FK vers `genres`.
- `pays_id` : FK vers `pays`.

### exploitation
- `exploitation_id` (PK)
- `film_id` (FK)
- `date_sortie` : date réelle de sortie en salle
- `type_exploitation` : par exemple `premiere_exploitation`
- `nombre_copies` : issue de `etablissements_s1`
- `distributeur_id` (FK)
- `classification` : classification CNC / autre
- `art_et_essai` : booléen ou label spécifique

### distributeurs
- `distributeur_id` (PK)
- `nom`
- `type_distributeur` : national, indépendant, etc.
- `pays`
- `actif`

### genres
- `genre_id` (PK)
- `nom` (nettoyé et standardisé)

### pays
- `pays_id` (PK)
- `nom`

---

## 2. Choix de modélisation

- **Normalisation des données**  
  - Suppression des doublons et création de colonnes `_clean`.  
  - Relations FK pour éviter les redondances.

- **Types de données**  
  - Textes pour titres et codes CNC.  
  - INT pour IDs et années.  
  - DATE pour dates.  

- **Gestion des multiples genres / nationalités**  
  - Une seule FK par film pour l’instant.  
  - Prévoir une table associée si multi-genre nécessaire ultérieurement.

- **Décisions spécifiques**  
  - Conserver genres rares comme témoignage historique.  
  - Utiliser `titre_clean` pour `films.titre_fr`.  
  - Créer `art_et_essai` dans exploitation pour filtres et ratios.  

---

## 3. Remarques provisoires

- Vérifier cohérence des distributeurs après dédoublonnage.  
- Arbitrer sur genres composites (`COMEDIE DRAMATIQUE`).  
- Décider du format final des colonnes `art_et_essai` et `classification`.  
- Prévoir évolutivité pour intégration de nouvelles sources.
