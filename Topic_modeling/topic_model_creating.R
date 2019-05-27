library(tidyverse)
library(tm)
library(topicmodels)

# Upload corpus made for the dtm
elegies <- read.csv("core-canon_to_dtm.csv")

glimpse(elegies)

##
# importing stoplist
stoplist <- stopwords("ru")

# Not all words from the default stoplist are need to be eliminated, let's keep these:
goodwords <- c("я","ты", "он", "она", "вы", "только", "когда", "вдруг", "уже", "еще", "нет", "да", "опять", "уж", "сказать", "ведь", "там", "потом", "себя", "ничего", "тут", "где", "надо", "человек", "раз", "тоже", "жизнь", "тогда", "говорил", "совсем", "здесь", "один", "почти", "кажется", "сейчас", "наконец", "два", "другой", "сегодня", "никогда", "после", "впрочем", "хорошо", "иногда", "нельзя", "всегда", "конечно")
stoplist <- stoplist[!stoplist %in% goodwords]

###########################
## DTM and LDA model

elegies$text_lem <- as.character(elegies$text_lem)

glimpse(elegies)

# making dtm
elegies %>% 
  unnest_tokens(input = text_lem, output = word, to_lower = TRUE) %>%
  filter(!word %in% stoplist) %>% 
  count(doc_id, word) %>%
  cast_dtm(document = doc_id, term = word, value = n) -> dtm


# Creating a model

mod_12 <- LDA(dtm, k = 12, method = "Gibbs",
              control = list(alpha = 0.5, delta = 0.1, 
                             iter = 2000, seed = 1234, thin = 1))

# creating beta and gamma results (saved to the repository as .csv files)
beta12 <- tidy(mod_12, matrix = "beta") 

big_gamma <- tidy(mod_12, matrix = "gamma") 
