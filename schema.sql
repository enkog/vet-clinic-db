CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(20),
  age INT,
  PRIMARY KEY(id)
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20),
  PRIMARY KEY(id)
);

CREATE TABLE animals(
  species_id INT,
  owner_id INT,
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  FOREIGN KEY (species_id) REFERENCES species (id),
  FOREIGN KEY (owner_id) REFERENCES owners (id),
  PRIMARY KEY(id)
);

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

CREATE TABLE specializations(
  species_id  INT,
  vets_id     INT,
  FOREIGN KEY (species_id) REFERENCES species (id),
  FOREIGN KEY (vets_id) REFERENCES vets (id),
  PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits(
  animal_id  INT,
  vet_id     INT,
  date_of_visit DATE,
  id INT GENERATED ALWAYS AS IDENTITY,
  FOREIGN KEY (animal_id) REFERENCES animals (id),
  FOREIGN KEY (vet_id) REFERENCES vets (id),
  PRIMARY KEY (id)
);
