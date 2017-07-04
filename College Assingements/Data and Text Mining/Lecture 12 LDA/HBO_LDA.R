library(tm)
library(pdftools)
library(qdapTools)
library(SnowballC)
library(wordcloud)
library(Matrix)
library(stringr)
library(lsa)
library("topicmodels")
library("tidytext")
library("ggplot2")
library("dplyr")




HBO <- file("C:\\Users\\dubey\\Documents\\GitHub\\Texas-Tech-University\\College Assingements\\Data and Text Mining\\Lecture 11 LSA\\HBO_NOW.txt" , open = "r")
text.decom = readLines(HBO)
text.decom[1]

mystopwords <- c("HBO" , "hbo" ,"fixhbo" ,"app" , "the" ,"can" ,"will" ,"get" ,"use" ,"get")

corpus_txt_3 <- Corpus(VectorSource(text.decom))
corpus_HBO <- tm_map(corpus_txt_3, PlainTextDocument )
corpus_HBO <- tm_map(corpus_txt_3, tolower )
corpus_HBO <- tm_map(corpus_txt_3, removeNumbers )
corpus_HBO <- tm_map(corpus_txt_3, removePunctuation )
corpus_HBO <- tm_map(corpus_txt_3, stemDocument)


corpus_HBO_stop1 <- tm_map(corpus_HBO , removeWords, stopwords(kind = "english"))
corpus_HBO_stop <- tm_map(corpus_HBO_stop1 , removeWords, mystopwords )

corpus.tbm <- TermDocumentMatrix(corpus_HBO_stop)
write.csv(as.matrix(corpus.tbm) , file=file.path("hbo1.csv"))

hbo1 <- DocumentTermMatrix(corpus_HBO_stop)

p = c(2,3,4,5,10,20,40,60,100)


results = matrix(0,nrow = length(p) , ncol = 2)
colnames(results) = c("k" ,"perplexity")


for (i in 1:length(p))
{
  k = p[i];
  seed =200;
  text.lda =LDA(hbo1,k=k , method = "Gibbs" , control = list(seed=seed , burnin=1000 , thin= 100 ,iter=1000))
  results[i,] =c(k,perplexity(text.lda , newdata = hbo1))
}



k = 10 
hbo_text.lda = text.lda = LDA(hbo1 ,k=10 , method = "Gibbs" , control = list(seed=seed , burnin=1000 , thin= 100 ,iter=1000))

term_hbo = tidy(hbo_text.lda,"gamma")
hbo_posterior = posterior(hbo_text.lda)$terms


write.csv( hbo_posterior, file=file.path("hbo_posterior.csv") )




