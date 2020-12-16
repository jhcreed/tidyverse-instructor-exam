library(tidyverse)
library(readxl)

load("data/example_lab.RData")

# glimpse() is an extended version of str()
glimpse(example_lab)

# Step one: "tidy" existing data 
#   - convert test names from long to wide 
#   - separate blood into systolic and diastolic 
#   - convert character data to numeric 


# Step two: use "tidy" data to do something 

# arrange - sort data based on height from low to high 
#   - then high to low 


# select - patient ids and blood pressure related measures
#   - or remove gender height ad weight


# filter - taller than 65 inches and weight above 150 pounds


# summarise data average height and weight
#   - then by gender 

# mutate 
#   - create a new variable for BMI (weight/height^2)*703
#   - create a new variable for elevated blood pressure (systolic 120-130 or diastolic < 80)
#     or hypertension (systolic > 130 or diastolic > 80)




