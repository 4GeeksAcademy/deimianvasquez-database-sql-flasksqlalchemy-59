-- =========================================
-- CREATE TABLE VIDEO_GAME_PLATFORM (INTERMEDIATE)
-- =========================================
CREATE TABLE IF NOT EXISTS video_game_platform (
    video_game_id INT REFERENCES video_game(id),
    platform_id INT REFERENCES platform(id),
    PRIMARY KEY (video_game_id, platform_id)
);


-- =========================================
-- INSERT 18 VIDEO_GAME_PLATFORM (sin game_price)
-- =========================================

INSERT INTO video_game_platform (video_game_id, platform_id) VALUES
(1, 6),   -- The Legend of Zelda: Breath of the Wild en Nintendo Switch
(2, 6),   -- Super Mario Odyssey en Nintendo Switch
(3, 6),   -- Mario Kart 8 Deluxe en Nintendo Switch
(4, 1),   -- God of War en PlayStation 5
(5, 1),   -- Horizon Zero Dawn en PlayStation 5
(6, 1),   -- Spider-Man en PlayStation 5
(7, 1),   -- The Last of Us Part II en PlayStation 5
(8, 2),   -- Red Dead Redemption 2 en Xbox Series X
(9, 2),   -- Grand Theft Auto V en Xbox Series X
(10, 6),  -- Cyberpunk 2077 en Nintendo Switch
(11, 12), -- Elden Ring en PC Gaming
(12, 12), -- Dark Souls III en PC Gaming
(13, 1),  -- Bloodborne en PlayStation 5
(14, 12), -- Doom Eternal en PC Gaming
(15, 2),  -- Call of Duty: Modern Warfare en Xbox Series X
(16, 12), -- Overwatch en PC Gaming
(17, 12), -- Fortnite en PC Gaming
(18, 3)   -- Gears 5 en Xbox Series S
ON CONFLICT (video_game_id, platform_id) DO NOTHING;
