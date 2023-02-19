CREATE TABLE employee_1
(
    id BIGINT  NOT NULL  PRIMARY KEY ,
    first_name VARCHAR(50) NOT NULL ,
    last_name VARCHAR(50) NOT NULL ,
    gender VARCHAR(6) NOT NULL ,
    age INTEGER NOT NULL
);
INSERT INTO employee_1 VALUES
                           (1,'pavel','ertaev','men',31),
                           (2,'sergei','ivanov','men',25),
                           (3,'anton','antonov','men',40),
                           (4,'elena','ivanova','woman',52),
                           (5,'oksana','sergeeva','woman',22);




SELECT first_name AS Имя
FROM employee_1
GROUP BY Имя;
SELECT last_name AS Фамилия
FROM employee_1
GROUP BY Фамилия;
SELECT * FROM employee_1;
SELECT * FROM employee_1 WHERE age BETWEEN 30 AND 50;
SELECT * FROM employee_1
ORDER BY last_name DESC , last_name;
SELECT * FROM employee_1 WHERE length(first_name)>4;
UPDATE employee_1 SET first_name = 'pavel' , last_name = 'ertaev' , age = 31 WHERE id=2;
UPDATE employee_1 SET first_name = 'anton' , last_name = 'antonov' , age = 40 WHERE id=4;
UPDATE employee_1 SET  age = 31 WHERE id=1;
UPDATE employee_1 SET  gender = 'men' WHERE id=4;
/*Запрос на суммарный возраст для всех имен*/
SELECT first_name AS имя,
       SUM(age)
FROM employee_1 GROUP BY имя;
/*Запрос на возврат сотрудника с минимальным возрастом*/
SELECT * FROM employee_1
WHERE age = (
    SELECT     min(age)
    FROM employee_1 );
/*Возврат имени и максимального возраста для неуникальных имен*/
SELECT first_name AS Имя,
       MAX(age) AS Макс_возраст
FROM employee_1 GROUP BY Имя  HAVING count(first_name) > 1
                            ORDER BY Макс_возраст
/*Домашнее задание по теме работа с несколькими таблицами*/
CREATE TABLE IF NOT EXISTS city
(
    city_id   SERIAL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);


ALTER TABLE employee_1
    ADD COLUMN city_id varchar(50);

ALTER TABLE employee_1
    ALTER COLUMN city_id TYPE INTEGER USING city_id::integer;


ALTER TABLE employee_1
    ADD FOREIGN KEY (city_id) REFERENCES city (city_id);


INSERT INTO city
VALUES (1, 'Ivanovo'),
       (2, 'Moscow'),
       (3, 'Vladimir');

UPDATE employee_1
SET city_id=1
WHERE id = 1;
UPDATE employee_1
SET city_id=2
WHERE id = 2;
UPDATE employee_1
SET city_id=3
WHERE id = 3;
UPDATE employee_1
SET city_id=1
WHERE id = 4;
UPDATE employee_1
SET city_id=2
WHERE id = 5;

SELECT *
FROM employee;


SELECT first_name AS Имя,
       last_name  AS Фамилия,
       city_name

FROM employee_1
         INNER JOIN city ON employee_1.city_id = city.city_id
ORDER BY Имя;

INSERT INTO city
VALUES (4, 'NullCity');


SELECT city_name  AS Город,
       first_name AS Имя,
       last_name  AS Фамилия
FROM employee_1
         RIGHT JOIN city ON employee_1.city_id = city.city_id
ORDER BY Город;


SELECT city_name  AS Город,
       first_name AS Имя,
       last_name  AS Фамилия
FROM employee_1
         FULL OUTER JOIN city ON employee_1.city_id = city.city_id
ORDER BY Город;


SELECT first_name AS Имя,
       city_name  AS Город
FROM employee_1
         LEFT JOIN city ON employee_1.city_id = city.city_id
ORDER BY Город;
