-- ==============================
-- Script de reset pour la table films
-- ==============================

-- OPTION 1 : Vider la table sans la supprimer
-- Cette commande supprime **toutes les lignes** de la table,
-- réinitialise les valeurs auto-incrémentées (IDENTITY / SERIAL),
-- et supprime également toutes les données dans les tables qui dépendent de cette table
TRUNCATE TABLE films RESTART IDENTITY CASCADE;

-- OPTION 2 : Supprimer complètement la table
-- Cette commande détruit **la structure** de la table ainsi que toutes ses données
-- et supprime toutes les relations avec les autres tables (CASCADE)
-- DROP TABLE IF EXISTS films CASCADE;

-- COMMENTAIRE META :
-- - TRUNCATE : rapide, conserve la table et sa structure. Utile pour rejouer la population depuis CSV.
-- - RESTART IDENTITY : remet le compteur SERIAL à 1
-- - CASCADE : supprime aussi toutes les lignes des tables qui ont une FK vers films
-- - DROP TABLE : supprime complètement la table, à utiliser si tu veux repartir de zéro structure + données
