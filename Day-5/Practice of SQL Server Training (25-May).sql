Use [Ansari Bhai With SQL]

-----------Select Statement
Select * from Agent_Data

-------Specific Columns or Feilds
Select Agent,Branch,OpenedBy,Amount from Agent_Data

------Use of Where
Select Agent,Branch,AcctType,Amount from Agent_Data where Agent='Abhishek Kumar'

------------USE WITH AND
Select Agent,Branch,AcctType,Amount from Agent_Data where Agent='Abhishek Kumar' AND Amount>50000

------------USE WITH OR

Select Agent,Branch,AcctType,Amount from Agent_Data where Agent='Abhishek Kumar' OR Agent='Rahul Kumar'

----------------------Company Question (Sapient)---------------
---Conditions Performance score should be>4 
----------(Rank=1,Rank=2)
----Total year >4

Select * from DT1 WHERE Performance_Score>4 and (Rank=1 or Rank=2) and Total_Year>5

---------------IIF Single Condition Example

Select ID,Name,Shift,iif(Shift='General','G',IIF(Shift='Evening','E',IIF(Shift='Night','N','M'))) as ShiftName from Shift_Data



