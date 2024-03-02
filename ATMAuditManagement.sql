Create database FinancialServicesCommisson;
-- Create the new table with FINumber as an auto-incremented INT

CREATE TABLE FinancialInstitution (
    FINumber INT IDENTITY(1,1) PRIMARY KEY,
    address VARCHAR(50) NOT NULL,
    parish VARCHAR (50),
    name VARCHAR(50),
    mainBanker VARCHAR(50),
    branchNo INT,
    contactNum BIGINT
);


INSERT INTO FinancialInstitution (address, parish, name, branchNo, contactNum)
VALUES
('2-4 Ward Avenue, Mandeville','Manchester', 'First Global Bank', 99075, 8763456783),
('63 Knutsford Boulevard, Kingston 05', 'Kingston', 'Citibank N.A.', 00001, 8765554321),
('25 Church Street, Montego Bay', 'Mnahcester', 'JMMB', 00003, 8767789065),
('45a Main Street. May Pen', 'Clarendon', 'JN Bank', 00056, 8765387623),
('124 - 126 Constant Spring RoD', 'Kingston','National Commercial Bank', 00033, 8763451234);

SELECT * FROM FinancialInstitution;

CREATE TABLE CommercialBank (
  FINumber INT PRIMARY KEY,
  deposit DECIMAL(10, 2),
  revenue DECIMAL(10, 2),
  FOREIGN KEY (FINumber) REFERENCES  FinancialInstitution(FINumber)
);

INSERT INTO CommercialBank (FINumber, deposit, revenue)
VALUES
(1, 5000.00, 25000.00),
(2, 7500.00, 30000.00),
(3, 6000.00, 28000.00),
(4, 8500.00, 32000.00),
(5, NULL, 29000.00);


CREATE TABLE CreditUnion (
	 FINumber INT PRIMARY KEY,
	 numShareholders INT,
	 FOREIGN KEY (FINumber) REFERENCES FinancialInstitution(FINumber)
);

CREATE TABLE ATM (
	atmCode  INT IDENTITY(1,1) PRIMARY KEY,
	FINumber INT,
	atmName  VARCHAR (50),
	atmAddress  VARCHAR(50),
	atmType    varchar(50),
	FOREIGN KEY (FINumber) REFERENCES FinancialInstitution(FINumber)
);

INSERT INTO ATM (FINumber, atmName, atmAddress, atmType)
VALUES
(5, 'National Housing Trust ABM', '4 Park Blvd, Kingston 5', 'Regular Kiosk'),
(5, 'Manor Centre ABM', '195 Constant Spring Rd, Kingston 8', 'Teller Machine'),
(5, 'Oxford Place Branch ABM', '10 Oxford Road, Kingston 5', 'Regular Kiosk');
Select * from ATM;


