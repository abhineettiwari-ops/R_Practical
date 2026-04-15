#3) Convert each data item into its equivalent representation in R programming format.
# Numeric
# Creating variables

# Numeric
age <- 25
salary <- 50000
temperature <- 30.5

# Categorical (Factors)
gender <- factor("Male")
pass_fail <- factor("Pass")
product_category <- factor("Electronics")

# Logical
active_status <- TRUE


# Printing values
age
salary
temperature
gender
pass_fail
product_category
active_status


# Checking data types
class(age)
class(salary)
class(temperature)

class(gender)
class(pass_fail)
class(product_category)

class(active_status)

--------------------------------------------------------------------------------
#Assignment:- 3
--------------------------------------------------------------------------------
  # Printing text
  print("Hello, R Programming")

# Arithmetic operations
5 + 3
10 - 4
6 * 2
8 / 2

--------------------------------------------------------------------------------
#Assignment:- 4
--------------------------------------------------------------------------------

tudents_df)# -------------------------------
# 1) Vector of Student Marks
# -------------------------------

marks <- c(70, 80, 90, 85, 75)

print("Student Marks:")
print(marks)

total_marks <- sum(marks)
print("Total Marks:")
print(total_marks)

average_marks <- mean(marks)
print("Average Marks:")
print(average_marks)


# -------------------------------
# 2) 3x3 Matrix Operations
# -------------------------------

matrix_data <- matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol = 3)

print("Matrix:")
print(matrix_data)

total_matrix <- sum(matrix_data)
print("Total Sum of Matrix:")
print(total_matrix)


# -------------------------------
# 3) List of Student Details
# -------------------------------

student <- list(
  name = "Riya",
  age = 20,
  marks = c(85, 90, 88)
)

print("Student Name:")
print(student$name)

print("Student Age:")
print(student$age)

print("Student Marks:")
print(student$marks)


# -------------------------------
# 4) Data Frame Operations
# -------------------------------

students_df <- data.frame(
  name = c("Riya", "Amit", "Neha"),
  marks = c(85, 78, 92)
)

print("Data Frame:")
print(students_df)

print("Structure of Data Frame:")
print(str(students_df))

students_df$grade <- c("A", "B", "A")

print("Updated Data Frame with Grade:")
print(s)
