/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD COLUMN species VARCHAR;

-- Query Multiple Tables

CREATE TABLE owners (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INT
);

CREATE TABLE species (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

ALTER TABLE animals ADD COLUMN species_id BIGINT REFERENCES species (id);
ALTER TABLE animals ADD COLUMN owner_id BIGINT REFERENCES owners (id);

-- Join Tables

CREATE TABLE vets (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
    vet_id BIGINT REFERENCES vets (id),
    species_id BIGINT REFERENCES species (id)
);

CREATE TABLE visits (
    vet_id BIGINT REFERENCES vets (id),
    animal_id BIGINT REFERENCES animals (id),
    date_of_visit DATE NOT NULL
);