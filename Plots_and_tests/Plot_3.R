library(tidyverse)
library(gridExtra)

# Plot for aggregated number of lines (y-axis) on the timescale

# Importing data
test <- read.csv("periodicals_wnumb-of-lines.csv")

# Counting mean and median number of lines in each year
lin_mean <- ddply(test, "Year", summarise, verse.mean = mean(lines))
lin_med <- ddply(test, "Year", summarise, verse.med = median(lines))
lin_mean$verse.med <- lin_med$verse.med

# Plots

p1 <- lin_mean %>% 
  ggplot(aes(Year, verse.mean)) + 
  geom_point(color = "darkblue", size = 3) + 
  theme_light(base_size = 16) + 
  labs(x = "Год", y = "Средняя длина текста в строках") + 
  geom_smooth(method = "lm")

p2 <- lin_mean %>% 
  ggplot(aes(Year, verse.med)) + 
  geom_point(color = "darkred", size = 3) + 
  theme_light(base_size = 16) + 
  labs(x = "Год", y = "Медианная длина текста в строках") + 
  geom_smooth(method = "lm", colour = "darkred")

grid.arrange(p1, p2, ncol = 2)
