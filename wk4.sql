use tsql;

go

/* ----------------------------- Task 1
CREATE PROCEDURE MULTIPLY1
    @num1 INT, 
    @num2 INT AS
BEGIN
    SELECT CONCAT ('The output of ', @num1, ' times ', @num2, ' equals ', @num1 * @num2)    
END;

go

EXEC MULTIPLY1 @num1 = 2, @num2 = 3;
*/

CREATE FUNCTION ADD4 (@num1 INT, @num2 INT) RETURNS INT
BEGIN
    RETURN CONCAT (@num1, ' + ', @num2, ' = ', @num1 + @num2)    
END;

go

BEGIN
    SELECT dbo.ADD4(2, 3);
END;