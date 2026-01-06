--create schema DWH;

CREATE TABLE DWH.DimDate
(
    DateKey        INT IDENTITY(1,1) PRIMARY KEY,
    Date           datetime2(0) NOT NULL,
    Year           INT,
    Month          INT,
    Day            INT,
    DayName        NVARCHAR(20),
    Hour           INT,
    Min            INT
);

CREATE TABLE DWH.DimUsers
(
    UserKey            INT IDENTITY(1,1) PRIMARY KEY,
    ID                 INT,
    Age                INT,
    RetirementAge      INT,
    YearOfBirth        INT,
    MonthOfBirth       INT,
    Gender             NVARCHAR(10),
    StreetNum          INT,
    StreetKey          INT,
    Latitude           FLOAT,
    Longitude          FLOAT,
    PerCapitaIncome    INT,
    YearlyIncome       INT,
    TotalDebt          INT,
    CreditScore        INT,
    NumOfCreditCards   INT
);

(
    CardKey               INT IDENTITY(1,1) PRIMARY KEY,
    CardID                INT,
    UserKey               INT,
    CardBrand             NVARCHAR(50),
    CardType              NVARCHAR(50),
    ExpireDateKey         INT,
    HasChip               NVARCHAR(50),
    NumOfCards            INT,
    CreditLimit           INT,
    AccountOpenDateKey    INT,
    LastPinChangeYear     INT
);

CREATE TABLE DWH.DimCity 
(
    CityKey   INT IDENTITY(1,1) PRIMARY KEY,
    City      NVARCHAR(100)
);

CREATE TABLE DWH.DimState
(
    StateKey   INT IDENTITY(1,1) PRIMARY KEY,
    StateCode  NVARCHAR(50)
);

CREATE TABLE DWH.DimChip
(
    ChipKey   INT IDENTITY(1,1) PRIMARY KEY,
    Chip      NVARCHAR(50)
);

CREATE TABLE DWH.DimMCC
(
    MCCKey     INT IDENTITY(1,1) PRIMARY KEY,
    MCC_Code   INT,
    MCC        NVARCHAR(200)
);

CREATE TABLE DWH.DimStreet
(
    StreetKey     INT IDENTITY(1,1) PRIMARY KEY,
    StreetName    NVARCHAR(50)
);

CREATE TABLE DWH.DimErrors
(
    ErrorsKey    INT IDENTITY(1,1) PRIMARY KEY,
    Error        NVARCHAR(100)
);

CREATE TABLE DWH.FactTransactions
(
    TransactionKey              INT IDENTITY(1,1) PRIMARY KEY,
    ID                          INT,
    DateKey                     INT,
    UserKey                     INT,
    CardKey                     INT,
    Amount                      FLOAT,
    UseChipKey                  INT,
    MerchantID                  INT,
    CityKey                     INT,
    StateKey                    INT,
    ZIP                         INT,
    MCCKey                      INT,
    ErrorsKey                   INT,
    Target                      INT
);


IF OBJECT_ID('DWH.DimDate', 'U') IS NOT NULL
    DROP TABLE DWH.DimDate;

CREATE TABLE DWH.DimDate 
(
    DateKey        INT IDENTITY(1,1) PRIMARY KEY,
    Date           datetime2(0) NOT NULL,
    Year           INT,
    Month          INT,
    Day            INT,
    DayName        VARCHAR(20),
    Hour           INT,
    Min            INT
);

WITH HourlyDates AS
(
    SELECT CAST('1990-01-01 00:00:00' AS datetime2(0)) AS DateValue
    UNION ALL
    SELECT DATEADD(HOUR, 1, DateValue)
    FROM HourlyDates
    WHERE DATEADD(HOUR, 1, DateValue) <= '2030-12-31 23:00:00'
)
INSERT INTO DWH.DimDate (Date, Year, Month, Day, DayName, Hour, Min)
SELECT 
    DateValue,
    YEAR(DateValue) AS Year,
    MONTH(DateValue) AS Month,
    DAY(DateValue) AS Day,
    DATENAME(WEEKDAY, DateValue) AS DayName,
    DATEPART(HOUR, DateValue) AS Hour,
    DATEPART(MINUTE, DateValue) AS Min
FROM HourlyDates
OPTION (MAXRECURSION 0);




