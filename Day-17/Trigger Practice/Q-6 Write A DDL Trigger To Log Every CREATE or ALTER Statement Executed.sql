
--Q-6 DDL Trigger-- Write a DDL trigger to log every CREATE or ALTER statement executed.

Create TABLE DDL_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    EventType NVARCHAR(100),
    EventData XML,
    LogDate DATETIME DEFAULT GETDATE()
);

----------------Create Trigger---------

Create Trigger Trg_DDL_Log
on Database
for Create_Table,Alter_Table,Create_Procedure,Alter_Procedure
as
begin
  insert into DDL_Log (EventType,EventData)
  SELECT EVENTDATA() .value('(/EVENT_INSTANCE/EventType)[1]','NVARCHAR(100)'),
             EVENTDATA();
			 END

Create Table Checkin
(Empid Int,
 EmpName Varchar(max)
)

Drop Table Checkin
----------------Execute to Check Trigger

Select * from DDL_Log

	

