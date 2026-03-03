# Student Assessment Data Pipeline (R)

## Overview
This project demonstrates how to merge multiple student datasets 
(demographics, grades, GPA) into a clean analytic dataset for 
assessment and reporting purposes.

## Objectives
- Prepare and validate multiple datasets
- Perform relational joins using `student_id`
- Aggregate course grades per student
- Engineer an academic risk indicator (GPA < 3.0)
- Export a structured dataset ready for analysis or reporting

## Workflow
1. Load required libraries (`dplyr`, `readr`)
2. Validate required columns
3. Aggregate grades per student
4. Merge datasets using left joins
5. Create derived variables
6. Export cleaned dataset

## Tools Used
- R
- dplyr
- readr

## Output
The script generates:
`merged_students_data.csv`

## Relevance
This project demonstrates data preparation, feature engineering, 
and multi-table merging skills aligned with institutional assessment 
and analytics workflows.
