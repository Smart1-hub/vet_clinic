/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Agumon', '2020-02-03', 10.23, TRUE, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Gabumon', '2018-11-15', 8, TRUE, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Pikachu', '2021-01-07', 15.04, FALSE, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Devimon', '2017-05-12', 11, TRUE, 5);

-- add more data
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Charmander', '2020-02-08', 11, FALSE, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Plantnom', '2021-11-15', -5.7, TRUE, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Squirtle', '1993-04-02', -12.13, FALSE, 3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Angemon', '2005-06-12', -45, TRUE, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Boarmon', '2005-06-07', 20.4, TRUE, 7);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Blossom', '1998-10-13', 17, TRUE, 3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Ditto', '2022-05-14', 22, TRUE, 4);

-- query multiple-tables
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);
INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon');
INSERT INTO species (name)
VALUES ('Digimon');

-- Modify insertion to include species_id value
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

-- Modifying insertion to include information
UPDATE animals SET owner_id = 1  WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2  WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3  WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4  WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5  WHERE name IN ('Angemon', 'Boarmon');

-- data for vets
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Vet William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Vet Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, '1981-05-05');
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Vet Jack Harkness', 38, '2008-06-08');

-- data for specialization
INSERT INTO specializations (species_id, vets_id)
VALUES ((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'William Tatcher'));
INSERT INTO specializations (species_id, vets_id)
VALUES ((SELECT id FROM species WHERE name = 'Digimon' AND name ='Pokemon'), (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'));
INSERT INTO specializations (species_id, vets_id)
VALUES ((SELECT id FROM species WHERE name = 'Digimon' OR name ='Digimon'), (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'));

-- data for visits
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Vet William Tatcher'), '2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), '2020-07-22');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), '2021-02-02');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2020-01-05');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2020-03-08');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2020-05-14');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), '2021-05-04');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), '2021-02-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2019-12-19');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Vet William Tatcher'), '2020-08-10');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2021-04-07');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), '2019-09-19');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), '2020-03-10');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), '2020-11-04');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2019-01-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2019-05-15');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2020-02-27');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2020-08-03');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), '2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Vet William Tatcher'), '2021-01-11');

