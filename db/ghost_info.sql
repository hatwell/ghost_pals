

DROP TABLE neghostiations;
DROP TABLE hauntings;
DROP TABLE ghosts;
DROP TABLE locations;
DROP TABLE investigators;
DROP TABLE customers;
DROP TABLE services;
DROP TABLE ghost_types;
DROP TABLE location_types;


CREATE TABLE location_types (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE ghost_types (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE services (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  email_address VARCHAR(255)
);

CREATE TABLE investigators (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  email_address VARCHAR(255)
);

CREATE TABLE locations (
  id SERIAL8 PRIMARY KEY,
  location_name VARCHAR(255),
  location_type_id INT4 REFERENCES location_types(id) ON DELETE CASCADE
);

CREATE TABLE ghosts (
  id SERIAL8 PRIMARY KEY,
  ghost_name VARCHAR(255),
  ghost_type_id INT4 REFERENCES ghost_types(id) ON DELETE CASCADE
);

CREATE TABLE hauntings (
  id SERIAL8 PRIMARY KEY,
  haunting_name VARCHAR(255),
  haunting_date DATE,
  haunting_description TEXT,
  ghost_name VARCHAR(255),
  location_name VARCHAR(255),
  ghost_type_id INT4 REFERENCES ghost_types(id) ON DELETE CASCADE,
  location_type_id INT4 REFERENCES location_types(id) ON DELETE CASCADE,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE
);

CREATE TABLE neghostiations (
  id SERIAL8 PRIMARY KEY,
  neghostiation_date DATE,
  investigator_id INT4 REFERENCES investigators(id) ON DELETE CASCADE,
  haunting_id INT4 REFERENCES hauntings(id) ON DELETE CASCADE,
  services_id INT4 REFERENCES services(id) ON DELETE CASCADE,
  report TEXT,
  successful BOOL
);
