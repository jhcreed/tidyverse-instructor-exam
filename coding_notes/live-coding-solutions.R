library(tidyverse)
library(readxl)

load("data/example_lab.RData")

# glimpse() is an extended version of str()
glimpse(example_lab)

# Step one: "tidy" existing data 
#   - convert test names from long to wide 
#   - separate blood into systolic and diastolic 
#   - convert character data to numeric 

tidy_data <- example_lab %>% 
  pivot_wider(names_from = test, values_from = values) %>% 
  separate(blood, into = c("systolic", "diastolic"), sep = "/") %>% 
  mutate_at(c("height", "weight", "systolic", "diastolic"), as.numeric) 

# Step two: use "tidy" data to do something 

# arrange - sort data based on height from low to high 
#   - then high to low 
arrange(tidy_data, height)
arrange(tidy_data, desc(height))
arrange(tidy_data, height, desc(weight))

# select - patient ids and blood pressure related measures
#   - or remove gender height ad weight
select(tidy_data, patient_id, systolic, diastolic)
select(tidy_data, c(1, 4:5))
select(tidy_data, c(1, contains("olic")))
select(tidy_data, -c(gender, height, weight))

# filter - taller than 65 inches and weight above 150 pounds
filter(tidy_data, height > 65, weight > 150)
filter(tidy_data, height > 65 & weight > 150)

# summarise data average height and weight
#   - then by gender 
summarise(tidy_data, 
          avg_systolic = mean(systolic, na.rm = TRUE),
          min_height = min(height, na.rm = TRUE))

summarise(tidy_data %>% group_by(gender), 
          avg_systolic = mean(systolic, na.rm = TRUE),
          min_height = min(height, na.rm = TRUE))

# mutate 
#   - create a new variable for BMI (weight/height^2)*703
#   - create a new variable for elevated blood pressure (systolic 120-130 or diastolic < 80)
#     or hypertension (systolic > 130 or diastolic > 80)

mutate(tidy_data, BMI = (weight/(height^2))*703)
mutate(tidy_data, blood_pressure = case_when(
  between(systolic, 120, 130) | diastolic < 80 ~ "elevated",
  systolic > 130 | diastolic > 80 ~ "hypertension",
  TRUE ~ "normal"
))



