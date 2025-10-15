-- =========================================
-- CREATE TABLE MANUFACTURER
-- =========================================
CREATE TABLE IF NOT EXISTS manufacturer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    country_id INT REFERENCES country(id) ON DELETE SET NULL,
    founded_year INT
);


-- =========================================
-- INSERT 20 MANUFACTURERS (no duplicados)
-- =========================================

INSERT INTO manufacturer (name, country_id, founded_year) VALUES
('Sony', 1, 1946),            -- Japón
('Microsoft', 2, 1975),       -- Estados Unidos
('Nintendo', 1, 1889),        -- Japón
('Sega', 1, 1960),            -- Japón
('Atari', 2, 1972),            -- Estados Unidos
('Valve', 2, 1996),            -- Estados Unidos
('Electronic Arts', 2, 1982), -- Estados Unidos
('Ubisoft', 3, 1986),          -- Francia
('Activision', 2, 1979),       -- Estados Unidos
('Square Enix', 1, 2003),      -- Japón
('Capcom', 1, 1979),           -- Japón
('Bandai Namco', 1, 1955),     -- Japón
('Konami', 1, 1969),           -- Japón
('Bethesda', 2, 1986),         -- Estados Unidos
('Rockstar Games', 2, 1998),   -- Estados Unidos
('CD Projekt', 4, 1994),       -- Polonia
('Epic Games', 2, 1991),       -- Estados Unidos
('Tencent', 5, 1998),          -- China
('Take-Two Interactive', 2, 1993), -- Estados Unidos
('Blizzard Entertainment', 2, 1991) -- Estados Unidos
ON CONFLICT (name) DO NOTHING;
