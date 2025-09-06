USE IRYNAR_use;

-- 1 Вывести id департамента , в котором работает сотрудник, в зависимости от Id сотрудника
-- в моей базе нет департамента сотрудников, поэтому я выведу e-mail. 
DELIMITER //
CREATE PROCEDURE email_emp_id(IN empl_id INT)
BEGIN
	SELECT email FROM employees
    WHERE employee_id = empl_id;
END //
DELIMITER ;

CALL email_emp_id(2);


-- 2 Создайте хранимую процедуру get_employee_age,
-- которая принимает id сотрудника (IN-параметр) и возвращает его возраст через OUT-параметр.
DELIMITER //
CREATE PROCEDURE get_employee_age(IN emp_id INT, OUT emp_age INT)
BEGIN
	SELECT age_func(birth_date) INTO emp_age
    FROM employees
    WHERE employee_id = emp_id;
END //
DELIMITER ;

-- для вывода копирую сюда:
set @emp_age = 0;
call IRYNAR_use.get_employee_age(3, @emp_age);
select @emp_age;

-- 3 Создайте хранимую процедуру decrease_salary, которая принимает зарплату сотрудника (INOUT-параметр) и уменьшает ее на 10%.
DELIMITER //
CREATE PROCEDURE decrease_salary(INOUT emp_salary DECIMAL(8, 2))
BEGIN
	SET emp_salary = emp_salary * 0.9;
END //
DELIMITER ;

-- для вывода копирую сюда:
set @emp_salary = 1000;
call IRYNAR_use.decrease_salary(@emp_salary);
select @emp_salary;
