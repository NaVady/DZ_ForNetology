--Домашнее задание № 1 (Грачева Наталья)
-- Табличка films:
-- 
-- title - название (текст)
-- id (число) соответствует film_id в табличке persons2content
-- country страна (тест)
-- box_office сборы в долларах (число)
-- release_date дата выпуска (date)

-- Табличка persons
--  
-- id (число) - соответствует person_id в табличке persons2content
-- fio (текст) фамилия, имя

-- Табличка persons2content
-- 
-- person_id (число) - id персоны
-- film_id (число) - id контента
-- person_type (текст) тип персоны (актёр, режиссёр и т.д.)
-- Таким образом реализуется схема БД "Звезда" с центром в табличке persons2content

CREATE TABLE films 
(
	title 		 character varying(35) NOT NULL	,
	id 			 integer     		  NOT NULL	,
	country 	 character varying(30) NOT NULL	,
	box_office 	 numeric		    			,
	release_date date		    				,
	
	CONSTRAINT films_tables_key 
		PRIMARY KEY (id)	    ,
	CONSTRAINT films_tables_uniq
		UNIQUE (title) 		-- !допускаю, что есть одинаковые названия фильмов
 );

CREATE TABLE persons 
(
	fio 		character varying(40) NOT NULL,
	id 			integer     		  NOT NULL,
		
	CONSTRAINT persons_tables_key 
		PRIMARY KEY (id)	    
);


CREATE TABLE persons2content 
(
	person_id 	integer     NOT NULL,
	film_id		integer     NOT NULL,
	person_type 	character varying(30),
		
	CONSTRAINT films_tables_keyf1 
		FOREIGN KEY (person_id)
		REFERENCES persons(id)	    ,
	CONSTRAINT films_tables_keyf2
		FOREIGN KEY (film_id)
		REFERENCES films(id)	
);

INSERT INTO films VALUES
('Достучаться до небес', 10000, 'Германия', 5710, '01/01/1997'::timestamp),
('Законопослушный гражданин', 10001, 'США', 7335, '01/01/2009'::timestamp),
('Москва слезам не верит', 10002, 'Россия', 2500, '01/01/1979'::timestamp),
('Кинг Конг', 10003, 'Новая Зеландия', 21882, '01/01/2005'::timestamp)	  ,
('Области тьмы', 10004, 'США', 79249, '01/01/2011'::timestamp)
;

INSERT INTO persons VALUES
('Тиль Швайгер',100)	,
('Джерард Батлер',101)	,
('Вера Алентова',102)	,
('Питер Джексон',103)	,
('Лесли Диксон',104)
;

INSERT INTO persons2content VALUES
(100,10000,'Актер')		, -- к сожалению, не сообразила как подтягивать ID из двух других таблиц. Подскажите плийз
(101,10001,'Актер')		,
(102,10002,'Актер')		,
(103,10003,'Режиссер')	,
(104,10004,'Продюссер')
;
