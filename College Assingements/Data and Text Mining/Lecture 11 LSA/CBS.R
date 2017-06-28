library(tm)
library(pdftools)
library(qdapTools)
library(SnowballC)
library(wordcloud)
library(Matrix)
library(stringr)
library(lsa)


CBS <- file("C:\\Users\\dubey\\Documents\\GitHub\\Texas-Tech-University\\College Assingements\\Data and Text Mining\\Lecture 11 LSA\\CBS.txt" , open = "r")
text.decom = readLines(CBS)
text.decom[1]

mystopwords <- c("CBS" , "cbs" ,"fixCBS" ,"app" , "the" ,"can" ,"will" ,"get" ,"use" ,"get")

corpus_txt_3 <- Corpus(VectorSource(text.decom))
corpus_CBS <- tm_map(corpus_txt_3, PlainTextDocument )
corpus_CBS <- tm_map(corpus_txt_3, tolower )
corpus_CBS <- tm_map(corpus_txt_3, removeNumbers )
corpus_CBS <- tm_map(corpus_txt_3, removePunctuation )
#corpus_CBS <- tm_map(corpus_txt_3, removeSparseTerms(corpus_CBS, mystopwords) )
corpus_CBS <- tm_map(corpus_txt_3, stemDocument)



corpus_CBS_stop1 <- tm_map(corpus_CBS , removeWords, stopwords(kind = "english"))
corpus_CBS_stop <- tm_map(corpus_CBS_stop1 , removeWords, mystopwords )

corpus.tbm <- TermDocumentMatrix(corpus_CBS_stop)
write.csv(as.matrix(corpus.tbm) , file=file.path("tdm6.csv"))


#Generating the word cloud 

freq <- rowSums(as.matrix(corpus.tbm))
freq <- sort(freq , decreasing = TRUE)
head(freq)

words <- names(freq)
wordcloud(words[1: 40] , freq[1:40] , scale = c(2,0.8) , colors = brewer.pal(8,"Dark2"))


# Genrating the LSA 


corpus.tbm.weight <- weightTfIdf(corpus.tbm , normalize = TRUE)
write.csv(as.matrix(corpus.tbm.weight) , file=file.path("tdm7.csv"))

#Specify the Dimentions
mydimentions =5 

#LSA
corpus.tbm.weight.lso <- lsa(corpus.tbm.weight, dim=mydimentions)
summary(corpus.tbm.weight.lso)

tk <-as.matrix(corpus.tbm.weight.lso$tk)

#Checking the typeits a vector convert that into matrix form for calculation 
corpus.tbm.weight.lso$tk

sk <- Diagonal(n=mydimentions , as.matrix(corpus.tbm.weight.lso$sk))
dk <- as.matrix(corpus.tbm.weight.lso$dk)

#Term Loading 
termloading <- tk%*%sk 
write.csv(as.matrix(termloading), file=file.path("tdm8.csv"))


#DocumentLoading 
Documentloading <- dk%*%sk 
write.csv(as.matrix(Documentloading), file=file.path("tdm9.csv"))


y <- corpus.tbm.weight.lso$sk
x <- seq(1,mydimentions, 1)

plot(x,y , xlab ="number of factors",
     ylab = "singular values",
     main = "Matrix",
     ylim =c(0,10) , xlim = c(1,5 ) , phc = 15 , col="Blue"
)


