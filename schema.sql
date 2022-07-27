/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals 
ADD column species varchar(100);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(100),
    age integer
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar(100) NOT NULL
);

ALTER TABLE animals DROP column species;
ALTER TABLE animals ADD column species_id int REFERENCES species(id);
ALTER TABLE animals ADD column owner_id int REFERENCES owners(id);

-- add join table
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name varchar(100) NOT NULL,
    age integer NOT NULL,
    date_of_graduation date NOT NULL
);

CREATE TABLE specializations (
    vets_id integer NOT NULL,
    species_id integer NOT NULL,
    FOREIGN KEY (vets_id) REFERENCES vets(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (species_id) REFERENCES species(id)  ON DELETE RESTRICT ON UPDATE CASCADE
    PRIMARY KEY(vets_id, species_id)
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    animals_id integer NOT NULL,
    vets_id integer NOT NULL,
    date_of_visit date,
    FOREIGN KEY (animals_id) REFERENCES animals(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (vets_id) REFERENCES vets(id) ON DELETE RESTRICT ON UPDATE CASCADE
);