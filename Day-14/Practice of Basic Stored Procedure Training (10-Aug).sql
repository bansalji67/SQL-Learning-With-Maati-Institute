
use SQL_Practice

Select * into SQL_Practice.dbo.Agent 
from [Ansari_Bhai_ With_SQL].dbo.Agent_Data

Select * from AgentDT
------------------Normal Store Procedure---------------
Create Procedure NormalSP
AS
BEGIN
Select Agent,AcctType,Amount from AgentDT
END

------------Execute
Execute NormalSP
Exec NormalSP
NormalSP

-------------Stored procedure with Where Condition
Create Procedure ConditionalSP
AS 
BEGIN
Select Agent,AcctType,Amount from AgentDT 
WHERE Amount>(Select Avg(Amount) from AgentDT)
END

Exec ConditionalSP

----------------Stored Procedure with Single parameter---------
Create Procedure SP_Parameter @acctType as varchar(max)
as
begin
Select Agent,AcctType,Branch,Amount from AgentDT
WHERE AcctType=@acctType
Select @@ROWCOUNT as TotalOutput
end

Exec SP_Parameter @acctType='Savings'

------------Stored Procedure with Multiple parameter

Create Procedure SP_MultiParameter @agent as varchar(max),@acctType as varchar(max)
as
begin
Select Agent,AcctType,Branch,Amount from AgentDT
WHERE Agent=@agent and AcctType=@acctType 
Select @@ROWCOUNT as TotalOutput
end
Exec SP_MultiParameter @agent='Ashok Kumar',@acctType='CD'

SP_MultiParameter 'Abhishek Kumar','Savings'