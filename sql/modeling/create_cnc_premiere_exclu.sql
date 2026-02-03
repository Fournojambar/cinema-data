-- ==============================
-- Script de création de la table cnc_premiere_exclu
-- ==============================

CREATE TABLE IF NOT EXISTS cnc_premiere_exclu (
    -- annee : année de sortie du film (exploitation)
    annee INT,

    -- numero_cnc : numéro de visa CNC ou identifiant unique du film
    numero_cnc TEXT,

    -- visa : texte libre indiquant le type de visa, peut être NULL
    visa TEXT,

    -- titre : titre original (avec articles en queue)
    titre TEXT,

    -- genre : genre tel qu’indiqué dans le fichier CNC (sera normalisé plus tard)
    genre TEXT,

    -- nationalite : pays d’origine du film, texte brut
    nationalite TEXT,

    -- distributeur : nom du distributeur (sera nettoyé dans distributeur_clean)
    distributeur TEXT,

    -- classification : type de classification (TP, etc.)
    classification TEXT,

    -- date_sortie : date de sortie du film (format YYYY-MM-DD)
    date_sortie DATE,

    -- art_et_essai : 'OUI', 'NON', ou NULL, indique si film Art & Essai
    art_et_essai TEXT,

    -- etablissements_s1 : nombre de copies ou établissements pour la première semaine
    etablissements_s1 INT,

    -- titre_clean : titre nettoyé (minuscules, articles replacés, accents à normaliser)
    titre_clean TEXT,

    -- distributeur_clean : nom du distributeur nettoyé
    distributeur_clean TEXT
);

-- COMMENTAIRE META :
-- - CREATE TABLE IF NOT EXISTS : la table n’est créée que si elle n’existe pas déjà.
-- - Les colonnes texte (TEXT) sont conservées ainsi car le fichier CSV contient des valeurs hétérogènes.
-- - date_sortie est en DATE pour faciliter les tris et calculs de chronologie.
-- - titre_clean et distributeur_clean seront utilisés pour les jointures vers les tables films et distributeurs.
-- - Cette table constitue la **table brute / staging** avant normalisation dans films, exploitation, genres et distributeurs.
