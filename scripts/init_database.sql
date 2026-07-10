/*
=============================================
CREATE database and schemas
=============================================
script purpose:
	This scricpt creates a new db after it checks if it exists 
	If DB exists, drop and recreate
	3 schemas are created: silver, bronze and gold 

Warning:
	running this script will drop the entire db if exists
	all data in the db will be permanently deleted

*/


USE master ;
GO

--drop and recreate database
IF EXISTS(SELECT 1 from sys.databases where name= 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse 
END;
GO

--create database here
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
