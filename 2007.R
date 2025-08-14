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
  filter(!is.na(trip3))
trip4_or_more<- trip_2007 %>%
  filter(!is.na(trip4))
trip5_or_more<- trip_2007 %>%
  filter(!is.na(trip5))
trip6_or_more<- trip_2007 %>%
  filter(!is.na(trip6))


