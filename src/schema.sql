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