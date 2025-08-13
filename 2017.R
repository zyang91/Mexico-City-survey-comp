library(foreign)
library(tidyverse)

trip <- read.dbf("TVIAJE.DBF", as.is = TRUE)
