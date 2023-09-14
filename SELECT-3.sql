
-- 1.количество исполнителей в каждом жанре;

SELECT artist_name, COUNT(a.artist_id) FROM artist a
JOIN genre_artist ga ON a.artist_id = ga.artist_id
JOIN genre g ON g.genre_id = ga.genre_id
GROUP BY a.artist_id
ORDER BY a.artist_id DESC;

-- 2.количество треков, вошедших в альбомы 2019-2020 годов; 

SELECT COUNT(sound_treck_id) AS total_tracks
FROM sound_treck st
JOIN albom a ON a.albom_id = st.albom_id
WHERE a.albom_release_year BETWEEN '2019-01-01' AND '2020-12-31';
 

-- 3. средняя продолжительность треков по каждому альбому;

SELECT a.albom_name, AVG(streck_duration) FROM sound_treck st
FULL JOIN albom a ON a.albom_id = st.albom_id
GROUP BY a.albom_name;

-- 4. все исполнители, которые не выпустили альбомы в 2020 году;

SELECT a.artist_name
FROM artist a
WHERE a.artist_name NOT IN (
    SELECT a.artist_name
    FROM artist a
    JOIN albom_artist aa ON a.artist_id = aa.albom_id
    JOIN albom al ON aa.albom_id = al.albom_id
    WHERE al.albom_release_year BETWEEN '2020-01-01' AND '2020-12-31'
);


-- 5. названия сборников, в которых присутствует 
-- конкретный исполнитель (выберите сами);

SELECT a.artist_name, c.collection_name FROM collection_of_songs c
FULL JOIN collection_treck ct ON c.collection_id = ct.collection_id
FULL JOIN sound_treck st ON st.sound_treck_id = ct.sound_treck_id
FULL JOIN albom al ON st.albom_id = al.albom_id
FULL JOIN albom_artist aa ON al.albom_id = aa.albom_id
FULL JOIN artist a ON a.artist_id = aa.artist_id
WHERE a.artist_name = 'Глюкоза'
GROUP BY a.artist_name, c.collection_name; 

--6. название альбомов, в которых присутствуют исполнители более 1 жанра;

-- Не было данных в таблице. Тут я добавляю данные в таблицу, 
--присвоив исполнителям более 1 жанра

INSERT INTO genre_artist (artist_id, genre_id) VALUES (1, 1);
INSERT INTO genre_artist (artist_id, genre_id) VALUES (1, 2);

SELECT DISTINCT a.albom_name
FROM albom a
JOIN albom_artist al ON al.albom_id = a.albom_id
JOIN artist ar ON ar.artist_id = al.artist_id
JOIN genre_artist ga ON ar.artist_id = ga.artist_id
JOIN genre g ON g.genre_id = ga.genre_id
GROUP BY a.albom_name, ar.artist_id
HAVING COUNT(DISTINCT ga.genre_id) > 1;



-- 7. наименование треков, которые не входят в сборники;

SELECT st.streck_name
FROM sound_treck st
LEFT JOIN collection_treck ct ON ct.sound_treck_id = st.sound_treck_id
WHERE ct.collection_id IS NULL;

-- 8. исполнителя(-ей), написавшего самый короткий 
-- по продолжительности трек (теоретически таких треков может быть несколько);
 
SELECT artist_name FROM sound_treck st
JOIN albom_artist al ON al.albom_id = st.albom_id
JOIN artist ar ON ar.artist_id = al.artist_id
WHERE streck_duration = (
  SELECT MIN(streck_duration)
  FROM sound_treck
);

-- 9.  название альбомов, содержащих наименьшее количество треков. 
SELECT al.albom_name
FROM albom al
JOIN sound_treck st ON al.albom_id = st.albom_id
GROUP BY al.albom_name
HAVING COUNT(*) = (
  SELECT COUNT(*)
  FROM sound_treck
  GROUP BY albom_id
  ORDER BY COUNT(*) ASC
  LIMIT 1
);
