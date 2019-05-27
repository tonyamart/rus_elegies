library(tidyverse)

# Plots that describes relations between 12 topics and meters.

# Data: gamma values from the model for 12 topics
big_gamma <- read.csv("gamma_12t.csv")

# Plot 2
big_gamma %>% 
  separate(document, c("id", "year", "Meter", "Verse", "canon_ou_non", "corpus_type"), sep = "_", convert = TRUE) %>% 
  mutate(Meter = str_replace_all(Meter, "Дк", "Д")) %>% 
  filter(corpus_type =="core") %>% 
  filter(Meter!="Полиметр") %>%
  filter(Meter!="Эд") %>% 
  filter(Meter!="Гк") %>% 
  group_by(topic, Meter) %>% 
  summarize(aggr = mean(gamma)) %>% 
  ungroup() -> bgamma_meter

bgamma_meter %>% 
  ggplot(aes(x = as.factor(topic), y = aggr, 
             group = Meter, color = Meter)) + 
  geom_line() + facet_wrap(~Meter) + 
  geom_text(aes(label=as.factor(topic))) + 
  labs(y = "Вероятность появления темы", 
       x = "Темы", 
       title = "Соотношение тем и метров")


# Plot 3

big_gamma %>% 
  separate(document, c("id", "year", "Meter", "Verse", "canon_ou_non", "corpus_type"), sep = "_", convert = TRUE) %>% 
  mutate(Meter = str_replace_all(Meter, "Дк", "Д")) %>% 
  filter(corpus_type =="core") %>% 
  filter(Meter!="Полиметр") %>%
  filter(Meter!="Эд") %>% 
  group_by(topic, Verse) %>% 
  summarize(aggr = mean(gamma)) %>% 
  ungroup() -> bgamma_verse

bgamma_verse %>% 
  filter(Verse == "Амф4"| Verse == "Х4" | Verse == "Я4" | Verse == "Я43" | Verse == "Я5" | Verse == "Я6" | Verse == "Я65" | Verse == "Я6664" | Verse == "ЯВ") %>%
  ggplot(aes(x = as.factor(topic), 
             y = aggr, group = Verse, color = Verse)) + 
  geom_line() + facet_wrap(~Verse) + 
  geom_text(aes(label=as.factor(topic))) + 
  labs(y = "Вероятность появления темы", 
       x = "Темы", 
       title = "Соотношение тем и размеров", 
       color = "Размер")
