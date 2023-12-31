USE [master]
GO

CREATE DATABASE [MyFirstDatabase]
GO
       
USE [MyFirstDatabase]
GO

CREATE TABLE Players
(
    Id        int identity
        constraint Players_pk
        primary key,
    Alias     varchar(60)  not null
        constraint Players_pk2
            unique,
    FirstName nvarchar(60) not null,
    LastName  nvarchar(60) not null
)
    GO

CREATE TABLE Roles
(
    Id   int identity
        constraint Roles_pk
        primary key,
    Name varchar(20) not null
        constraint Roles_pk2
            unique
)
    GO

CREATE TABLE Teams
(
    Id           int identity
        constraint Teams_pk
        primary key,
    Name         varchar(60),
    WorldRanking int not null
        constraint Teams_pk2
            unique
)
    GO

CREATE TABLE PlayerContracts
(
    Id       int identity
        constraint PlayerContracts_pk
        primary key,
    PlayerId int not null
        constraint PlayerContracts_pk2
            unique
        constraint PlayerContracts_Players_Id_fk
            references Players,
    RoleId   int not null
        constraint PlayerContracts_Roles_Id_fk
            references Roles,
    TeamId   int not null
        constraint PlayerContracts_Teams_Id_fk
            references Teams
)
    GO

CREATE VIEW PlayerInfo AS
SELECT Players.Alias AS 'Alias', Roles.Name AS 'Role Name', Teams.Name AS 'Team Name'
FROM PlayerContracts
         JOIN Players ON PlayerContracts.PlayerId = Players.Id
         JOIN Roles ON PlayerContracts.RoleId = Roles.Id
         JOIN Teams ON PlayerContracts.TeamId = Teams.Id
    GO

-- Roles Data
INSERT INTO dbo.Roles (Name) VALUES (N'Rifler');
INSERT INTO dbo.Roles (Name) VALUES (N'AWPer');
INSERT INTO dbo.Roles (Name) VALUES (N'In-game Leader');

-- Teams Data
INSERT INTO dbo.Teams (Name, WorldRanking) VALUES (N'FaZe', 1);
INSERT INTO dbo.Teams (Name, WorldRanking) VALUES (N'Vitality', 2);
INSERT INTO dbo.Teams (Name, WorldRanking) VALUES (N'MOUZ', 3);
INSERT INTO dbo.Teams (Name, WorldRanking) VALUES (N'ENCE', 4);
INSERT INTO dbo.Teams (Name, WorldRanking) VALUES (N'Complexity', 5);
INSERT INTO dbo.Teams (Name, WorldRanking) VALUES (N'G2', 6);
INSERT INTO dbo.Teams (Name, WorldRanking) VALUES (N'Monte', 7);
INSERT INTO dbo.Teams (Name, WorldRanking) VALUES (N'Natus Vincere', 8);
INSERT INTO dbo.Teams (Name, WorldRanking) VALUES (N'Cloud9', 9);
INSERT INTO dbo.Teams (Name, WorldRanking) VALUES (N'Virtus.pro', 10);

-- Players Data
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'karrigan', N'Finn', N'Andersen');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'rain', N'Håvard', N'Nygaard');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'Twistzz', N'Russel', N'Van Dulken');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'ropz', N'Robin', N'Kool');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'broky', N'Helvijs', N'Saukants');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'apEX', N'Dan', N'Madesclaire');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'ZywOo', N'Mathieu', N'Herbaut');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'flameZ', N'Shahar', N'Shushan');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'Spinx', N'Lotan', N'Giladi');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'mezii', N'William', N'Merriman');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'frozen', N'David', N'Cernanský');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'siuhy', N'Kamil', N'Szkaradek');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'torzsi', N'Ádám', N'Torzsás');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'Jimpphat', N'Jimi', N'Salo');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'xertioN', N'Dorian', N'Berman');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'gla1ve', N'Lukas', N'Rossander');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'NertZ', N'Guy', N'Iluz');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'Maden', N'Pavle', N'Boškovic');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'dycha', N'Pawel', N'Dycha');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'SunPayus', N'Alvaro', N'Garcia');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'EliGE', N'Jonathan', N'Jablonowski');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'JT', N'Johnny', N'Theodosiou');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'floppy', N'Ricky', N'Kemery');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'hallzerk', N'Håkon', N'Fjærli');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'Grim', N'Michael', N'Wince');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'NiKo', N'Nikola', N'Kovac');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'huNter-', N'Nemanja', N'Kovac');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'nexa', N'Nemanja', N'Isakovic');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'HooXi', N'Rasmus', N'Nielsen');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'm0NESY', N'Ilya', N'Osipov');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'sdy', N'Viktor', N'Orudzhev');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'br0', N'Alexander', N'Bro');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'Woro2k', N'Volodymyr', N'Veletniuk');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'DemQQ', N'Sergiy', N'Demchenko');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'kRaSnaL', N'Szymon', N'Mrozek');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'Aleksib', N'Aleksi', N'Virolainen');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'iM', N'Mihai', N'Ivan');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'b1t', N'Valeriy', N'Vakhovskiy');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'jL', N'Justinas', N'Lekavicius');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'w0nderful', N'Ihor', N'Zhdanov');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'HObbit', N'Abay', N'Khassenov');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'electroNic', N'Denis', N'Sharipov');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'Boombl4', N'Kirill', N'Mikhailov');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'Ax1Le', N'Sergey', N'Rykhtorov');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'Perfecto', N'Ilya', N'Zalutskiy');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'mir', N'Nikolay', N'Bityukov');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'FL1T', N'Evgenii', N'Lebedev');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'Jame', N'Dzhami', N'Ali');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'n0rb3r7', N'David', N'Danielyan');
INSERT INTO dbo.Players (Alias, FirstName, LastName) VALUES (N'fame', N'Petr', N'Bolyshev');

-- PlayerContracts Data
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (2, 1, 1);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (5, 2, 1);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (3, 1, 1);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (1, 3, 1);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (4, 1, 1);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (6, 3, 2);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (7, 2, 2);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (9, 1, 2);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (8, 1, 2);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (10, 1, 2);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (11, 1, 3);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (13, 2, 3);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (15, 1, 3);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (12, 3, 3);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (14, 1, 3);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (19, 1, 4);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (18, 1, 4);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (20, 2, 4);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (17, 1, 4);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (16, 3, 4);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (22, 3, 5);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (23, 1, 5);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (25, 1, 5);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (24, 2, 5);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (21, 1, 5);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (27, 1, 6);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (26, 1, 6);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (30, 2, 6);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (29, 3, 6);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (28, 3, 6);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (33, 2, 7);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (34, 1, 7);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (35, 1, 7);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (31, 3, 7);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (32, 1, 7);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (38, 1, 8);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (36, 3, 8);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (39, 1, 8);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (37, 1, 8);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (40, 1, 8);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (44, 1, 9);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (41, 1, 9);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (42, 1, 9);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (45, 1, 9);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (43, 3, 9);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (48, 3, 10);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (47, 1, 10);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (50, 1, 10);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (49, 1, 10);
INSERT INTO dbo.PlayerContracts (PlayerId, RoleId, TeamId) VALUES (46, 1, 10);