library(tm)
library(pdftools)
library(qdapTools)
library(SnowballC)
library(wordcloud)
library(Matrix)
library(stringr)
library(lsa)



HBO <- file("C:\\Users\\dubey\\Documents\\GitHub\\Texas-Tech-University\\College Assingements\\Data and Text Mining\\Lecture 10 Text Mining\\Lc10-Preprocessing2\\ClassDemonstration\\HBO_NOW.txt" , open = "r")
text.decom = readLines(HBO)
text.decom[1]

corpus_txt_3 <- Corpus(VectorSource(text.decom))

corpus_HBO <- tm_map(corpus_txt_3, PlainTextDocument )
corpus_HBO <- tm_map(corpus_txt_3, tolower )
corpus_HBO <- tm_map(corpus_txt_3, removeNumbers )
corpus_HBO <- tm_map(corpus_txt_3, removePunctuation )
corpus_HBO <- tm_map(corpus_txt_3, stemDocument)

stopwords(kind = "en")
mystopwords <- c("HBO" , "hbo" ,"now" ,"app")

corpus_HBO_stop <- tm_map(corpus_HBO , removeWords , c(stopwords(kind = "en") , mystopwords))

corpus.tbm <- TermDocumentMatrix(corpus_HBO_stop)
write.csv(as.matrix(corpus.tbm) , file=file.path("tdm.csv"))

corpus.tbm.weight <- weightTfIdf(corpus.tbm , normalize = TRUE)
write.csv(as.matrix(corpus.tbm.weight) , file=file.path("tdm1.csv"))

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
write.csv(as.matrix(termloading), file=file.path("tdm2.csv"))


#DocumentLoading 
Documentloading <- dk%*%sk 
write.csv(as.matrix(Documentloading), file=file.path("tdm3.csv"))


y <- corpus.tbm.weight.lso$sk
x <- seq(1,mydimentions, 1)

plot(x,y , xlab ="number of factors",
            ylab = "singular values",
            main = "Matrix",
      ylim =c(0,10) , xlim = c(1,5 ) , phc = 15 , col="Blue"
            )


#Term LOading Rotation 

termloading.rotation <-  varimax(as.matrix(termloading),
                                normalize = TRUE)
summary(termloading.rotation)

write.csv(termloading.rotation$loadings , file=file.path("tdm4.csv"))











