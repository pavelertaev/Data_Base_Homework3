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
SELECT * FROM employee_1 WHERE age>30 AND age <50;
SELECT * FROM employee_1
ORDER BY last_name DESC , last_name;
SELECT * FROM employee_1 WHERE first_name>4;
UPDATE employee_1 SET first_name = 'pavel' , last_name = 'ertaev' , age = 31 WHERE id=2;
UPDATE employee_1 SET first_name = 'anton' , last_name = 'antonov' , age = 40 WHERE id=4;
UPDATE employee_1 SET  age = 31 WHERE id=1;
UPDATE employee_1 SET  gender = 'men' WHERE id=4;
SELECT first_name AS имя,
       SUM(age)
FROM employee_1 GROUP BY имя;
SELECT * FROM employee_1
WHERE age = (
    SELECT     min(age)
    FROM employee_1 );
SELECT * FROM employee_1
WHERE age = (
    SELECT     max(age)
    FROM employee_1   );
