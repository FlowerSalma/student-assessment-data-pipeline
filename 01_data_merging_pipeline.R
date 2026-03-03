# ---- Setup ----
library(dplyr)
library(readr)

# (Optional but helpful) check where R is looking for files
cat("Working directory:", getwd(), "\n")
cat("Files here:", paste(list.files(), collapse = ", "), "\n\n")

# ---- Read data ----
students <- read_csv("students.csv", show_col_types = FALSE)
grades   <- read_csv("grades.csv",   show_col_types = FALSE)
gpa      <- read_csv("gpa.csv",      show_col_types = FALSE)

# ---- Quick validation (helps catch typos) ----
stopifnot(all(c("student_id") %in% names(students)))
stopifnot(all(c("student_id", "grade") %in% names(grades)))
stopifnot(all(c("student_id", "GPA") %in% names(gpa)))

# ---- Aggregate grades per student ----
grade_summary <- grades %>%
  group_by(student_id) %>%
  summarise(
    avg_grade     = mean(grade, na.rm = TRUE),
    courses_taken = n(),
    .groups       = "drop"
  )

# ---- Merge tables ----
merged_data <- students %>%
  left_join(grade_summary, by = "student_id") %>%
  left_join(gpa, by = "student_id") %>%
  mutate(
    at_risk = ifelse(is.na(GPA), NA, ifelse(GPA < 3.0, 1, 0))
  )

# ---- Output ----
print(merged_data)

write_csv(merged_data, "merged_students_data.csv")
cat("\nSaved: merged_students_data.csv\n")