CREATE TABLE ATMTransaction (
    transactionCode INT,
    atmCode INT NOT NULL,
    status VARCHAR(50),
    balanceAfter DECIMAL(10, 2),
    type VARCHAR(50),
    date DATETIME,
    amount DECIMAL(10, 2),
    balanceBefore DECIMAL(10, 2) NOT NULL,
    cardNumber VARCHAR(16) NOT NULL,
    cvv VARCHAR(3) NOT NULL,
    accountNumber VARCHAR(20) NOT NULL,
	PRIMARY KEY (transactionCode, atmCode),
    FOREIGN KEY (atmCode) REFERENCES ATM(atmCode)
    );

	INSERT INTO ATMTransaction (transactionCode, atmCode, status, balanceAfter, type, date, amount, balanceBefore, cardNumber, cvv, accountNumber) 
	VALUES 
    (1001, 2, 'Success', 1500.00, 'Withdrawal', '2024-01-17 09:30:00', 100.00, 1600.00, '1234567890123456', '123', '1234567890'),
    (1002, 3, 'Success', 500.00, 'Deposit', '2024-01-17 10:15:00', 300.00, 200.00, '9876543210987654', '456', '0987654321'),
    (1003, 4, 'Failed', 250.00, 'Transfer', '2024-01-17 11:00:00', 50.00, 300.00, '4567890123456789', '789', '2345678901'),
    (1004, 5, 'Success', 1200.00, 'Purchase', '2024-01-17 11:45:00', 100.00, 1300.00, '6543210987654321', '012', '3456789012'),
    (1005, 2, 'Success', 180.00, 'Withdrawal', '2024-01-17 12:30:00', 20.00, 200.00, '8901234567890123', '234', '4567890123'),
    (1006, 3, 'Success', 700.00, 'Deposit', '2024-01-17 13:15:00', 200.00, 500.00, '6789012345678901', '567', '6789012345'),
    (1007, 4, 'Failed', 80.00, 'Withdrawal', '2024-01-17 14:00:00', 20.00, 100.00, '0123456789012345', '890', '8901234567'),
    (1008, 5, 'Success', 2200.00, 'Deposit', '2024-01-17 14:45:00', 2000.00, 200.00, '3456789012345678', '123', '2345678901'),
    (1009, 2, 'Success', 750.00, 'Transfer', '2024-01-17 15:30:00', 50.00, 800.00, '4567890123456789', '456', '3456789012'),
    (1010, 3, 'Success', 600.00, 'Withdrawal', '2024-01-17 16:15:00', 400.00, 1000.00, '5678901234567890', '789', '4567890123');

	Select *from ATMTransaction;

CREATE TABLE Investigation (
    referenceNum INT IDENTITY(1,1) PRIMARY KEY,
    purpose VARCHAR(255),
    dateStarted DATE,
    dateEnded DATE
  );

  INSERT INTO Investigation (purpose, dateStarted, dateEnded) 
VALUES 
    ('Fraudulent Activity', '2023-05-10', '2023-06-10'),
    ('Money Laundering', '2023-07-15', '2023-08-20'),
    ('Security Breach', '2023-09-20', '2023-10-25'),
    ('Customer Complaint', '2023-11-05', '2023-12-10'),
    ('Employee Misconduct', '2024-01-15', '2024-02-20'),
    ('Accounting Irregularities', '2024-03-01', '2024-04-05'),
    ('Data Privacy Violation', '2024-05-10', '2024-06-15'),
    ('Regulatory Compliance', '2024-07-20', '2024-08-25'),
    ('Cybersecurity Threat', '2024-09-05', '2024-10-10'),
    ('Internal Audit', '2024-11-15', '2024-12-20');

 CREATE TABLE Auditor (
    auditorID INT PRIMARY KEY,
    auditorName VARCHAR(255),
    salary DECIMAL(10, 2),
    gender CHAR(1),
    phone VARCHAR(20),
    auditorAddress VARCHAR(255)
);

INSERT INTO Auditor (auditorID, auditorName, salary, gender, phone, auditorAddress) 
VALUES 
    (1, 'John Doe', 75000.00, 'M', '123-456-7890', '123 Main St'),
    (2, 'Jane Smith', 80000.00, 'F', '987-654-3210', '456 Elm St'),
    (3, 'Michael Johnson', 70000.00, 'M', '555-555-5555', '789 Oak St'),
    (4, 'Emily Brown', 85000.00, 'F', '111-222-3333', '321 Pine St'),
    (5, 'David Wilson', 72000.00, 'M', '777-888-9999', '555 Maple St'),
    (6, 'Jessica Taylor', 78000.00, 'F', '444-444-4444', '888 Cedar St'),
    (7, 'Christopher Martinez', 73000.00, 'M', '666-777-8888', '222 Birch St'),
    (8, 'Amanda White', 82000.00, 'F', '999-999-9999', '777 Walnut St'),
    (9, 'Daniel Anderson', 71000.00, 'M', '333-333-3333', '444 Ash St'),
    (10, 'Ashley Garcia', 79000.00, 'F', '222-222-2222', '999 Pine St');


