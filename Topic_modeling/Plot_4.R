library(tidyverse)
library(tidytext)
library(RColorBrewer)

# Plots for topic distribution in time in two corpora: canonical one and inclusive (the corpus of elegies in this repository)

# Data: gamma values from the model for 12 topics
big_gamma <- read.csv("gamma_12t.csv")

## Splitting the names of the files and make the plot for the elegies corpus
big_gamma %>% 
  separate(document, c("id", "year", "Meter", "Verse", "canon_ou_non", "corpus_type"), sep = "_", convert = TRUE) %>% 
  filter(corpus_type == "core") %>% 
  mutate(period = floor(year/3)*3) %>% 
  group_by(topic, period) %>% 
  summarize(aggr = mean(gamma)) %>% 
  ungroup() -> bgamma_core


bgamma_core %>% 
  ggplot(aes(x = period, y = aggr)) + 
  geom_col(aes(fill = factor(topic))) + 
  labs(х = "",
        y = "Вероятность появления темы", 
        title = "Инклюзивный корпус") +
  scale_fill_brewer(palette="Paired") + 
  theme_gray(base_size = 20)

# Same for the canonical corpus
big_gamma %>% 
  separate(document, c("id", "year", "Meter", "Verse", "canon_ou_non", "corpus_type"), sep = "_", convert = TRUE) %>% 
  filter(canon_ou_non == "canon") %>% 
  mutate(period = floor(year/3)*3) %>% 
  group_by(topic, period) %>% 
  summarize(aggr = mean(gamma)) %>% 
  ungroup() -> gamma_canon

gamma_canon %>% 
  filter(period > 1813) %>%
  ggplot(aes(x = period, y = aggr)) + 
  geom_col(aes(fill = factor(topic))) + 
  labs(y = "Вероятность появления темы", 
       x = "", 
       title = "«Канонический» корпус") +
  scale_fill_brewer(palette="Paired") + 
  theme_gray(base_size = 20)
