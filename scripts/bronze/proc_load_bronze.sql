-- =============================================================================
-- Stored Procedure: bronze.load_bronze
-- Database:         DataWarehouse
-- Schema:           bronze
-- =============================================================================
-- Description:
--   Loads raw data into the Bronze layer from CSV source files.
--   Each table is truncated before loading to ensure a full reload.
--   No transformations are applied — data is preserved as-is.
--
-- Sources:
--   CRM: cust_info.csv, prd_info.csv, sales_details.csv
--   ERP: CUST_AZ12.csv, LOC_A101.csv, PX_CAT_G1V2.csv
--
-- Usage:
--   EXEC bronze.load_bronze;
--
-- Author:  rd6hckr
-- Created: 2025
-- =============================================================================

CREATE OR ALTER PROCEDURE [bronze].[load_bronze] AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME;

    BEGIN TRY
        PRINT '===============================';
        PRINT 'Loading data into bronze layer...';
        PRINT '===============================';

        PRINT '===============================';
        PRINT 'Loading CRM Tables...';
        PRINT '===============================';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_cust_info;
        BULK INSERT bronze.crm_cust_info
        FROM '/var/opt/mssql/datasets/cust_info.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT 'crm_cust_info loaded in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 's';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_prd_info;
        BULK INSERT bronze.crm_prd_info
        FROM '/var/opt/mssql/datasets/prd_info.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT 'crm_prd_info loaded in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 's';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_sales_details;
        BULK INSERT bronze.crm_sales_details
        FROM '/var/opt/mssql/datasets/sales_details.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT 'crm_sales_details loaded in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 's';

        PRINT '===============================';
        PRINT 'Loading ERP Tables...';
        PRINT '===============================';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_cu_az12;
        BULK INSERT bronze.erp_cu_az12
        FROM '/var/opt/mssql/datasets/CUST_AZ12.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT 'erp_cu_az12 loaded in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 's';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_loc_a101;
        BULK INSERT bronze.erp_loc_a101
        FROM '/var/opt/mssql/datasets/LOC_A101.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT 'erp_loc_a101 loaded in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 's';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM '/var/opt/mssql/datasets/PX_CAT_G1V2.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT 'erp_px_cat_g1v2 loaded in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 's';

        PRINT '===============================';
        PRINT 'Bronze layer loaded successfully';
        PRINT '===============================';

    END TRY
    BEGIN CATCH
        PRINT '===============================';
        PRINT 'ERROR loading bronze layer';
        PRINT 'Message: ' + ERROR_MESSAGE();
        PRINT 'Line:    ' + CAST(ERROR_LINE() AS NVARCHAR);
        PRINT '===============================';
    END CATCH
END
GO