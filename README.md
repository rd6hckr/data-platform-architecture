# Data Platform Architecture

> End-to-end data pipeline implementing **Medallion Architecture** (Bronze → Silver → Gold) with data modelling, transformation, and analytics-ready layers.

---

## Architecture Overview

```
Raw Sources
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
```

---

## Repository Structure

```
data-platform-architecture/
│
├── datasets/          # Source and reference datasets (CSV, JSON, etc.)
├── docs/              # Architecture diagrams and technical documentation
├── scripts/           # Ingestion, transformation and load scripts
├── tests/             # Unit and integration tests
└── LICENSE            # MIT License
```

---

## Getting Started

### Prerequisites

- Python 3.9+
- SQL Server / PostgreSQL (or compatible RDBMS)
- Git

### Installation

```bash
git clone https://github.com/rd6hckr/data-platform-architecture.git
cd data-platform-architecture
pip install -r requirements.txt
```

### Running the Pipeline

```bash
# 1. Ingest raw data into Bronze layer
python scripts/ingest_bronze.py

# 2. Transform and load into Silver layer
python scripts/transform_silver.py

# 3. Build Gold aggregations
python scripts/build_gold.py
```

---

## Pipeline Stages

### Bronze — Raw Ingestion
- Lands source data with minimal processing
- Preserves original schema and values
- Timestamped for auditability

### Silver — Cleansed & Conformed
- Removes duplicates and nulls
- Standardizes data types and formats
- Applies business rules and lookups

### Gold — Analytics-Ready
- Aggregated fact and dimension tables
- Optimized for BI tools and reporting
- Business KPIs and metrics layer

---

## Testing

```bash
pytest tests/
```

Tests cover schema validation, row count expectations, and transformation logic at each layer.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Author

**rd6hckr** — [GitHub](https://github.com/rd6hckr)
