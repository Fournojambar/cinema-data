CREATE TABLE IF NOT EXISTS distributeurs (
    distributeur_id SERIAL PRIMARY KEY,
    nom TEXT NOT NULL UNIQUE,
    type_distributeur TEXT,
    pays_id INT REFERENCES pays(pays_id),
    actif BOOLEAN DEFAULT TRUE
);
