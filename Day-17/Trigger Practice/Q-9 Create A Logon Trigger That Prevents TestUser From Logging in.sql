
--Q-9 LOGON Trigger --Create a logon trigger that prevents TestUser from logging in.

Create Trigger TrgTestLogon
on all server
for logon
as
begin
if ORIGINAL_LOGIN()='TestUser'
begin
Rollback
end
end

SELECT name, parent_class_desc, type_desc, is_disabled
FROM sys.server_triggers
WHERE name = 'trg_BlockTestUser';

CREATE LOGIN TestUser WITH PASSWORD = 'Strongest@1235';


SELECT name FROM sys.server_principals WHERE name = 'TestUser';