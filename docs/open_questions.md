# Open Questions – cinema-data

Ce fichier centralise les interrogations et décisions à arbitrer dans le projet.  
Il permet de garder une trace des choix à prendre ou à réviser au fur et à mesure de l’avancée du projet.

---

## 1. Normalisation et nettoyage

- Comment traiter les genres composites (`COMEDIE DRAMATIQUE`) : garder tels quels ou séparer ?
- Que faire des genres marginaux (`FICTION`, `EXPERIMENTAL`, `INDETERMINE`) ?
- Gestion des titres avec articles définis ou apostrophes (`L’Habitude`) : conserver ou transformer ?

---

## 2. Données et sources

- Comment intégrer des données multi-sources (TMDB, Allociné) et résoudre les conflits ?
- Standardiser les noms de distributeurs provenant de sources différentes.
- Créer un plan pour mettre à jour la base avec de nouvelles données sans casser les FK.

---

## 3. Modélisation avancée

- Faut-il permettre plusieurs genres ou nationalités par film ?
- Comment modéliser les labels spéciaux (Art et Essai, Europa) : table dédiée ou colonne simple ?
- Décider du format final de `classification` pour permettre comparaisons inter-années.

---

## 4. Méthodologie et traçabilité

- Comment documenter chaque décision prise pour future révision ?
- Quelle granularité pour le journal de bord : chaque modification SQL ou chaque étape globale ?
- Automatisation des backups pour PostgreSQL et synchronisation avec GitHub.
