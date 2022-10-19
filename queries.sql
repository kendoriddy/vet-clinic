/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animal;
SELECT name FROM animal WHERE name LIKE '%mon';
SELECT name FROM animal WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animal WHERE neutered is true AND escape_attempts < 3;
SELECT date_of_birth FROM animal WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animal WHERE weight_kg > 10.5;
SELECT * FROM animal WHERE neutered is true;
SELECT * FROM animal WHERE name != 'Gabumon';
SELECT * FROM animal WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animal SET species = 'unspecified';
ROLLBACK;
SELECT * FROM animals;
BEGIN
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals;
UPDATE animals SET species = 'Pokemon' WHERE species is NULL;
COMMIT;
SELECT * FROM animals;
BEGIN
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT S1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO S1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, MAX(escape_attempt) FROM animals GROUP BY neutered;

SELECT MIN(weight_kg), MAX(weight_kg) FROM animals;

SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

-- Multiple Queries

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT * FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT animals.name, owners.full_name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;