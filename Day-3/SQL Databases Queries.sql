
Use [Pizza Sales Data]

--------------Total Name of Database--------------
Select Name from sys.databases

--------------Total Number of Database--------------
Select Count(Name) as TotalCount from sys.databases

--------------Name of System Define Database

Select * from sys.databases

Select name from sys.databases where owner_sid=0x01

--------------Name of User Define Databases

Select name from sys.databases where owner_sid<>0x01