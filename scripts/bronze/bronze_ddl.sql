-- =============================================================================
-- DDL Script: Bronze Layer Tables
-- Database:   DataWarehouse
-- Schema:     bronze
-- =============================================================================
-- Description:
--   Creates all raw ingestion tables for the Bronze layer.
--   These tables preserve source data as-is from CRM and ERP systems.
--   No transformations are applied at this stage.
--
-- Tables:
--   CRM: crm_cust_info, crm_prd_info, crm_sales_details
--   ERP: erp_loc_a101, erp_cu_az12, erp_px_cat_g1v2
--
-- Author:  rd6hckr
-- Created: 2025
-- =============================================================================

USE DataWarehouse;

CREATE TABLE bronze.crm_cust_info(
    cst_id INT,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_material_status NVARCHAR(50),
    cst_gndr NVARCHAR(50),
    cst_created_date DATE,
);

CREATE TABLE bronze.crm_prd_info(
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);

CREATE TABLE bronze.crm_sales_details(
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);

CREATE TABLE bronze.erp_loc_a101 (
    cid NVARCHAR(50),
    cntry NVARCHAR(50)
);

CREATE TABLE bronze.erp_cu_az12 (
    cid NVARCHAR(50),
    bdate DATE,
    gen NVARCHAR(50)
);

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id NVARCHAR(50),
    cat NVARCHAR(50),
    subcat NVARCHAR(50),
    maintenance NVARCHAR(50)
);

