-- =========================================
-- CREATE TABLE VIDEO_GAME
-- =========================================
CREATE TABLE IF NOT EXISTS video_game (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    genre VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    company_id INT REFERENCES development_company(id) ON DELETE SET NULL
);



-- =========================================
-- INSERT 32 VIDEO GAMES (no duplicados)
-- =========================================

INSERT INTO video_game (name, genre, release_year, rating, company_id) VALUES
('The Legend of Zelda: Breath of the Wild', 'Action-Adventure', 2017, 'E10+', 1),
('Super Mario Odyssey', 'Platformer', 2017, 'E', 3),
('Mario Kart 8 Deluxe', 'Racing', 2017, 'E', 3),
('God of War', 'Action', 2018, 'M', 7),
('Horizon Zero Dawn', 'Action RPG', 2017, 'T', 21),
('Spider-Man', 'Action', 2018, 'T', 25),
('The Last of Us Part II', 'Action-Adventure', 2020, 'M', 24),
('Red Dead Redemption 2', 'Action-Adventure', 2018, 'M', 13),
('Grand Theft Auto V', 'Action-Adventure', 2013, 'M', 13),
('Cyberpunk 2077', 'RPG', 2020, 'M', 18),
('Elden Ring', 'Action RPG', 2022, 'M', 22),
('Dark Souls III', 'Action RPG', 2016, 'M', 22),
('Bloodborne', 'Action RPG', 2015, 'M', 22),
('Doom Eternal', 'FPS', 2020, 'M', 15),
('Call of Duty: Modern Warfare', 'FPS', 2019, 'M', 11),
('Overwatch', 'FPS', 2016, 'T', 12),
('Fortnite', 'Battle Royale', 2017, 'T', 9),
('Gears 5', 'TPS', 2019, 'M', 2),
('Assassin’s Creed Valhalla', 'Action RPG', 2020, 'M', 16),
('Far Cry 5', 'FPS', 2018, 'M', 16),
('The Witcher 3: Wild Hunt', 'RPG', 2015, 'M', 18),
('Halo Infinite', 'FPS', 2021, 'T', 2),
('Persona 5', 'JRPG', 2016, 'T', 3),
('Final Fantasy VII Remake', 'JRPG', 2020, 'T', 3),
('Resident Evil Village', 'Horror', 2021, 'M', 2),
('Monster Hunter: World', 'Action RPG', 2018, 'T', 3),
('Animal Crossing: New Horizons', 'Simulation', 2020, 'E', 3),
('Splatoon 2', 'Shooter', 2017, 'E10+', 3),
('Super Smash Bros. Ultimate', 'Fighting', 2018, 'E10+', 3),
('Minecraft', 'Sandbox', 2011, 'E10+', 6),
('The Sims 4', 'Simulation', 2014, 'T', 10),
('League of Legends', 'MOBA', 2009, 'T', 6),
('Counter-Strike: Global Offensive', 'FPS', 2012, 'M', 6);
