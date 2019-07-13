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

if not exists (select * from sysobjects where name='Genres' and xtype='U')
    BEGIN
        PRINT 'Creating Genres table'
        CREATE TABLE Genres 
        (
            Id INT IDENTITY(1,1) PRIMARY KEY,
            gen_title NVARCHAR(50)
        )

        PRINT 'Inserting default values in Genres table...'
        INSERT INTO Genres(gen_title) VALUES('Action');
        INSERT INTO Genres(gen_title) VALUES('Adventure');
        INSERT INTO Genres(gen_title) VALUES('Romance');
        INSERT INTO Genres(gen_title) VALUES('Thriller');
        INSERT INTO Genres(gen_title) VALUES('War');
    END
GO

if not exists (select * from sysobjects where name='Stars' and xtype='U')
    BEGIN
        PRINT 'Creating Level table'
        CREATE TABLE Stars 
        (
            Id INT IDENTITY(1,1) PRIMARY KEY,
            starValue NVARCHAR(50)
        )

        PRINT 'Inserting default values in Genres table...'
        INSERT INTO Stars(starValue) VALUES('5 - Star');
        INSERT INTO Stars(starValue) VALUES('4 - Star');
        INSERT INTO Stars(starValue) VALUES('3 - Star');
        INSERT INTO Stars(starValue) VALUES('2 - Star');
		INSERT INTO Stars(starValue) VALUES('1 - Star');
    END
GO

if not exists (select * from sysobjects where name='Movie' and xtype='U')
    BEGIN
        PRINT 'Creating Movie table'
        CREATE TABLE Movie 
        (
            Id INT IDENTITY(1,1) PRIMARY KEY,             
            movieName NVARCHAR(50), 
			directorName NVARCHAR(50),
			description NVARCHAR(200),
            genreId INT REFERENCES Genres(Id),
            starId INT REFERENCES Stars(Id)
        )

        PRINT 'Inserting default values into Movie table'
        INSERT INTO Movie(movieName, directorName, description, genreId, starId) VALUES ('Titanic', 'James Cameron', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic', 3, 1); 
        INSERT INTO Movie(movieName, directorName, description, genreId, starId) VALUES ('Die Another Day', 'Lee Tamahori', 'James Bond is sent to investigate the connection between a North Korean terrorist and a diamond mogul, who is funding the development of an international space weapon', 1, 2);
        INSERT INTO Movie(movieName, directorName, description, genreId, starId) VALUES ('Jurassic Park', 'Steven Spielberg', 'During a preview tour, a theme park suffers a major power breakdown that allows its cloned dinosaur exhibits to run amok', 1, 2);
		INSERT INTO Movie(movieName, directorName, description, genreId, starId) VALUES ('Mission Impossible', 'Brian De Palma', 'An American agent, under false suspicion of disloyalty, must discover and expose the real spy without the help of his organization', 4, 1);
		INSERT INTO Movie(movieName, directorName, description, genreId, starId) VALUES ('Gone in sixty seconds', 'Dominic Sena', 'A retired master car thief must come back to the industry and steal fifty cars with his crew in one night to save his brothers life', 1, 1);
    END
GO

if not exists (select * from sysobjects where name='KeyValue' and xtype='U')
    BEGIN
        CREATE TABLE KeyValue ([Key] NVARCHAR(10), [Value] NVARCHAR(100))

        INSERT INTO KeyValue VALUES('BBT', 'Bing Bang Theory');
       
    END
GO