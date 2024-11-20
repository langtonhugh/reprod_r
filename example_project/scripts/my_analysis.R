# Load packages.
library(readr)
library(dplyr)
library(ggplot2)
library(sf)
library(tidyr)

# Set working directory.
setwd("C:/Users/P090168/OneDrive - Amsterdam UMC/Documenten/ldcc2/presentations/reprod_r/example_project/data")

# Load data.
diamonds_df <- read_csv("diamonds_data.csv")

# Take a look.
glimpse(diamonds_df)

# Set seed for the sample.
set.seed(1612)

# Do some handling.
diamonds_sample_df <- diamonds_df %>% 
  select(carat, color, x, y, clarity) %>% 
  sample_n(size = 1000) 

# Make a plot.
ggplot(data = diamonds_sample_df) +
  geom_point(mapping = aes(x = x, y = carat, colour = clarity))

# Save the plot.
ggsave(filename = "results/my_plot.png", height = 8, width = 10, unit = "cm")

