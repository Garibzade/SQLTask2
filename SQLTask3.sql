CREATE DATABASE MUSICAPP

CREATE TABLE Users(
Id int  Primary Key,
[Name] NvarChar(20) Not Null,
Surname NvarChar(26) Null Default 'XXX',
UserName VarChar(14) Not Null,
[Password] VarChar(10) Not Null,
Gender VarChar(6)
)
CREATE TABLE Artists (
ID Int Primary Key,
[Name] VARCHAR(20),
Surname VARCHAR(26),
Birthday DATE,
Gender VARCHAR(10)
)
CREATE TABLE Categories (
Id INT PRIMARY KEY,
Name VARCHAR(50)
)
CREATE TABLE Musics(
Id Int  Primary Key,
[Name] VarChar(46),
Duration Int,
CategoryID Int  FOREIGN KEY (CategoryID)References Categories(Id),
ArtistID Int  FOREIGN KEY (ArtistID)References Artists(Id)
)

CREATE TABLE PlayLists(
Id Int Identity Primary key,
[Name] VarChar (28),
UserID Int FOREIGN KEY (UserID) References Users(Id)

)

CREATE TABLE PlaylistMusics(
Id Int Primary Key,
PlaylistID Int References Playlists(Id),
MusicID Int  References Musics(Id)
)


INSERT INTO Users 
VALUES 
(1,'Kamil', 'Qehramanov', 'ka.m7l', 'kamil1', 'Male'),
(2,'Sahil', 'Alizade', 'Alizade', 'sahin1', 'Female')


INSERT INTO Artists
VALUES
(1,'PSY', 'PSYZADE', '1980-01-17', 'Male'),
(2,'Angelina ', 'Jolie', '1985-05-05', 'Female')


INSERT INTO Categories
VALUES (1,'Jazz'),(2,'mugamat'),(3,'rep')


INSERT INTO Musics 
VALUES
(1,'GanGam', 240, 3, 1),
(2,'Ana mugamati', 180, 2, 2),
(3,'Ele onan', 300, 1, 1)


INSERT INTO Playlists 
VALUES ('Kamil-Playlist', 1),
       ('Sahin-Playlist', 2)

INSERT INTO PlaylistMusics 
VALUES (1,1, 1),
       (2,1, 2), 
       (3,2, 3)


CREATE VIEW MusicInfo AS
SELECT 
    m.Name AS MusicName,
    m.Duration,
    c.Name AS CategoryName,
    a.Name AS ArtistName
FROM 
    Musics m
JOIN 
    Categories c ON m.CategoryID = c.Id
JOIN 
    Artists a ON m.ArtistID = a.Id



SELECT pm.Id, p.Name AS PlaylistName, m.Name AS MusicName
FROM PlaylistMusics pm
JOIN Playlists p ON pm.PlaylistID = p.Id
JOIN Musics m ON pm.MusicID = m.Id
WHERE p.UserID = 1


SELECT * FROM Musics 
ORDER BY Duration


SELECT a.Name AS ArtistName, COUNT(*) AS SongCount
FROM Musics m
JOIN Artists a ON m.ArtistID = a.Id
GROUP BY a.Name
ORDER BY SongCount 