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

#Finding the Optimul number of K 

#Setting the Values
p = c(2,3,4,5,10,20,40,60,100)


results = matrix(0,nrow = length(p) , ncol = 2)
colnames(results) = c("k" ,"perplexity")

#looping as to get the optinum number

for (i in 1:length(p))
{
  k = p[i];
  seed =200;
  text.lda =LDA(ABS,k=k , method = "Gibbs" , control = list(seed=seed , burnin=1000 , thin= 100 ,iter=1000))
  results[i,] =c(k,perplexity(text.lda , newdata = ABS))
}


#Checking teh Results 
results

#taking the optimul nuber as K = 60 
ABS_text.lda = text.lda = LDA(ABS ,k=60 , method = "Gibbs" , control = list(seed=seed , burnin=1000 , thin= 100 ,iter=1000))

#Using the Tidy function to verify 
term_ABS = tidy(ABS_text.lda,"gamma")

print(term_ABS)

#Term Probablity
ABS_posterior = posterior(ABS_text.lda)$terms
write.csv( ABS_posterior, file=file.path("C:/Users/dubey/Desktop//Q1a_TermTopic_Ratnam.csv") )


apldata = LDA(ABS , k=60)
aptopics = tidy(apldata , matrix = "beta")
aptopterms = aptopics %>% group_by(topic) %>% top_n(10,beta) %>%  ungroup()  %>% arrange(topic,desc(beta))
aptopterms%>% mutate(terms = reorder(term , beta)) %>% ggplot(aes(term,beta,fill=factor(topic))) + geom_col(show.legend = TRUE) + facet_wrap(~topic , scale = "free") + coord_flip()

# The optimul number of the topics k = 60 



