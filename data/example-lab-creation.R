library(tidyverse)
set,seed(8675309)

patient_id <- sample(10000:99999, size = 100)
height <- sample(c(60:84, NA), size = 100, replace = TRUE)
weight <- sample(c(NA, 110:270), size = 100, replace = TRUE)
systolic <- sample(100:180, size = 100, replace = TRUE)
diastolic <- sample(60:130, size = 100, replace = TRUE)
gender <- sample(c("Male", "Female"), size = 100, replace = TRUE)

example_data <- data.frame(patient_id,
                           gender,
                           height,
                           weight,
                           blood = paste0(systolic, "/", diastolic)
                           )

messy_data <- example_data %>% 
  mutate_at(c("height", "weight"), as.character) %>% 
  pivot_longer(!c(patient_id, gender), names_to = "test", values_to = "values")

example_lab <- messy_data

save(example_lab, file = "data/example_lab.RData")
