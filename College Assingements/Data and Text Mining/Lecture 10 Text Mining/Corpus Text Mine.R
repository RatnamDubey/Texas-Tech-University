library(tm)
library(pdftools)
library(qdapTools)
library(SnowballC)
library(wordcloud)
library(Matrix)
library(stringr)

file_path <- "C:\\Users\\dubey\\Documents\\GitHub\\Texas-Tech-University\\College Assingements\\Data and Text Mining\\Lecture 10 Text Mining\\Lc10-Preprocessing2\\ClassDemonstration\\txt"
setwd(file_path)

dir(file_path)

corpus_txt <- Corpus(DirSource(file_path))
corpus_txt


file_path1 <- "C:\\Users\\dubey\\Documents\\GitHub\\Texas-Tech-University\\College Assingements\\Data and Text Mining\\Lecture 10 Text Mining\\Lc10-Preprocessing2\\ClassDemonstration\\pdf"
setwd(file_path1)
dir(file_path1)

corpus_txt1 <- Corpus(DirSource(file_path1))
corpus_txt1


Files <- list.files(pattern = "pdf$")
#converting pdf to text 
text <- lapply(Files, pdf_text)
# Removing extra char 
text_clean <- lapply(text, str_replace_all,"[\n]","")
text_clean1 <- lapply(text_clean, str_replace_all,"[\r]","")

text_clean1

corpus_txt_2 <- Corpus(VectorSource(text_clean1))
corpus_txt_2


####################################################################
#           HBO FILES 
#
#################################################################


HBO <- file("C:\\Users\\dubey\\Documents\\GitHub\\Texas-Tech-University\\College Assingements\\Data and Text Mining\\Lecture 10 Text Mining\\Lc10-Preprocessing2\\ClassDemonstration\\HBO_NOW.txt" , open = "r")
text.decom = readLines(HBO)
text.decom[1]

corpus_txt_3 <- Corpus(VectorSource(text.decom))

corpus_HBO <- tm_map(corpus_txt_3, PlainTextDocument )
corpus_HBO <- tm_map(corpus_txt_3, tolower )
corpus_HBO <- tm_map(corpus_txt_3, removeNumbers )
corpus_HBO <- tm_map(corpus_txt_3, removePunctuation )


stopwords(kind = "en")
mystopwords <- c("HBO" , "hbo" ,"now" ,"app")

corpus_HBO_stop <- tm_map(corpus_HBO , removeWords , c(stopwords(kind = "en") , mystopwords))

corpus.tbm <- TermDocumentMatrix(corpus_HBO_stop)
write.csv(as.matrix(corpus.tbm) , file=file.path("tdm.csv"))


freq <- rowSums(as.matrix(corpus.tbm))
freq <- sort(freq , decreasing = TRUE)
head(freq)

words <- names(freq)
wordcloud(words[1: 40] , freq[1:40] , scale = c(2,0.8) , colors = brewer.pal(8,"Dark2"))

