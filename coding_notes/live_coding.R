library(tidyverse)
library(readxl)

patient_vitals <- read_excel("data/patient-vitals.xlsx", sheet = "Sheet2")

# glimpse() is an extended version of str()
glimpse(patient_vitals)

# first create tidy data 
# convert to wide, seperate blood in systolic/diastolic and convert 
# character to numeric 

tidy_data <- patient_vitals %>% 
  pivot_wider(names_from = test, values_from = value) %>% 
  separate(blood, into = c("systolic", "diastolic"), sep = "/") %>% 
  mutate_if(is.character, as.numeric) 

# select - patient ids and blood pressure related measures
select(tidy_data, patient_id, systolic, diastolic)
select(tidy_data, c(1, 4:5))
select(tidy_data, c(1, contains("olic")))

# filter - taller than 65 inches and weight above 150 pounds
filter(tidy_data, height > 65, weight > 150)
filter(tidy_data, height > 65 & weight > 150)

# summarise
summarise(tidy_data, 
          avg_systolic = mean(systolic, na.rm = TRUE),
          min_height = min(height, na.rm = TRUE))

# mutate


