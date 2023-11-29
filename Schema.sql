create table Players
(
    Id        int identity
        constraint PK_Players
            primary key,
    FirstName nvarchar(60) not null,
    Alias     varchar(30)  not null,
    LastName  nvarchar(60) not null
)
go

create table Roles
(
    Id   int identity
        constraint PK_Roles
            primary key,
    Role varchar(30) not null
)
go

create table Teams
(
    Id           int identity
        primary key,
    Name         varchar(30) not null,
    WorldRanking int         not null
)
go

create table PlayerContracts
(
    Id       int identity,
    PlayerId int
        constraint PlayerContracts_Players_Id_fk
            references Players,
    RoleId   int
        constraint PlayerContracts_Roles_Id_fk
            references Roles,
    TeamId   int
        constraint PlayerContracts_Teams_Id_fk
            references Teams
)
go

CREATE VIEW PlayerInfo AS

SELECT Players.Alias, Roles.Role, Teams.Name AS 'Team Name'
FROM Players
INNER JOIN PlayerContracts ON PlayerContracts.PlayerId = Players.Id
INNER JOIN Roles ON PlayerContracts.RoleId = Roles.Id
INNER JOIN Teams ON PlayerContracts.TeamId = Teams.Id;
go


