INSERT INTO genre(genre_name) VALUES 
    ('Rock'),
    ('Hip-Hop'),
    ('Electro'),
    ('Pop'),
    ('Folk'),
    ('Pop');
  
INSERT INTO artist(artist_name) VALUES 
    ('Глюкоза'),
    ('Моргенштерн'),
    ('Ногу свело'),
    ('Машина времени'),
    ('Клава Кока'),
    ('Дима Билан'),
    ('Пелагея'),
    ('ДДТ');
 
INSERT INTO albom(albom_name, albom_release_year) VALUES 
    ('На берегу неба', '2018-06-01'),
    ('Сибирская Любовь', '1995-06-08'),
    ('Я ехала домой', '1997-03-08'),
    ('Last One', '2002-04-13'),
    ('Black Star Inc', '2019-06-24'),
    ('50 ЛЕТ LIVE', '2020-10-27'),
    ('Галя ходи', '2018-08-09'),
    ('Москва', '2005-03-09');
 
INSERT INTO sound_treck(streck_name, 
albom_id, streck_duration) VALUES 
    ('А снег идёт', '8', '00:03:05'),
    ('Москва', '8', '00:04:05'),
    ('Ты должна рядом быть', '1', '00:04:06'),
    ('Милая', '1', '00:05:08'),
    ('Очи чёрные', '2', '00:02:58'),
    ('Bestie', '4', '00:04:23'),
    ('Увертюра', '6', '00:04:25'),
    ('Песня о капитане', '6', '00:05:06'),
    ('Чай', '7', '00:03:30'),
    ('Балтийское море', '7', '00:05:36'),
    ('Любовь не пропала', '7', '00:04:05'),
    ('Не отпускай', '5', '00:03:46'),
    ('Августин', '3', '00:04:05'),
    ('Пляжный рок-н-ролл', '3', '00:05:45'),
    ('Я понял', '4', '00:03:45'),
    ('myself by', '4', '00:03:45'),
    ('my bro', '3', '00:04:05'),
    ('by myself', '7', '00:04:05'),
    ('bemy self', '7', '00:04:05'),
    ('by myself by', '6', '00:05:06'),
    ('beemy', '5', '00:03:46'),
    ('premyne', '7', '00:03:30');
 
 INSERT INTO Collection_of_songs(Collection_name, 
Collection_release_year) VALUES 
    ('Золотые хиты прошлых лет', '2005-03-26'),
    ('Легенды рока', '2006-05-24'),
    ('Хиты современной эстрады', '2008-09-20'),
    ('Ретро-фанк', '2017-03-21'),
    ('Summer Vibes: Песни для теплых дней', '2018-09-20'),
    ('Ностальгия по будущему', '2008-03-25'),
    ('Лучшие хиты','2021-04-27'),
    ('Танцевальная лихорадка','2018-08-23');
 
INSERT INTO albom_artist (albom_id, artist_id)
SELECT al.albom_id, artist_id
FROM albom al, artist ar
WHERE al.albom_id = ar.artist_id;

INSERT INTO collection_treck (sound_treck_id, collection_id)
SELECT c.collection_id, st.sound_treck_id
FROM collection_of_songs c, sound_treck st
WHERE c.collection_id = st.sound_treck_id;

INSERT INTO genre_artist (genre_id, artist_id)
SELECT gn.genre_id, ar.artist_id
FROM genre gn, artist ar
WHERE gn.genre_id = ar.artist_id;


     