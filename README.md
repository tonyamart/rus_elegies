## Russian Elegies corpus

The repository contains a corpus of Russian elegies published between 1815 and 1835 that was used for the MA thesis: Martynenko A. _Russian Elegy of the first third of the 19th century and the Genre System Evolution in Evgeny Baratysnky's Poetry_. Tartu, 2019.

The texts are plain texts in UTF-8 format. The metadata (authors names, years of publication, sources, etc.) are stored as 'elegies_metadata.csv'.
The tests on correlation between number of lines in poems and years of publication could be found in the folder 'Plots and tests' accordingly, the data is stored as a .csv file.
The plots and results gathered from the topic modeling analysis could be also found in the corresponding folder.
  
    
### Results overview

The work is dedicated to the question of quantitative analysis of single-genre poetical corpus of Russian elegies.
The elegy plays a particularly important role in the Russian literature of the 19th century; however, most scholars had focused on a small set of elegy poems written by Alexander Pushkin, Konstantin Batushkov, Evgeny Baratynsky, and Vasilij Zhukovsky. Since the development of the elegy has never been studied on the basis of a representative corpus, the aim of this work was to piece together considerable amount of published texts entitled as an elegy and describe the formal and thematic features of these poems, which will help to outline the feasible evolution of the genre.  

The lexical frequencies (absolute and log odds ratio) of words calculated for the corpus of elegies are compared with those of poetical subcorpus of the Russian National Corpus in order to find distinctive "elegiac" words. The results show that in the elegies the means to describe love, loss and melancholy are used much more than in the poetry of this period in general. This hypothesis was tested with topic modelling analysis (LDA, `topicmodels` r package) that proves that the elegy became close to a poem about love only during the second half of the 1820s. However, earlier in the end of 1810s the elegiac themes were scenes from history or funeral mourning. Correlations between themes and meters have been studied as well: for example, the iamb-65 (reg. alternation of iambic hexameter and iambic pentameter) as a specific meter of funeral elegy and iambic hexameter in imitations of Latin elegies. The shift from these more traditional subjects (funeral and "historical" motives) to the theme of love coincides with changing of formal features of poems that became shorter and switched from iambic hexameter and its variations to iambic tetrameter.  





##  Русская элегия (1815-1835)

### Корпус

В репозитории содержится корпус русских элегий, опубликованных с 1815 по 1835. Тексты в формате .txt (кодировка UTF-8) объединены в архив _corpus_. Метаданные к текстам (имена авторов, годы публикации, библиография) находятся в таблице _elegies_metadata.csv_.


Материалы корпуса были собраны в ходе работы над магистерской диссертацией: _Мартыненко А._ Русская элегия первой трети XIX в. и эволюция жанровой системы Е. А. Баратынского. Тарту, 2019.


#### Исследование

Данные о корреляции между количеством строк в элегиях и годом публикации и иллюстрации к ним находятся в разделе _Plots and tests_. Результаты тематического моделирования и визуализации бета- и гамма- значений помещены в папку _Topic modeling_.




#### Таблица метаданных

Расшифровка названий колонок в таблице _elegies_metadata.csv_.  
**id** - Идентификатор текста. Тексты в корпусе (файлы . txt) соотносятся с метаданными на основании идентификатора.  
**Signature** - Подпись автора при публикации текста.  
**Author** - Автор текста (на основании подписи и проч. материалов).  
**Title** - Заголовок текста, указанный при публикации.  
**First line** - Первая строка.  
**Year** - Год публикации.  
**Meter** - Метр.  
**Razmer** - Метрическая формула с указанием стопности.  
**Razmer_wclaus** - Метрическая формула с указанием стопности и клаузулы.  
**Genre subtitle** - Подзаголовок стихотворения, указанный при публикации.  
**Source name** - Название источника.  
**Place** - Место публикации (для непериодических изданий).  
**Year** - Год публикации источника.  
**Volume** - Часть / Том / Книга.  
**Number** - Номер.  
**Page** - Страницы.  
**Type** - Тип источника (per = периодика, alm = альманахи, col = авторские сборники).  
**Перепечатки** - Данные о повторных публикациях текстов.  
Далее - служебные колонки, необходимые при обработке данных.  
