library(tidyverse)

# Import data (table with elegies from periodicals with number of lines)
elegies <- read.csv("periodicals_wnumb-of-lines.csv")

# Regrouping metrical scemes
elegies <- elegies %>% 
  filter(Verse!="Полиметр") %>%
  mutate(Verse = str_replace_all(Verse, "(Амф)\\w+", "\\1")) %>% 
  mutate(Verse = str_replace_all(Verse, "(Д)\\w+", "\\1")) %>% 
  mutate(Verse = str_replace_all(Verse, "(Х)\\w+", "\\1")) %>% 
  mutate(Verse = str_replace_all(Verse, "Я\\d\\d+", "Я Рз")) %>% 
  mutate(Verse = str_replace_all(Verse, "Эд", "Эл. дистих"))

labels1 = elegies %>%
  filter(lines > 173) %>%
  mutate(label= c("В.Г. Тепляков «Вторая фракийская элегия»", "П.А. Катенин «Элегия»", "П.П. Ершов «Семейство роз»"))

elegies %>% 
  ggplot(aes(Year, lines, group = Verse, color = Verse)) + 
  geom_point(alpha = 0.5, size = 4) + theme_light(base_size = 18) +
  geom_text(data=labels1, aes(Year, lines, label = label), nudge_x = -3.2, nudge_y=5, size = 6, color = "darkblue") +
  scale_color_manual(values = rainbow(12)) + 
  labs(x = "Год", y = "Количество строк", color = "Размеры")
