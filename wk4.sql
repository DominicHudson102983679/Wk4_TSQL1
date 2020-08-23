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

/* ------------------------------ Task 2


I know how to create functions but whenever i entered strings 
into the RETURN CONCAT, I got this error:
"Conversion failed when converting the varchar value '2 + 3 = 5' to data type int"
Just settled for listing the parameters and output




DROP FUNCTION IF EXISTS [ADD];
GO

CREATE FUNCTION [ADD] (@num1 INT, @num2 INT) RETURNS INT AS
BEGIN
    RETURN @num1 + @num2;    
END;

go

BEGIN
DECLARE @RESULT INT;
EXEC @RESULT = ADD5 @num1 = 2, @num2 = 3;
    SELECT CONCAT(@num1, ' + ', @num2, ' = ', @RESULT);
END;
*/

/* ------------------------------------ Task 3

DROP TABLE IF EXISTS ACCOUNT1;
DROP TABLE IF EXISTS LOG;


GO

CREATE TABLE ACCOUNT1 (
    AcctNo INT,
    Fname NVARCHAR(100),
    Lname NVARCHAR(100),
    CreditLimit INT,
    Balance INT,
    PRIMARY KEY (AcctNo)
)

CREATE TABLE LOG (
    OrigAcct INT,
    LogDateTime DATETIME,
    RecAcct INT,
    Amount INT,
    PRIMARY KEY (OrigAcct, LogDateTime),
    FOREIGN KEY (OrigAcct) references Account1 (AcctNo),
    FOREIGN KEY (RecAcct) references Account1 (AcctNo)
);


GO

*/

/*
INSERT INTO ACCOUNT1 (AcctNo, Fname, Lname, CreditLimit, Balance) VALUES
(1, 'Dom', 'Hudson', 1000, 500),
(2, 'Joel', 'Malcolm', 2000, 700)
*/

DROP procedure if exists TRANSFER;

GO

Create procedure TRANSFER @FromAcct INT, @ToAcct INT, @Amnt INT AS
BEGIN 

    

    update ACCOUNT1 
    set Balance = Balance - @Amnt
    WHERE AcctNo = @FromAcct

    update ACCOUNT1 
    set Balance = Balance + @Amnt
    WHERE AcctNo = @ToAcct

    Insert Into LOG (OrigAcct, LogDateTime, RecAcct, Amount) VALUES
    (@FromAcct, SYSDATETIME(), @ToAcct, @Amnt);

END;

go

Exec TRANSFER @FromAcct = 1, @ToAcct = 2, @Amnt = 400

go

SELECT *
FROM Account1;

SELECT *
FROM Log;
