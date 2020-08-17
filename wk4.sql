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


GO

CREATE TABLE ACCOUNT1 (
    AcctNo INT,
    Fname NVARCHAR(100),
    Lname NVARCHAR(100),
    CreditLimit MONEY,
    Balance MONEY,
    PRIMARY KEY (AcctNo)
)

CREATE TABLE LOG (
    OrigAcct INT,
    LogDateTime DATETIME,
    RecAcct INT,
    Amount MONEY,
    FOREIGN KEY (OrigAcct) references Account,
    FOREIGN KEY (RecAcct) references Account,
)


GO

INSERT INTO ACCOUNT1 (AcctNo, Fname, Lname, CreditLimit, Balance) VALUES
(1, 'Dom', 'Hudson', 1000, 500),
(2, 'Joel', 'Malcolm', 2000, 700)
*/

DROP procedure if exists TRANSFER;

GO

Create procedure TRANSFER @FromAcct INT, @ToAcct INT, @Amnt MONEY AS
BEGIN 
    update ACCOUNT set @FromAcct = AcctNo, @ToAcct = AcctNo, balance = balance - @Amnt where AcctNo = @FromAcct;
END;

Exec TRANSFER @FromAcct = 1, @ToAcct = 2, @Amnt = 400

go

SELECT *
FROM ACCOUNT1;