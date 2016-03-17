
#### name:main ####

# NSW air quality data (received from EPA) -----
library (dplyr)
library(openair)
library(reshape2)
library(stringr)
library(tidyr)
library(readr)
library(lubridate)

projdir <- "~/projects_environment_general_local/Air_Pollution_Monitoring_Stations_NSW/AP_monitor_NSW_1994_2013_hrly/"
setwd(projdir)
dir()
indir  <- "data_provided"
dir(indir)

#importing the data (using the openair import function in combination with tb_df)
nsw9498 <-  tbl_df (import (file.path("data_provided", "/OEH (1994-1998)_AllSites_1hrlyData.csv")))
nsw9903 <-  tbl_df (import (file.path("data_provided", "/OEH (1999-2003)__AllSites_1hrlyData.csv")))
nsw0408 <-  tbl_df (import (file.path("data_provided", "/OEH (2004-2008)__AllSites_1hrlyData.csv")))
nsw0913 <-  tbl_df (import (file.path("data_provided", "/OEH (2009-2013)__AllSites_1hrlyData.csv")))

# remove the units
names(nsw9498)[2:ncol(nsw9498)] <- word(colnames(nsw9498)[2:ncol(nsw9498)], start = 1, end = -2)
names(nsw9903)[2:ncol(nsw9903)] <- word(colnames(nsw9903)[2:ncol(nsw9903)], start = 1, end = -2)
names(nsw0408)[2:ncol(nsw0408)] <- word(colnames(nsw0408)[2:ncol(nsw0408)], start = 1, end = -2)
names(nsw0913)[2:ncol(nsw0913)] <- word(colnames(nsw0913)[2:ncol(nsw0913)], start = 1, end = -2)


names(nsw0913)[1:10]
nsw0913$date[(nrow(nsw0913)-10):nrow(nsw0913)]
