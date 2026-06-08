-- 1. Insert Countries
INSERT INTO countries (country_name, population_millions, gdp_millon_usd) VALUES
('United States', 333.2, 25462700.0),
('Germany', 83.8, 4072190.0),
('Japan', 125.1, 4231140.0),
('South Korea', 51.7, 1665240.0);

-- 2. Insert Clients (referencing country_ids)
INSERT INTO clients (client_name, country_id) VALUES
('John Doe', 1),          -- US
('Alice Smith', 1),        -- US
('Hans Müller', 2),       -- Germany
('Yuki Tanaka', 3);        -- Japan

-- 3. Insert Manufacturers (referencing country_ids)
INSERT INTO manufacturers (manufacturer_name, country_id) VALUES
('Ford', 1),               -- US
('Volkswagen', 2),         -- Germany
('BMW', 2),                -- Germany
('Toyota', 3),             -- Japan
('Hyundai', 4);            -- South Korea

-- 4. Insert Cars (referencing manufacturer_ids: 1=Ford, 2=VW, 3=BMW, 4=Toyota, 5=Hyundai)
INSERT INTO cars (manufacturer_id, model, year_made) VALUES
(4, 'Camry', 2022),        -- Toyota Camry
(3, '3 Series', 2023),     -- BMW 3 Series
(2, 'Golf', 2021),         -- VW Golf
(5, 'Elantra', 2024),      -- Hyundai Elantra
(1, 'Mustang', 2023);      -- Ford Mustang

-- 5. Insert Deals (referencing client_ids and car_ids)
INSERT INTO deals (client_id, car_id, deal_date) VALUES
(1, 1, '2026-01-15'),     -- John Doe buys a Toyota Camry
(2, 2, '2026-02-20'),     -- Alice Smith buys a BMW 3 Series
(3, 3, '2026-03-05'),     -- Hans Müller buys a VW Golf
(4, 4, '2026-04-12'),     -- Yuki Tanaka buys a Hyundai Elantra
(1, 2, '2026-05-22'),     -- John Doe buys a BMW 3 Series
(2, 5, '2026-06-01');     -- Alice Smith buys a Ford Mustang