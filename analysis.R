# Load packages
library("dplyr")
library("ggmap")
library("ggplot2")
library("ggrepel")
library("tidyr")
library("leaflet")
library("lubridate")
library(plotly)
# Load data and do the data wrangling to group the time period I interested. 
df_raw <- read.csv("london_merged.csv", stringsAsFactors = FALSE) %>% 
  select(timestamp, cnt) %>% 
  filter(timestamp <= as.Date("2016-01-01 00:00:00")) 

df_bike <- df_raw %>%
  mutate(date_col = date(timestamp)) %>%
  group_by(date_col) %>%
  summarize(value = sum(cnt))

# graphing data stored
x <- df_bike$date_col
y <- df_bike$value

