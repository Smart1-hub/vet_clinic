/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = TRUE;
SELECT * from animals WHERE name NOT IN ('Gabumon');
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <=17.3;

-- update query
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT animals_deleted;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK to animals_deleted;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT ROUND(AVG(weight_kg)::numeric, 2) FROM animals;
SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, ROUND(AVG(escape_attempts)::numeric, 0) FROM animals WHERE date_of_birth >= '1999-01-01' AND date_of_birth <='2000-12-31' GROUP BY species;

-- queries using JOIN
SELECT name FROM animals JOIN owners ON animals.owner_id = owner_id WHERE onwers.full_name = 'Melody Pond';
SELECT Animal, Species FROM (SELECT animals.name AS Animal, species.name as Species FROM animals, species WHERE animals.species_id = species.id) _ WHERE Species = 'Pokemon';
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0 GROUP BY animals.name;
SELECT owners.full_name, COUNT(*) FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(*) DESC LIMIT 1;

-- queries
SELECT animals.name, 
visits.date_of_visit FROM animals 
JOIN visits ON animals.id = visits.animals_id JOIN vets 
ON vets.id = visits.vets_id 
WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(DISTINCT animals.name) FROM animals 
JOIN visits ON animals.id = visits.animals_id JOIN vets 
ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;

SELECT vets.name, species.name as specialties FROM vets FULL 
JOIN specializations ON vets.id = specializations.vets_id FULL 
JOIN species ON species.id = specializations.species_id;

SELECT animals.name, visits.date_of_visit FROM animals 
JOIN visits ON animals.id = visits.animals_id JOIN vets 
ON vets.id = visits.vets_id WHERE visits.date_of_visit 
BETWEEN '2020-04-01' AND '2020-09-30' AND vets.name = 'Stephanie Mendez';

SELECT COUNT(animals.name) AS nb_of_visit, animals.name 
FROM animals JOIN visits ON animals.id = visits.animals_id 
GROUP BY animals.name ORDER BY nb_of_visit DESC LIMIT 1;

SELECT animals.name, visits.date_of_visit FROM animals 
JOIN visits ON animals.id = visits.animals_id JOIN vets 
ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' 
ORDER BY visits.date_of_visit ASC LIMIT 1;

SELECT visits.date_of_visit, animals.name 
AS ANIMALS_NAME, animals.date_of_birth 
AS ANIMALS_BITH, animals.escape_attempts, animals.weight_kg, species.name 
AS ANIMALS_SPECIES, owners.full_name AS OWNERS, vets.name 
AS VET_NAME, vets.age AS VET_age, vets.date_of_graduation 
AS VET_DATE_OF_GRAD FROM animals JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON vets.id = visits.vets_id JOIN species 
ON animals.species_id = species.id JOIN owners ON animals.owner_id = owners.id 
ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(visits.animals_id) FROM visits JOIN vets 
ON vets.id = visits.vets_id JOIN animals ON animals.id = visits.animals_id 
JOIN specializations ON specializations.vets_id = vets.id 
WHERE specializations.species_id != animals.species_id;

SELECT COUNT(animals.species_id) as count_visit, species.name 
FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets 
ON vets.id = visits.vets_id JOIN species ON animals.species_id = species.id 
WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY count_visit 
DESC LIMIT 1; 