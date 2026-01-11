# Banking Analytics Business Intelligence Project

## Overview
This project delivers a full end-to-end Business Intelligence (BI) solution designed to analyze banking transaction data, user behavior, card usage, targeting outcomes, fraud indicators, and demographic characteristics. The solution follows enterprise BI best practices and provides a scalable, high-performance analytical platform for business decision-making.

---

## Data Sources
The dataset originates from multiple JSON-based source files containing transactional and reference data. Label and metadata tables were processed and consolidated using Python and MMC code prior to ingestion to ensure data consistency, normalization, and analytical readiness.

---

## ETL & Data Integration (SSIS)
The Extract, Transform, Load (ETL) process is implemented using SQL Server Integration Services (SSIS) and follows a layered architecture:

- Source data is exported as CSV files after preprocessing.
- SSIS packages are organized using **Sequence Containers** to enforce controlled, sequential execution.
- Data is initially loaded into an **Operational Data Store (ODS)**.
- A **Staging (STG)** layer is used to standardize data types, apply cleansing rules, and handle transformations.
- Transformed data is then split and loaded into the **Data Warehouse (DWH)**.

This approach ensures data quality, traceability, and maintainability.

---

## Data Warehouse Design
The Data Warehouse is modeled using a **star schema** optimized for analytical workloads:

- **FactTransactions** stores transaction-level data, including transaction amount, error status, targeting flag, and foreign keys.
- Dimension tables include **DimUsers, DimCards, DimDate, DimCity, DimState, DimMCC**, and supporting lookup dimensions.

This design enables accurate aggregations, efficient joins, and consistent analytical behavior across reporting tools.

---

## SSAS Tabular Semantic Model
The Data Warehouse is exposed through a **SQL Server Analysis Services (SSAS) Tabular Model**, which serves as the semantic layer:

- Relationships are defined between fact and dimension tables.
- The **xVelocity in-memory engine** is leveraged for fast query performance.
- DAX measures are implemented to support KPIs, ratios, and behavioral analytics.
- The model supports **Live Connections** from Power BI and Excel.

---

## Measures & KPIs
The semantic model includes a comprehensive set of DAX measures covering:

- **Financial Metrics**: Total Amount, Average Transaction Amount
- **Transaction Quality**: Successful and Failed Transactions
- **User & Card Activity**: Active Users, Active Cards, Transactions per User, Spend per User
- **Targeting & Fraud Analysis**
- **Card Brand and Demographic Insights**

All measures are fully filter-aware and dynamically respond to slicers and visual context.

---

## Power BI Reporting
The solution includes interactive Power BI dashboards that provide insights into:

- Demographic and income distributions
- User activity and geographic coverage
- Transaction performance and card usage
- Risk segmentation and targeting effectiveness

Dashboards are designed to support exploratory analysis and executive-level reporting.

---

## Technologies Used
- SQL Server Integration Services (SSIS)
- SQL Server Data Warehouse
- SQL Server Analysis Services (SSAS) Tabular
- Power BI
- Python (Data preprocessing and enrichment)
- DAX (Data Analysis Expressions)

---

## Outcome
This project delivers a robust, enterprise-grade BI solution that enables stakeholders to analyze transactional, demographic, and behavioral data with high accuracy, strong performance, and full analytical flexibility.
