library(tidyverse)

# Plot for beta-values from the LDA model

# Importing data
beta12 <- read.csv("beta_12t.csv")

# Plot
beta12 %>% 
  group_by(topic) %>% 
  top_n(20, beta) %>% 
  ungroup() %>%
  arrange(topic, desc(beta)) %>% 
  mutate(term = reorder(term, beta)) %>% 
  ggplot(aes(term, beta, fill = factor(topic))) + 
  geom_col(show.legend = FALSE) + 
  facet_wrap(~topic, scales = "free") + 
  coord_flip() + 
  scale_fill_brewer(palette="Paired") + 
  theme_gray(base_size = 20)