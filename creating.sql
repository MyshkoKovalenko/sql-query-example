CREATE TABLE deals (
    deal_id SERIAL PRIMARY KEY,
    client_id INT,
    car_id INT,
    deal_date DATE
);

CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    client_name VARCHAR(100),
    country_id INT
);

CREATE TABLE cars (
    car_id SERIAL PRIMARY KEY,
    manufacturer_id INT,
    model VARCHAR(50),
    year_made INT
);

CREATE TABLE manufacturers (
    manufacturer_id SERIAL PRIMARY KEY,
    manufacturer_name VARCHAR(50),
    country_id INT
);

CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(50),
    population_millions FLOAT,
    gdp_millon_usd FLOAT
);