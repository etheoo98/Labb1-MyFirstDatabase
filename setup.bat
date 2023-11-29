@echo off

set SQLCMD="C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\sqlcmd.exe"
set SERVER=(localdb)\MSSQLLocalDB
set DATABASE=MyFirstDatabase

%SQLCMD% -S %SERVER% -E -Q "IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = '%DATABASE%') CREATE DATABASE %DATABASE%"
%SQLCMD% -S %SERVER% -d %DATABASE% -E -i ".\schema.sql"
%SQLCMD% -S %SERVER% -d %DATABASE% -E -i ".\data.sql"

echo If no error was encountered, you're good to go! Otherwise read the documentation for troubleshooting.

pause