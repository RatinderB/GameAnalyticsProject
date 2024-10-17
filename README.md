# Game Analytics Project

## Overview

This project demonstrates a real-time data analytics pipeline for game score data using Azure services. The goal was to ingest, process, store, and visualize gameplay data efficiently.

## Architecture

The pipeline consists of:

- **Data Generation Script:** Simulates gameplay data and sends it to Azure Event Hubs.
- **Azure Event Hubs:** Ingests streaming data from the data generation script.
- **Azure Stream Analytics:** Processes and routes data to Azure Cosmos DB and Azure Synapse Analytics.
- **Azure Cosmos DB:** Stores operational data.
- **Azure Synapse Analytics:** Stores analytical data in a structured format.
- **Azure Synapse Pipelines:** Automates data transformation and loading into staging, dimension, and fact tables.
- **Power BI:** Visualizes data to provide actionable insights.


## Components

### Data Generation

- **Script:** `data-generation/score-generator.ps1`
- **Description:** Generates simulated gameplay data.

### Azure Stream Analytics

- **Query:** `stream-analytics/stream-analytics-query.sql`
- **Description:** Processes incoming data from Event Hubs.

### Azure Synapse Analytics

- **Pipelines:** Located in `synapse/pipelines/`
- **SQL Scripts:** Located in `synapse/scripts/`
- **Tables and Views:** Scripts to create tables and views.

### Power BI Report

- **Report File:** `powerbi/GameAnalyticsReport.pbix`
- **Description:** Interactive dashboards and reports visualizing the data.

## Getting Started

To explore this project:

1. **Review the Data Generation Script:**
   - Check out `score-generator.ps1` to see how data is simulated.

2. **Examine the Stream Analytics Query:**
   - Look at `stream-analytics-query.sql` for data processing logic.

3. **Understand the Data Models:**
   - Review the SQL scripts in `synapse/scripts/` to see how tables and views are structured.

4. **View the Power BI Report:**
   - Open `GameAnalyticsReport.pbix` in Power BI Desktop to explore the visualizations.

## Project Highlights

- **Scalable Data Ingestion:** Leveraged Azure Event Hubs and Stream Analytics for real-time data processing.
- **Automated Data Transformation:** Used Azure Synapse Pipelines for efficient data movement.
- **Actionable Insights:** Created interactive Power BI reports for data visualization.

## Lessons Learned

- Azure services provide powerful tools for building scalable and efficient data pipelines.
- Automation is key to handling real-time data effectively.
- Data visualization transforms raw data into meaningful insights.

