library(foreign)
library(tidyverse)

trip_2017<- read.csv("data/2017/trip_2017.csv")


trip_14 <- trip_2017 %>%
  select(starts_with("P5_14"))

trip_14[trip_14 == 2] <- NA

one_mode <- trip_14 %>%
  filter(rowSums(!is.na(across(everything()))) == 1)

n_total <- nrow(one_mode)

summary_tbl <- one_mode %>%
  summarise(across(starts_with("P5_14_"), ~ sum(!is.na(.)))) %>%
  pivot_longer(everything(), names_to = "column", values_to = "n_valid") %>%
  arrange(desc(n_valid)) %>%
  mutate(pct_valid = n_valid / n_total)


two_mode<- trip_14 %>%
  filter(rowSums(!is.na(across(everything()))) == 2)


three_mode <- trip_14 %>%
  filter(rowSums(!is.na(across(everything()))) == 3)

four_mode <- trip_14 %>%
  filter(rowSums(!is.na(across(everything()))) == 4)

five_mode <- trip_14 %>%
  filter(rowSums(!is.na(across(everything()))) == 5)

six_mode <- trip_14 %>%
  filter(rowSums(!is.na(across(everything()))) == 6)

#write.csv(two_mode, "data/2017/two_mode_2017.csv", row.names = FALSE)
