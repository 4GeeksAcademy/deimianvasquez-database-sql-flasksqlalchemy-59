-- =========================================
-- CREATE TABLE DEVELOPMENT_COMPANY
-- =========================================
CREATE TABLE IF NOT EXISTS development_company (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    country_id INT REFERENCES country(id) ON DELETE SET NULL,
    founded_year INT
);

-- =========================================
-- INSERT 25 DEVELOPMENT COMPANIES (no duplicados)
-- =========================================

INSERT INTO development_company (name, country_id, founded_year) VALUES
('Nintendo EAD', 1, 1983),         -- Japón
('Capcom Co., Ltd.', 1, 1979),     -- Japón
('Square Enix', 1, 2003),           -- Japón
('Bandai Namco Studios', 1, 1955),  -- Japón
('Konami Digital Entertainment', 1, 1969), -- Japón
('Sega Games Co., Ltd.', 1, 1960), -- Japón
('Sony Interactive Entertainment', 1, 1993), -- Japón
('Valve Corporation', 2, 1996),    -- Estados Unidos
('Epic Games', 2, 1991),           -- Estados Unidos
('Electronic Arts', 2, 1982),      -- Estados Unidos
('Activision', 2, 1979),           -- Estados Unidos
('Blizzard Entertainment', 2, 1991), -- Estados Unidos
('Rockstar Games', 2, 1998),       -- Estados Unidos
('Bethesda Game Studios', 2, 1986),-- Estados Unidos
('id Software', 2, 1991),          -- Estados Unidos
('Ubisoft Montreal', 3, 1997),     -- Francia
('Ubisoft Paris', 3, 1986),        -- Francia
('CD Projekt Red', 4, 2002),       -- Polonia
('Tencent Games', 5, 1998),        -- China
('Remedy Entertainment', 6, 1995), -- Finlandia
('Guerrilla Games', 1, 2000),      -- Países Bajos
('FromSoftware', 1, 1986),         -- Japón
('Crytek', 7, 1999),               -- Alemania
('Naughty Dog', 2, 1984),          -- Estados Unidos
('Insomniac Games', 2, 1994)       -- Estados Unidos
ON CONFLICT (name) DO NOTHING;
