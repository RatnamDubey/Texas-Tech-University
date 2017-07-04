library(tm)
library(pdftools)
library(qdapTools)
library(SnowballC)
library(wordcloud)
library(Matrix)
library(stringr)
library(lsa)

#Reading the File 

Abstract <- file("C:/Users/dubey/Desktop/Data_exam/Q1/Abstract.txt", open = "r")
text.decom = readLines(Abstract)
text.decom[1]

#Removing Number, Puncuations and Other Stuffs

corpus_txt_3 <- Corpus(VectorSource(text.decom))
corpus_ABS <- tm_map(corpus_txt_3, PlainTextDocument )
corpus_ABS <- tm_map(corpus_txt_3, tolower )
corpus_ABS <- tm_map(corpus_txt_3, removeNumbers )
corpus_ABS <- tm_map(corpus_txt_3, removeNumbers )
corpus_ABS <- tm_map(corpus_txt_3, removePunctuation )
corpus_ABS <- tm_map(corpus_txt_3, stemDocument)

mystopwords <- c("(IT)" , "(IP)" ,"and" ,"from" , "find" ,"with" ,"when" ,"are" ,"has" ,"the" ,"can" , "not", "our" , "for" ,"also", "more" ,"that")


#Using English Stopwords 

corpus_ABS_stop <- tm_map(corpus_ABS , removeWords, stopwords(kind = "english") )
corpus_ABS_stop <- tm_map(corpus_ABS , removeWords, mystopwords )


#Generating the Term Document Matrix 

corpus.tbm <- TermDocumentMatrix(corpus_ABS_stop)
write.csv(as.matrix(corpus.tbm) , file=file.path("C:/Users/dubey/Desktop//Q1a_term_Ratnam.csv"))

ABS <- DocumentTermMatrix(corpus_ABS_stop)



#Generating the word cloud 

freq <- rowSums(as.matrix(corpus.tbm))
freq <- sort(freq , decreasing = TRUE)
head(freq)

words <- names(freq)
wordcloud(words[1: 40] , freq[1:40] , scale = c(2,0.8) , colors = brewer.pal(8,"Dark2"))


#Using the LSA Function 

# Genrating the LSA 

corpus.tbm.weight <- weightTfIdf(corpus.tbm , normalize = TRUE)
write.csv(as.matrix(corpus.tbm.weight) , file=file.path("C:/Users/dubey/Desktop//Q1a_term_Ratnam2.csv"))


#Specify the Dimentions
mydimentions =15 

#LSA
corpus.tbm.weight.lso <- lsa(corpus.tbm.weight, dim=mydimentions)
summary(corpus.tbm.weight.lso)

tk <-as.matrix(corpus.tbm.weight.lso$tk)

#Checking the typeits a vector convert that into matrix form for calculation 
corpus.tbm.weight.lso$tk

sk <- Diagonal(n=mydimentions , as.matrix(corpus.tbm.weight.lso$sk))
dk <- as.matrix(corpus.tbm.weight.lso$dk)


##
#Generating the LSA 

text.lda = lsa(ABS, dims=dimcalc_raw())
round(as.textmatrix(text.lda),2)










