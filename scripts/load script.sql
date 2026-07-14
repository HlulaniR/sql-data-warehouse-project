CREATE OR ALTER PROCEDURE bronze.load_scripts AS
BEGIN
/*=====================================================
EXEC bronze.load_scripts
=======================================================
Script Purpose:
	Loads data into tables fro csv files
	Truncates and loads data eavh time you run this 
=====================================================*/
	DECLARE @start_time DATETIME, @end_time DATETIME
	BEGIN TRY

		TRUNCATE TABLE [bronze].[crm.cust_info]
		BULK INSERT [bronze].[crm.cust_info]
		FROM 'C:\Users\Nhlul\Downloads\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		--SELECT count(*) FROM  [bronze].[crm_cust_info]
		----------------------------------------------------
		TRUNCATE TABLE [bronze].[crm_prd_info]
		BULK INSERT [bronze].[crm_prd_info]
		FROM 'C:\Users\Nhlul\Downloads\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)

		--SELECT count(*) FROM  [bronze].[crm_prd_info]
		----------------------------------------------------

		TRUNCATE TABLE [bronze].[crm_sales_details]
		BULK INSERT [bronze].[crm_sales_details]
		FROM 'C:\Users\Nhlul\Downloads\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)

		--SELECT count(*) FROM  [bronze].[crm_sales_details]

		-----------------------------------------------------
		TRUNCATE TABLE [bronze].[erp_cust_az12]
		BULK INSERT [bronze].[erp_cust_az12]
		FROM 'C:\Users\Nhlul\Downloads\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)

		--SELECT count(*) FROM  [bronze].[erp_cust_az12]
		---------------------------------------------------------
		TRUNCATE TABLE [bronze].[erp_loc_a101]
		BULK INSERT [bronze].[erp_loc_a101]
		FROM 'C:\Users\Nhlul\Downloads\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)

		--SELECT count(*) FROM  [bronze].[erp_loc_a101]
		---------------------------------------------------------
		TRUNCATE TABLE [bronze].[erp_px_cat_g1v2]
		BULK INSERT [bronze].[erp_px_cat_g1v2]
		FROM 'C:\Users\Nhlul\Downloads\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)

		--SELECT count(*) FROM  [bronze].[erp_px_cat_g1v2]
		END TRY
		
		BEGIN CATCH
			select ERROR_NUMBER() Error, ERROR_MESSAGE() 
		END CATCH


END 
