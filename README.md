# Comparison of Energy Consumption when doing Video Conference

## Overview
This repository contains data and scripts for analyzing the energy consumption of open-source (FOSS) and commercial collaborative software applications during video conferences. The comparison includes popular tools like Zoom, Skype, Element, and Rocket.Chat.

## Measurement

### Data_Analysis
The `Data_Analysis` folder contains energy consumption readings of both open-source and commercial collaborative software applications. The recordings were taken while performing different tasks, and R scripts are provided for energy analysis.

#### Requirement
- R 4.3.2
- RStudio 2023.12.0 Build 369

#### Running the Analysis
To run the latest version of the energy analysis, follow these steps:
1. Clone this repository to your local machine:
   ```bash
   https://github.com/GreenDeltaVU/VideoConferenceEnergyConsumptionComparison/tree/main/Data_Analysis
   
2. Run the "energy_analysis_latest.R" files into your current working directory.
load the required libraries
run the energy_analysis_latest.R
"cons_statistic.xlsx", plot graphs, and basic comparison graph will automatically generated

4. "cons_statistic.xlsx" will automatically generated when "energy_analysis_latest.R" is run.
Once cons_statistic.xlsx is generated, run the "GroupBarGraphOfAverage.Rmd" to generate the bar graph.
