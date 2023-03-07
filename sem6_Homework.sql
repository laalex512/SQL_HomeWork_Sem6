CREATE DATABASE IF NOT EXISTS homework6;

USE homework6;

# Task1
/*Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '*/

DROP FUNCTION IF EXISTS task1;
delimiter //
CREATE FUNCTION task1(init_seconds INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE days INT DEFAULT 0;
	DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
	SET days = init_seconds / 86400;  # Количество секунд в дне 
    SET init_seconds = init_seconds % 86400; # Остаток от деления на дни
	SET hours = init_seconds / 3600; # Количество секунд в часе
    SET init_seconds = init_seconds % 3600; # Остаток от деления на часы
    SET minutes = init_seconds / 60; # в часе
    SET seconds = init_seconds % 60;
    
    RETURN CONCAT(days, ' days', hours, ' hours', minutes, ' minutes', seconds, ' seconds ');
END //
delimiter ;

SELECT task1(86470);


# Task2

/*Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)*/

DROP FUNCTION IF EXISTS task2;
delimiter //
CREATE FUNCTION task2(init_number INT)
RETURNS VARCHAR(500)
DETERMINISTIC
BEGIN
	DECLARE current_num INT DEFAULT 2;
    DECLARE result VARCHAR(500) DEFAULT "";
	WHILE current_num <= init_number DO
		SET result = CONCAT(result, " ", current_num);
        SET current_num = current_num + 2;
    END WHILE;
    RETURN result;
END //
delimiter ;

SELECT task2(25);
