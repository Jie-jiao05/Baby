library(readr)
library(dplyr)
library(here)


fert <- read_csv(here("word_fert.csv"), skip = 3)

fert_clean <- fert %>%
  select(`Country Name`,  `2023`) %>%
  filter(!is.na(`2023`)) %>%                     # remove missing fertility values
  filter(!grepl("World|Income|Region", `Country Name`, ignore.case = TRUE))  # drop aggregates

fert_clean <- fert_clean %>%
  rename(
    Country = `Country Name`,
    FertilityRate_2023 = `2023`
  )

head(fert_clean)

write_csv(fert_clean, here("Cleaned_fert_2023.csv"))

# #######
fert_clean <- fert %>%
  select(`Country Name`, `1960`, `2023`) %>%
  filter(
    !is.na(`1960`),
    !is.na(`2023`)
  ) %>%
  filter(!grepl("World|Income|Region", `Country Name`, ignore.case = TRUE)) %>%
  rename(
    Country = `Country Name`,
    FertilityRate_1960 = `1960`,
    FertilityRate_2023 = `2023`
  )

# --- Step 3: Preview and save ---
head(fert_clean)

write_csv(fert_clean, here("Cleaned_fert_1960_2023.csv"))
