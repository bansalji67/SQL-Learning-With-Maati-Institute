
--Q-7 DDL Trigger Create a DDL trigger that blocks users from creating new databases.

Create Trigger TrgBlockUser_Database
on all server
for Create_Database
as
begin
raiserror('Creating New Database is not allowed',16,1)
rollback
end
--------------------Execute Trigger-------------

CREATE DATABASE TestDB_Trigger1;

Disable Trigger TrgBlockUser_Database on all server

SELECT name, parent_class_desc, type_desc
FROM sys.server_triggers
WHERE name = 'TrgBlockUser_Database';

SELECT name FROM sys.databases WHERE name = 'TestDB_Trigger';
