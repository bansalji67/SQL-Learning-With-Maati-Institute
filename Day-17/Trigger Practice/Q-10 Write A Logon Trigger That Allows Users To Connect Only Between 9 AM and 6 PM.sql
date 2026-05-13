
--Q-10 Write a logon trigger that allows users to connect only between 9 AM and 6 PM.

Create Trigger Trg_LimitedHoursLogin
on all server
for logon
as
begin
if DATEPART(HOUR,GETDATE()) not between 9 and 18
begin
Rollback
end
end
-------------------Execute-----------

SELECT name, parent_class_desc, type_desc, is_disabled
FROM sys.server_triggers
WHERE name = 'Trg_LimitedHoursLogin';

