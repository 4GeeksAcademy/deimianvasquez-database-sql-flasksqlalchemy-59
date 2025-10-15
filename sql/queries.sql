-- Juegos desarrollados por una empresa especifica
select * from video_game vg INNER JOIN development_company dc ON vg.company_id = dc.id where dc.name = 'Epic Games';