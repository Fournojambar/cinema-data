/* ============================================================
   SCRIPT DE POPULATION DES TABLES NORMALISÉES
   Source : cnc_premiere_exclu
   Ordre logique :
   1. Tables de référence
   2. Table films
   3. Table exploitation
   ============================================================ */


/* ============================================================
   1. TABLES DE RÉFÉRENCE (LOOKUP TABLES)
   ============================================================ */

/* ------------------------------------------------------------
   1.1 Genres
   Objectif :
   - 1 ligne = 1 genre CNC distinct
   - Normalisation minimale (lower + trim)
   ------------------------------------------------------------ */

INSERT INTO genres (nom)
SELECT DISTINCT
    TRIM(LOWER(genre)) AS nom
FROM cnc_premiere_exclu
WHERE genre IS NOT NULL
ON CONFLICT (nom) DO NOTHING;
/*
ON CONFLICT permet de relancer le script sans créer de doublons.
La contrainte UNIQUE sur genres.nom est supposée exister.
*/


/* ------------------------------------------------------------
   1.2 Pays
   Objectif :
   - 1 ligne = 1 nationalité CNC
   - Pas encore de gestion des coproductions
   ------------------------------------------------------------ */

INSERT INTO pays (nom)
SELECT DISTINCT
    TRIM(LOWER(nationalite)) AS nom
FROM cnc_premiere_exclu
WHERE nationalite IS NOT NULL
ON CONFLICT (nom) DO NOTHING;


/* ------------------------------------------------------------
   1.3 Distributeurs
   Objectif :
   - Référentiel distributeur minimal
   - Les autres attributs seront enrichis plus tard
   ------------------------------------------------------------ */

INSERT INTO distributeurs (nom)
SELECT DISTINCT
    TRIM(LOWER(distributeur_clean)) AS nom
FROM cnc_premiere_exclu
WHERE distributeur_clean IS NOT NULL
ON CONFLICT (nom) DO NOTHING;



/* ============================================================
   2. TABLE FILMS
   ============================================================ */

/*
Logique :
- 1 film = 1 visa CNC (hypothèse structurante)
- Jointure vers genres et pays pour récupérer les IDs
- LEFT JOIN assumé : les NULL doivent être analysés après coup
*/

INSERT INTO films (
    titre_fr,
    annee_sortie,
    visa,
    genre_id,
    pays_id
)
SELECT DISTINCT
    c.titre_clean            AS titre_fr,
    c.annee                  AS annee_sortie,
    c.visa                   AS visa,
    g.genre_id               AS genre_id,
    p.pays_id                AS pays_id
FROM cnc_premiere_exclu c
LEFT JOIN genres g
    ON TRIM(LOWER(c.genre)) = g.nom
LEFT JOIN pays p
    ON TRIM(LOWER(c.nationalite)) = p.nom
WHERE c.visa IS NOT NULL;
/*
WHERE visa IS NOT NULL :
- hypothèse que le visa est l’identifiant métier du film
- évite de créer des films « fantômes »
*/



/* ============================================================
   3. TABLE EXPLOITATION
   ============================================================ */

/*
Logique :
- Chaque ligne correspond à une première exploitation
- type_exploitation est fixé ici (choix de modélisation)
- Jointure vers films via (visa + titre) pour sécuriser
*/

INSERT INTO exploitation (
    film_id,
    date_sortie,
    type_exploitation,
    nombre_copies,
    distributeur_id,
    classification,
    art_et_essai
)
SELECT
    f.film_id,
    c.date_sortie,
    'premiere_exploitation'      AS type_exploitation,
    c.etablissements_s1          AS nombre_copies,
    d.distributeur_id,
    c.classification,
    c.art_et_essai
FROM cnc_premiere_exclu c
JOIN films f
    ON f.visa = c.visa
   AND f.titre_fr = c.titre_clean
LEFT JOIN distributeurs d
    ON TRIM(LOWER(c.distributeur_clean)) = d.nom;
/*
LEFT JOIN distributeurs :
- certains films peuvent ne pas avoir de distributeur identifié
- ces cas doivent être comptés et documentés
*/



/* ============================================================
   4. CONTRÔLES POST-INSERTION (À LIRE, PAS À AUTOMATISER)
   ============================================================ */

/* Films sans genre */
SELECT COUNT(*) AS films_sans_genre
FROM films
WHERE genre_id IS NULL;

/* Films sans pays */
SELECT COUNT(*) AS films_sans_pays
FROM films
WHERE pays_id IS NULL;

/* Exploitations sans distributeur */
SELECT COUNT(*) AS exploitations_sans_distributeur
FROM exploitation
WHERE distributeur_id IS NULL;

/*
Ces requêtes servent à :
- évaluer la qualité du mapping
- décider si des corrections sont nécessaires
- alimenter open_questions.md
*/