CREATE TABLE TransInvest (
    atmCode INT,
    transactionCode INT,
    referenceNum INT,
    auditorID INT,
    PRIMARY KEY (atmCode, transactionCode, referenceNum),
    FOREIGN KEY (transactionCode, atmCode) REFERENCES ATMTransaction(transactionCode, atmCode),
    FOREIGN KEY (referenceNum) REFERENCES Investigation(referenceNum),
    FOREIGN KEY (auditorID) REFERENCES Auditor(auditorID)
);

INSERT INTO TransInvest (atmCode, transactionCode, referenceNum, auditorID) 
VALUES 
    (2, 1001, 1, 1),
    (3, 1002, 2, 2),
    (4, 1003, 3, 3),
    (5, 1004, 4, 4),
    (2, 1005, 5, 5),
    (3, 1006, 6, 6),
    (4, 1007, 7, 7),
    (5, 1008, 8, 8),
    (2, 1009, 9, 9),
    (3, 1010, 10, 10);


-- Drop the existing primary key constraint
ALTER TABLE TransInvest
DROP CONSTRAINT PK__TransInvest;

-- Add a new primary key without auditorID
ALTER TABLE TransInvest  
ADD CONSTRAINT PK_TransInvest PRIMARY KEY (atmCode, transactionCode, referenceNum);

--View displays info on ATMs such as the number of transactions per atm, number of investigations
CREATE VIEW ATM_Transaction_View AS
SELECT
    atm.atmCode,
    atm.atmName AS atmName,
	atm.atmAddress AS atmLocation,
	atm.atmType as atmType,
    COUNT(tr.transactionCode) AS totalTransactions,
    COUNT(DISTINCT iv.referenceNum) AS totalInvestigations
FROM
    ATM atm
LEFT JOIN
    ATMTransaction tr ON atm.atmCode = tr.atmCode
LEFT JOIN
    TransInvest tim ON tr.transactionCode = tim.transactionCode AND tr.atmCode = tim.atmCode
LEFT JOIN
    Investigation iv ON tim.referenceNum = iv.referenceNum
GROUP BY
    atm.atmCode, atm.atmName, atm.atmAddress, atm.atmType;
Select * from ATM_Transaction_View; 



CREATE VIEW FlaggedTransactionsReport AS
SELECT
    tr.transactionCode,
    tr.status AS transactionStatus,
    tr.balanceAfter,
    tr.type AS transactionType,
    tr.date AS transactionDate,
    tr.amount,
    tr.cardNumber,
    tr.accountNumber,
    iv.purpose AS investigationPurpose,
    iv.dateStarted AS investigationStartDate,
    iv.dateEnded AS investigationEndDate,
    au.auditorName AS auditorName
FROM
    ATMTransaction tr
JOIN
    TransInvest tim ON tr.transactionCode = tim.transactionCode AND tr.atmCode = tim.atmCode
JOIN
    Investigation iv ON tim.referenceNum = iv.referenceNum
JOIN
    Auditor au ON tim.auditorID = au.auditorID;

select *from FlaggedTransactionsReport;

CREATE VIEW OngoingInvestigationsReport AS
SELECT
    tr.transactionCode,
    tr.status AS transactionStatus,
    tr.type AS transactionType,
    tr.date AS transactionDate,
    tr.amount,
    tr.cardNumber,
    tr.accountNumber,
	iv.referenceNum,
    iv.purpose AS purpose,
    iv.dateStarted AS investigationStartDate,
    iv.dateEnded AS investigationEndDate,
    au.auditorName AS auditorName
FROM
    ATMTransaction tr
JOIN
    TransInvest tim ON tr.transactionCode = tim.transactionCode AND tr.atmCode = tim.atmCode
JOIN
    Investigation iv ON tim.referenceNum = iv.referenceNum
                      AND iv.dateEnded IS NULL -- Only include ongoing investigations
