library(foreign)
library(tidyverse)

#trip <- read.dbf("data/2007/tr_viajes.dbf", as.is = TRUE)

trip_2007<- read.csv("data/2007/trip_2007.csv")

library(tidyr)



trip_2007 <- trip_2007 %>%
  separate(SORDENTRAN, into = paste0("trip", 1:7), sep = 1:6) %>%
  mutate(across(starts_with("trip"), ~ na_if(., "0")))

single_mode<- trip_2007 %>%
  filter(is.na(trip2))

single_mode<-single_mode%>%
  group_by(trip1)%>%
  summarise(
    count = n()
  )


trip3_or_more<- trip_2007 %>%
  filter(!is.na(trip3) & is.na(trip4))

trip3_summarised<-trip3_or_more%>%
  group_by(trip1, trip2, trip3)%>%
  summarise(
    count = n()
  )%>%
  arrange(desc(count))

write.csv(trip3_summarised, "data/2007/trip3_summarised_2007.csv", row.names = FALSE)

#trip3_summarise<- read.csv("data/2007/trip3_summarised_2007.csv")

library(purrr)

dedup_key <- function(v) {
  paste(sort(unique(na.omit(v))), collapse = "_")  # unique & order-insensitive
}

combo <- trip3_summarise %>%
  rowwise() %>%
  mutate(key = dedup_key(c(trip1, trip2, trip3))) %>%
  ungroup() %>%
  group_by(key) %>%
  summarise(count = sum(count), .groups = "drop") %>%
  separate(key, into = c("trip1", "trip2", "trip3"), sep = "_", fill = "right")

#write.csv(combo, "data/2007/trip3_combo_2007.csv", row.names = FALSE)

trip4_or_more<- trip_2007 %>%
  filter(!is.na(trip4))

trip4_summarised<-trip4_or_more%>%
  group_by(trip1, trip2, trip3, trip4)%>%
  summarise(
    count = n()
  )%>%
  arrange(desc(count))
#write.csv(trip4_summarised, "data/2007/trip4_summarised_2007.csv", row.names = FALSE)

combo_4<- trip4_summarised %>%
  rowwise() %>%
  mutate(key = dedup_key(c(trip1, trip2, trip3, trip4))) %>%
  ungroup() %>%
  group_by(key) %>%
  summarise(count = sum(count), .groups = "drop") %>%
  separate(key, into = c("trip1", "trip2", "trip3", "trip4"), sep = "_", fill = "right")
#write.csv(combo_4, "data/2007/trip4_combo_2007.csv", row.names = FALSE)

trip5_or_more<- trip_2007 %>%
  filter(!is.na(trip5))
trip6_or_more<- trip_2007 %>%
  filter(!is.na(trip6))


