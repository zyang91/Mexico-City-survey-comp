library(foreign)
library(tidyverse)

trip <- read.dbf("data/2007/tr_viajes.dbf", as.is = TRUE)

trip_2007summary<-trip%>%
  group_by(SORDENTRAN)%>%
  summarise(
    count = n()
  )%>%
  mutate(
    percent = count / sum(count) * 100
  )

write.csv(trip, "data/2007/trip_2007.csv", row.names = FALSE)