JOIN
    Auditor au ON tim.auditorID = au.auditorID;

select *from OngoingInvestigationsReport;
select *from Investigation;
select*from TransInvest;


CREATE VIEW FinancialInstitutionOverview AS
SELECT
    fi.FINumber,
    fi.name,
    fi.address,
    fi.mainBanker,
    fi.branchNo,
    fi.contactNum,
    cb.deposit AS commercialBankDeposit,
    cb.revenue AS commercialBankRevenue,
    cu.numShareholders AS creditUnionShareholders
FROM
    FinancialInstitution fi
LEFT JOIN
    CommercialBank cb ON fi.FINumber = cb.FINumber
LEFT JOIN
    CreditUnion cu ON fi.FINumber = cu.FINumber;

Select *from FinancialInstitutionOverview; 

--View showing the number of investigations on financial institutions in the past year
CREATE VIEW InvestigationsPerFinancialInstitution AS
SELECT
    fi.FINumber,
    fi.name AS financialInstitutionName,
    COUNT(DISTINCT iv.referenceNum) AS totalInvestigations
FROM
    FinancialInstitution fi
LEFT JOIN
    ATM atm ON fi.FINumber = atm.FINumber
LEFT JOIN
    ATMTransaction tr ON atm.atmCode = tr.atmCode
LEFT JOIN
    TransInvest tim ON tr.transactionCode = tim.transactionCode AND tr.atmCode = tim.atmCode
LEFT JOIN
    Investigation iv ON tim.referenceNum = iv.referenceNum
AND
    iv.dateStarted >= DATEADD(YEAR, -1, GETDATE())
GROUP BY
    fi.FINumber, fi.name;
Select *from InvestigationsPerFinancialInstitution; 




------------------------DEMO 2 SQL STATEMENTS-----------------------------------------
--Stored Procedures
--This procedure inserts new ATM records into the DB
CREATE PROCEDURE SP_InsertATM
    @FINumber INT,
    @atmName VARCHAR(50),
    @atmAddress VARCHAR(50),
    @atmType VARCHAR(50)
AS
BEGIN
    INSERT INTO ATM (FINumber, atmName, atmAddress, atmType)
    VALUES (@FINumber, @atmName, @atmAddress, @atmType);
END;

--This procedure Retrieves ATM records belonging to a specific bank or financial institution.
CREATE PROCEDURE GetATMsByBank
    @BankID INT
AS
BEGIN
    SELECT atmCode, atmName, atmAddress, atmType
    FROM ATM
    WHERE FINumber = @BankID;
END;

--This procedures allows an auditor to start a new investigation
CREATE PROCEDURE SP_InsertInvestigation
    @ATMCode INT,
    @TransactionCode INT,
    @Purpose VARCHAR(255),
    @AuditorID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Start a transaction
        BEGIN TRANSACTION;

        -- Insert investigation record
        INSERT INTO Investigation (purpose, dateStarted, dateEnded)
        VALUES (@Purpose, GETDATE(), NULL); -- Assuming dateEnded is nullable and initially set to NULL

        -- Get the referenceNum of the inserted investigation
        DECLARE @ReferenceNum INT;
        SET @ReferenceNum = SCOPE_IDENTITY();

        -- Insert record into TransInvest for the transaction code
        INSERT INTO TransInvest (atmCode, transactionCode, referenceNum, auditorID)
        VALUES (@ATMCode, @TransactionCode, @ReferenceNum, @AuditorID);

		-- Update status of the transaction to "Under investigation"
        UPDATE ATMTransaction
        SET status = 'Under investigation'
        WHERE transactionCode = @TransactionCode AND atmCode = @ATMCode;

        -- Commit the transaction
        COMMIT TRANSACTION;

        -- Return success status or any other desired output
        SELECT 'Investigation inserted successfully.' AS Status;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurs
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Raise an error or return error status as needed
        THROW;
    END CATCH;
