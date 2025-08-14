library(foreign)
library(tidyverse)

trip_2017<- read.csv("data/2017/trip_2017.csv")

P5_15_02<-trip_2017%>%
  group_by(P5_15_02)%>%
  summarise(
    count = n()
  )
  