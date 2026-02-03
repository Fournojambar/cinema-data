-- ==============================
-- Script de création de la table films
-- ==============================

CREATE TABLE IF NOT EXISTS films (
    -- film_id : identifiant unique pour chaque film
    -- SERIAL = auto-incrément (1, 2, 3…), parfait pour une PK
    film_id SERIAL PRIMARY KEY,

    -- titre_fr : titre français du film
    -- NOT NULL => chaque film doit avoir un titre français
    titre_fr TEXT NOT NULL,

    -- titre_original : titre original du film, peut être NULL si inconnu
    titre_original TEXT,

    -- annee_sortie : année de sortie du film
    -- INT est suffisant pour stocker des années (ex: 1998, 2023)
    annee_sortie INT,

    -- visa : numéro de visa CNC ou autre identifiant légal
    -- peut être NULL si non renseigné
    visa TEXT,

    -- duree : durée du film en minutes
    duree INT,

    -- genre_id : référence à la table genres
    -- FOREIGN KEY : assure l'intégrité référentielle
    -- le film ne peut référencer qu'un genre existant
    genre_id INT REFERENCES genres(genre_id),

    -- pays_id : référence à la table pays
    -- idem, assure que le film est lié à un pays existant dans la table pays
    pays_id INT REFERENCES pays(pays_id)
);

-- COMMENTAIRE META :
-- - CREATE TABLE IF NOT EXISTS : ne recrée pas la table si elle existe déjà
-- - PRIMARY KEY : garantit l'unicité et indexe automatiquement film_id
-- - REFERENCES : clé étrangère, assure que genre_id et pays_id existent dans leurs tables respectives
-- - Les colonnes optionnelles (titre_original, visa, duree, genre_id, pays_id) peuvent rester NULL si l'information manque

