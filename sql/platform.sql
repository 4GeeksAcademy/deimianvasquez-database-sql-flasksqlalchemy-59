-- =========================================
-- CREATE TABLE PLATFORM
-- =========================================

CREATE TABLE IF NOT EXISTS platform (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) NOT NULL UNIQUE,
    hardware_price NUMERIC(10,2),
    manufacturer_id INT REFERENCES manufacturer(id) ON DELETE SET NULL
);


INSERT INTO platform (name, manufacturer_id, hardware_price) VALUES
('PlayStation 5', 1, 499.99),        -- Sony
('PlayStation 4', 1, 299.99),        -- Sony
('Xbox Series X', 2, 499.99),        -- Microsoft
('Xbox Series S', 2, 299.99),        -- Microsoft
('Xbox One', 2, 299.99),             -- Microsoft
('Nintendo Switch', 3, 299.99),      -- Nintendo
('Nintendo Switch Lite', 3, 199.99), -- Nintendo
('Sega Genesis', 4, 149.99),         -- Sega
('Sega Saturn', 4, 399.99),          -- Sega
('Atari 2600', 5, 99.99),            -- Atari
('Valve Steam Deck', 6, 399.99),     -- Valve
('PC Gaming', 2, 1200.00),           -- Microsoft (custom PC reference)
('PlayStation 3', 1, 199.99),        -- Sony
('PlayStation 2', 1, 149.99),        -- Sony
('Xbox 360', 2, 199.99),             -- Microsoft
('GameCube', 3, 149.99),             -- Nintendo
('Nintendo Wii', 3, 199.99),         -- Nintendo
('Nintendo Wii U', 3, 249.99),       -- Nintendo
('PlayStation Vita', 1, 179.99),     -- Sony
('Nintendo 3DS', 3, 149.99)          -- Nintendo
ON CONFLICT (name) DO NOTHING;
