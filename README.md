# Data Platform Architecture

End-to-end data pipeline implementing Medallion Architecture (Bronze → Silver → Gold) with data modelling, transformation, and analytics-ready layers using SQL Server and T-SQL.

## Architecture Overview

\```
Raw Sources (CSV)
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│  BRONZE LAYER  │  Raw ingestion — no transformations    │
│                │  Preserves source data as-is           │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│  SILVER LAYER  │  Cleansed & standardized data          │
│                │  Deduplication, type casting, joins     │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│  GOLD LAYER    │  Business-ready, aggregated models     │
│                │  Analytics, reporting & BI consumption  │
└─────────────────────────────────────────────────────────┘
\```

## Repository Structure

\```
data-platform-architecture/
│
├── datasets/          # Source CSV files (not tracked in git)
├── docs/              # Architecture diagrams and technical documentation
├── scripts/           # DDL and stored procedures per layer
│   ├── init_database.sql   # Database and schema creation
│   ├── bronze_ddl.sql      # Bronze layer table definitions
│   └── bronze_load.sql     # Bronze layer load procedure
├── tests/             # Validation queries
└── LICENSE            # MIT License
\```

## Prerequisites

- SQL Server 2022 (via Docker)
- VS Code + SQL Server extension

## Getting Started

\```bash
git clone https://github.com/rd6hckr/data-platform-architecture.git
cd data-platform-architecture
\```

1. Run `scripts/init_database.sql` — creates the `DataWarehouse` database and schemas
2. Run `scripts/bronze_ddl.sql` — creates bronze layer tables
3. Place source CSV files in the `datasets/` folder
4. Run `scripts/bronze_load.sql` — creates the load stored procedure

## Running the Pipeline

\```sql
-- Load Bronze layer
EXEC bronze.load_bronze;
\```

## Pipeline Stages

### Bronze — Raw Ingestion
- Bulk loads CSV files directly into staging tables
- Preserves original schema and values
- Full reload on each execution (TRUNCATE + INSERT)

### Silver — Cleansed & Conformed
- Removes duplicates and nulls
- Standardizes data types and formats
- Applies business rules and lookups

### Gold — Analytics-Ready
- Aggregated fact and dimension tables
- Optimized for BI tools and reporting
- Business KPIs and metrics layer

## License

This project is licensed under the MIT License.

## Author

rd6hckr — [GitHub](https://github.com/rd6hckr)