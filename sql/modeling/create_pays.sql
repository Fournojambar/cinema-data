CREATE TABLE IF NOT EXISTS pays (
    pays_id SERIAL PRIMARY KEY,
    nom TEXT NOT NULL UNIQUE,
    code_iso2 CHAR(2) UNIQUE,
    code_iso3 CHAR(3) UNIQUE
);
