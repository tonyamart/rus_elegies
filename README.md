## Russian Elegies corpus

The repository contains a corpus of Russian elegies published between 1815 and 1835 that was used for the MA thesis: Martynenko A. _Russian Elegy of the first third of the 19th century and the Genre System Evolution in Evgeny Baratysnky's Poetry_. Tartu, 2019.

The corpus is presented through the metadata table and collection of poems stored as separate plain texts (UTF-8 format). For further computational study texts are presented in modern Russian orthography, line indents and other printing features (asterisks between stanzas etc.) were also excluded from the texts. However, elegies in the corpus retain punctuation, line division and rhymes according to historical sources. Words printed in italics are represented by the <i> tag (for example: <i>слово</i>). 
  
The metadata (authors names, years of publication, sources, etc.) are stored as 'elegies_metadata.tsv'. The texts are to be connected with the metadata table through id-s.

The tests on correlation between number of lines in poems and years of publication could be found in the folder 'Plots and tests' accordingly, the data are stored as a .csv file.
The plots and results gathered from the topic modeling analysis could be also found in the corresponding folder.
  
    
### Results overview

The work is dedicated to the question of quantitative analysis of single-genre poetical corpus of Russian elegies.
The elegy plays a particularly important role in the Russian literature of the 19th century; however, most scholars had focused on a small set of elegy poems written by Alexander Pushkin, Konstantin Batushkov, Evgeny Baratynsky, and Vasilij Zhukovsky. Since the development of the elegy has never been studied on the basis of a representative corpus, the aim of this work was to piece together considerable amount of published texts entitled as an elegy and describe the formal and thematic features of these poems, which will help to outline the feasible evolution of the genre.

The lexical frequencies (absolute and log odds ratio) of words calculated for the corpus of elegies are compared with those of poetical subcorpus of the Russian National Corpus in order to find distinctive "elegiac" words. The results show that in the elegies the means to describe love, loss and melancholy are used much more than in the poetry of this period in general. This hypothesis was tested with topic modelling analysis (LDA, `topicmodels` r package) that proves that the elegy became close to a poem about love only during the second half of the 1820s. However, earlier in the end of 1810s the elegiac themes were scenes from history or funeral mourning. Correlations between themes and meters have been studied as well: for example, the iamb-65 (reg. alternation of iambic hexameter and iambic pentameter) as a specific meter of funeral elegy and iambic hexameter in imitations of Latin elegies. The shift from these more traditional subjects (funeral and "historical" motives) to the theme of love coincides with changing of formal features of poems that became shorter and switched from iambic hexameter and its variations to iambic tetrameter.  

### Metadata table
Column names explanations:
id - identifier for each text. The texts (.txt files) are to be connected with the metadata table through id-s;  
Signature - Author's signature as it was written in the sourse of publication;  
Author - Author of the text (on the base of signature and other facts);  
Title - Title of the text in the source;  
First line - First line of the text;  
Year1 - Year of publishing;  
Meter - Poetic meter (abbrevation);  
Razmer - Poetic meter with number of feet;  
Razmer_wclaus - Poetic meter with number of feet and type of clausula;  
Genre subtitle - Subtitle given in the source of publication;  
Source_name - Name of the source (abbreviations for periodicals);  
Place - Place of publication (only for poetry collections);  
Year - Year of publishing the text's source;  
Volume, Number, Page - Bibliographical data accordingly;  
Type - Type of the source (per = periodicals, alm = almanac, col = poetry collection);  
Перепечатки - Notes on text's republications;  
Canon_ou_non, corpus - Additional columns for further analysis.  




##  Русская элегия (1815-1835)

### Корпус

В репозитории содержится корпус русских элегий, опубликованных с 1815 по 1835. Тексты в формате .txt (кодировка UTF-8) объединены в архив _corpus_. Метаданные к текстам (имена авторов, годы публикации, библиография) находятся в таблице _elegies_metadata.tsv_.

Материалы корпуса были собраны в ходе работы над [магистерской диссертацией](https://dspace.ut.ee/handle/10062/64380): _Мартыненко А._ Русская элегия первой трети XIX в. и эволюция жанровой системы Е. А. Баратынского. Тарту, 2019.

Целью корпуса являлось объединить как можно большую коллекцию текстов, носящих жанровый заголовок "элегия" и, как следствие, репрезентативных по отношению к эволюции этого жанра в период с 1815 по 1835 гг.

Для машинной обработки тексты были переведены в современную орфографию, в них также не сохранялись отступы и другие графические особенности публикации стихотворных текстов XIX в. При этом сохранялись прописные буквы, пунктуация и деление на строки и строфы. Слова, выделенные в источнике курсивом в корпусе помещены в тег <i></i> (по образцу <i>слово</i>).

#### Исследование

Данные о корреляции между количеством строк в элегиях и годом публикации и иллюстрации к ним находятся в разделе _Plots and tests_. Результаты тематического моделирования и визуализации бета- и гамма- значений помещены в папку _Topic modeling_.

Лексические частоты слов, подсчитанные для корпуса элегий, сравнивались с частотами в поэтическом подкорпусе Национального корпуса русского языка. Результаты этого сравнения доказывают, что в элегиях больше, чем в поэзии вообще, используются слова для описания любви, потери и меланхолии. Эта гипотеза подтверждается и на основании тематического моделирования: по результатам анализа к концу 1820-х годов элегия становится небольшим стихотворением любовной тематики. Между тем, еще в 1810-х гг. главными поджанрами были «историческая элегия» и элегия «на смерть». Сдвиг от этих традиционных элегических сюжетов к любовной теме происходит одновременно с формальными изменениями элегий: они становятся меньше в объеме и написаны уже не шестистопным (либо ЯВ / ЯРз с шестистопными строками), а четырехстопным ямбом. Отдельные наблюдения над метрическими изменениями внутри жанра позволяют однозначно связывать модификации форм с изменением содержания элегий, доказанное выше  тематического моделирования.


#### Таблица метаданных

Расшифровка названий колонок в таблице _elegies_metadata.csv_.  
**id** - Идентификатор текста. Тексты в корпусе (файлы . txt) соотносятся с метаданными на основании идентификатора.  
**Signature** - Подпись автора при публикации текста.  
**Author** - Автор текста (на основании подписи и проч. материалов).  
**Title** - Заголовок текста, указанный при публикации.  
**First line** - Первая строка.  
**Year1** - Год публикации.  
**Meter** - Метр.  
**Razmer** - Метрическая формула с указанием стопности.  
**Razmer_wclaus** - Метрическая формула с указанием стопности и клаузулы.  
**Genre subtitle** - Подзаголовок стихотворения, указанный при публикации.  
**Source name** - Название источника.  
**Place** - Место публикации (для непериодических изданий).  
**Year** - Год публикации источника текста в корпусе.  
**Volume** - Часть / Том / Книга.  
**Number** - Номер.  
**Page** - Страницы.  
**Type** - Тип источника (per = периодика, alm = альманахи, col = авторские сборники).  
**Перепечатки** - Данные о повторных публикациях текстов.  
Далее - служебные колонки, необходимые при обработке данных.  
