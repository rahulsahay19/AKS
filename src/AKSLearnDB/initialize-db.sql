IF  NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'AKSLearnDB')
    BEGIN
        PRINT 'Creating database AKSLearnDB...'
        CREATE DATABASE [AKSLearnDB]
    END;
GO

-- IF  EXISTS (SELECT * FROM sys.databases WHERE name = N'AKSLearnDB')
--     BEGIN
--         PRINT 'Dropping existing database...'
--         DROP DATABASE [AKSLearnDB]
--     END;
-- GO

-- PRINT 'Creating database AKSLearnDB...'
-- CREATE DATABASE [AKSLearnDB]

SELECT Name from sys.Databases
GO

USE AKSLearnDB
GO

if not exists (select * from sysobjects where name='Categories' and xtype='U')
    BEGIN
        PRINT 'Creating Categories table'
        CREATE TABLE Categories 
        (
            Id INT IDENTITY(1,1) PRIMARY KEY,
            categoryName NVARCHAR(50), 
            description NVARCHAR(100)
        )

        PRINT 'Inserting default values in categories table...'
        INSERT INTO Categories(categoryName, description) VALUES('AKS Meetup', 'AKS Community event');
        INSERT INTO Categories(categoryName, description) VALUES('Kongsberg Tech Conference', 'Free Tech Conference');
        INSERT INTO Categories(categoryName, description) VALUES('ThoughtWorks Conference', 'Paid Tech Conference');
        INSERT INTO Categories(categoryName, description) VALUES('Kongsberg Hackathon', 'Open Hack for all');
        INSERT INTO Categories(categoryName, description) VALUES('Golang Conference', 'Golang Community event');
    END
GO

if not exists (select * from sysobjects where name='Levels' and xtype='U')
    BEGIN
        PRINT 'Creating Level table'
        CREATE TABLE Levels 
        (
            Id INT IDENTITY(1,1) PRIMARY KEY,
            levelName NVARCHAR(50)
        )

        PRINT 'Inserting default values in categories table...'
        INSERT INTO Levels(levelName) VALUES('100 - Beginer');
        INSERT INTO Levels(levelName) VALUES('200 - Intermediate');
        INSERT INTO Levels(levelName) VALUES('300 - Advanced');
        INSERT INTO Levels(levelName) VALUES('400 - Expert');
    END
GO

if not exists (select * from sysobjects where name='TechTalk' and xtype='U')
    BEGIN
        PRINT 'Creating TechTalk table'
        CREATE TABLE TechTalk 
        (
            Id INT IDENTITY(1,1) PRIMARY KEY,             
            techtalkname NVARCHAR(50), 
            categoryId INT REFERENCES Categories(Id),
            levelId INT REFERENCES Levels(Id)
        )

        PRINT 'Inserting default values into TechTalk table'
        INSERT INTO TechTalk(techtalkname, categoryId, levelId) VALUES ('Scaling Docker Containers', 1, 1); 
        INSERT INTO TechTalk(techtalkname, categoryId, levelId) VALUES ('Azure Container Services', 2, 2);
        INSERT INTO TechTalk(techtalkname, categoryId, levelId) VALUES ('Kubernetes', 3, 3);
		INSERT INTO TechTalk(techtalkname, categoryId, levelId) VALUES ('Open Hack', 4, 4);
    END
GO

if not exists (select * from sysobjects where name='KeyValue' and xtype='U')
    BEGIN
        CREATE TABLE KeyValue ([Key] NVARCHAR(10), [Value] NVARCHAR(100))

        INSERT INTO KeyValue VALUES('BBT', 'Big Bang Theory');
       
    END
GO