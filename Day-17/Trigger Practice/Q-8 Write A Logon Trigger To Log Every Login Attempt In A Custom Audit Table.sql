
Use Ansari_Bhai_With_SQL
--Q-8 LOGON Trigger Write a logon trigger to log every login attempt in a custom audit table

  CREATE TABLE Login_Audit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    LoginName NVARCHAR(100),
    LoginTime DATETIME DEFAULT GETDATE(),
    HostName NVARCHAR(100)
);

Create Trigger Trg_LogonAudit
on all server
for logon
as
begin
insert into master.dbo.Login_Audit(LoginName,HostName) Values(ORIGINAL_LOGIN(),HOST_NAME());
end

Select * from Login_Audit

----------------------Execute--------------
USE master;
GO
IF OBJECT_ID('dbo.Login_Audit', 'U') IS NULL
BEGIN
   CREATE TABLE dbo.Login_Audit
   (
      AuditID INT IDENTITY(1,1) PRIMARY KEY,
      LoginName NVARCHAR(100),
      HostName NVARCHAR(100),
      LoginTime DATETIME DEFAULT GETDATE()
   );
END


SELECT name, parent_class_desc, type_desc, is_disabled
FROM sys.server_triggers
WHERE name = 'Trg_LogonAudit';

SELECT * FROM master.dbo.Login_Audit ORDER BY AuditID DESC;