-- SQLite
CREATE TABLE film (film_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, year INTEGER);
CREATE TABLE person (person_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT Not NULL, birth_year INTEGER);
CREATE TABLE film_actor(person_id INTEGER NOT NULL, film_id INTEGER NOT NULL, PRIMARY KEY (person_id, film_id), FOREIGN KEY (person_id) REFERENCES person(person_id), FOREIGN KEY (film_id) REFERENCES film(film_id));
CREATE TABLE film_director(person_id INTEGER NOT NULL, film_id INTEGER NOT NULL, PRIMARY KEY (person_id, film_id), FOREIGN KEY (person_id) REFERENCES person(person_id), FOREIGN KEY (film_id) REFERENCES film(film_id));
CREATE TABLE film_scriptwriter(person_id INTEGER NOT NULL, film_id INTEGER NOT NULL, PRIMARY KEY (person_id, film_id), FOREIGN KEY (person_id) REFERENCES person(person_id), FOREIGN KEY (film_id) REFERENCES film(film_id));
CREATE TABLE person_country ( person_id INTEGER NOT NULL, country_id  INTEGER NOT NULL, PRIMARY KEY (country_id, person_id), FOREIGN KEY (person_id) REFERENCES person(person_id), FOREIGN KEY (country_id) REFERENCES country(id));
CREATE TABLE country (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL);
CREATE TABLE death (person_id INTEGER NOT NULL PRIMARY KEY, year INTEGER, FOREIGN KEY(person_id) REFERENCES person(person_id));
CREATE TABLE film_country ( film_id INTEGER NOT NULL, country_id  INTEGER NOT NULL, PRIMARY KEY (country_id, film_id), FOREIGN KEY (film_id) REFERENCES film(film_id), FOREIGN KEY (country_id) REFERENCES country(id));
CREATE TABLE film_genre ( film_id INTEGER NOT NULL, genre_id  INTEGER NOT NULL, PRIMARY KEY (genre_id, film_id), FOREIGN KEY (film_id) REFERENCES film(film_id), FOREIGN KEY (genre_id) REFERENCES genre(id));
CREATE TABLE genre (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL);

INSERT INTO film VALUES (NULL, "Гарри Поттер и философский камень",  2001),
(NULL, "Век Адалин", 2015),
(NULL, "Убийство в восточном экспрессе", 2017);

INSERT INTO person VALUES 
(NULL, "Дэниэл Рэдклифф", 1989),
(NULL, "Руперт Гринт", 1988), 
(NULL, "Эмма Уотсон", 1990),
(NULL, "Алан Рикман", 1946), 
(NULL, "Крис Коламбус", 1958), 
(NULL, "Стивен Кловз", 1960), 
(NULL, "Дж.К. Роулинг", 1965), 
(NULL, "Ли Толанд Кригер", 1983), 
(NULL, "Дж. Миллс Гудло", 1961), 
(NULL, "Блейк Лайвли", 1988), 
(NULL, "Михил Хёйсман", 1981), 
(NULL, "Кеннет Брана", 1960), 
(NULL, "Агата Кристи", 1890), 
(NULL, "Пенелопа Крус", 1984), 
(NULL, "Уиллем Дефо", 1955);

INSERT INTO death Values (4,2016);

INSERT INTO country VALUES (NULL,"Российская Федерация"), 
(NULL,"Великобритания"),
(NULL,"США"), 
(NULL,"Канада"), 
(NULL,"Мальта"),
(NULL, "Франция"),
(NULL, "Нидерланды"),
(NULL, "Испания");

INSERT INTO genre VALUES (NULL,"фэнтези"), 
(NULL,"приключения"), 
(NULL,"семейный"), 
(NULL,"драма"), 
(NULL,"мелодрама"), 
(NULL,"детектив"), 
(NULL,"криминал"), 
(NULL,"триллер"), 
(NULL,"ужасы");

INSERT INTO film_director VALUES (5, 1),
(8, 2),
(12, 3);

INSERT INTO film_actor VALUES (4, 1), (3, 1), (2, 1), (1, 1), (10, 2), (11, 2), (12, 3), (14, 3);

INSERT INTO film_scriptwriter VALUES (6, 1), (7, 1), (9, 2), (13, 3);

INSERT INTO film_country VALUES 
(1, 2), (1, 3), (3, 2), (2, 4), (2, 3), (3, 3), (3, 5);

INSERT INTO person_country VALUES 
(1, 2),
(2, 2),
(3 , 6),
(4, 2),
( 5, 3),
( 6, 3),
(7 , 2),
( 8, 3),
( 9, 3),
( 10, 3),
( 11, 7),
( 12, 2),
( 13, 2),
(14 , 8),
( 15, 3);

INSERT INTO film_genre VALUES 
(1, 1), (1, 2), (1, 3), (2, 1) , (2, 4), (2, 5), (3, 6), (3, 7), (3, 4);