END
--Test
EXEC SP_InsertInvestigation @ATMCode = 5, @TransactionCode = 1004, @Purpose = 'Accounting Irregularities', @AuditorID = 2;

Select *from TransInvest;
Select *from Investigation;
Select *from ATMTransaction;

--Close an ongoing investigation, updating its end date and the status of the associated transaction.
CREATE PROCEDURE SP_CloseInvestigation
    @ReferenceNum INT,
    @Status VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Start a transaction
        BEGIN TRANSACTION;

        -- Update the end date of the investigation
        UPDATE Investigation
        SET dateEnded = GETDATE()
        WHERE referenceNum = @ReferenceNum;

        -- Update the status of the associated transaction
        UPDATE ATMTransaction
        SET status = @Status
        WHERE transactionCode IN (SELECT transactionCode FROM TransInvest WHERE referenceNum = @ReferenceNum);

        -- Commit the transaction
        COMMIT TRANSACTION;

        -- Return success status or any other desired output
        SELECT 'Investigation closed successfully.' AS Status;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurs
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Raise an error or return error status as needed
        THROW;
    END CATCH;
END

EXEC SP_CloseInvestigation @ReferenceNum = 18, @Status='Failed';

Select *from Investigation;
Select *from ATMTransaction;

--Functions
CREATE FUNCTION CalculateTransactionMetrics()
RETURNS TABLE
AS
RETURN
(
    WITH TransactionCounts AS (
        -- Step 2: Retrieve the total number of transactions for each ATM
        SELECT atmCode, 
               COUNT(*) AS NumTransactions,
               SUM(CASE WHEN status = 'Success' THEN 1 ELSE 0 END) AS SuccessfulTransactions,
               SUM(CASE WHEN status = 'Failed' THEN 1 ELSE 0 END) AS FailedTransactions
        FROM ATMTransaction
        GROUP BY atmCode
    ),
    -- Step 3: Calculate the total number of ATMs
    TotalATMs AS (
        SELECT COUNT(*) AS NumATMs
        FROM ATM
    ),
    -- Step 4: Calculate the total number of transactions across all ATMs
    TotalTransactions AS (
        SELECT SUM(NumTransactions) AS TotalNumTransactions,
               SUM(SuccessfulTransactions) AS TotalSuccessfulTransactions,
               SUM(FailedTransactions) AS TotalFailedTransactions
        FROM TransactionCounts
    )
    -- Step 5: Calculate the average number of transactions per ATM
    SELECT 
        TC.atmCode,
        TC.NumTransactions,
        AT.TotalNumTransactions / TA.NumATMs AS AverageTransactionsPerATM,
        (TC.SuccessfulTransactions * 100.0 / TC.NumTransactions) AS PercentageSuccessfulTransactions,
        (TC.FailedTransactions * 100.0 / TC.NumTransactions) AS PercentageFailedTransactions
    FROM TransactionCounts TC
    CROSS JOIN TotalATMs TA
    CROSS JOIN TotalTransactions AT
);
SELECT *FROM CalculateTransactionMetrics();
Select *from ATMTransaction;



--Transactions: 
DECLARE @AuditorID INT;
DECLARE @InvestigationReferenceNum INT;

SET @AuditorID = 1;
SET @InvestigationReferenceNum = 2;

BEGIN TRANSACTION;
-- Check if the auditor is available
IF NOT EXISTS (SELECT 1 FROM Auditor WHERE auditorID = @AuditorID)
BEGIN
    PRINT 'Auditor not found.';
    ROLLBACK TRANSACTION;
    RETURN;
END;

-- Update the investigation with the assigned auditor
UPDATE TransInvest
SET auditorID = @AuditorID
WHERE referenceNum = @InvestigationReferenceNum;

-- Commit the transaction
COMMIT TRANSACTION;

PRINT 'Auditor successfully assigned to investigation.';















