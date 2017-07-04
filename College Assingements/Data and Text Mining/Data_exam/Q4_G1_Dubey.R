library(tm)
library(stringr)
library(tokenizers)


sntdb = as.data.frame(read.csv("C:\\Users\\dubey\\Documents\\GitHub\\Texas-Tech-University\\College Assingements\\Data and Text Mining\\Lecture 13\\sntdb.csv"))


negation_word = c("not","nor","none","no","doesnt","nobody","never","nothing","without","lack","havent","dont","isnt","arent")

#Converted files in Text format and then Run the Sentimental analysis 


Cisco = file("C:\\Users\\dubey\\Desktop\\Data_exam\\New folder\\G1\\Cisco.txt",open='r')
Cisco= readLines(Cisco)

docnumber = length(Cisco)
sentscore = rep(0,docnumber)


senti.score = list()

sentence = unlist(tokenize_sentences(Cisco[20],strip_punctuation = TRUE))

for (i in 1:docnumber)
  {
  
  polarity_net = 0
  polarity_total = 0
  sentence= unlist(tokenize_sentences(Cisco[i],strip_punctuation = TRUE))
  corpus = Corpus(VectorSource(sentence))
  
  for (j in 1:length(corpus))
    {
    negation.sign =1
    texttemp = corpus[[j]][1]
    termlist = scan_tokenizer(texttemp)
    
    
    for(term in termlist)
    {
      if(term %in% negation_word)
      {
        if(negation.sign==1)
        {negation.sign = -1}
        else
        {negation.sign=1} 
      }
      if(term %in% sntdb$word)
      {
        termpola = sntdb$polarity[sntdb$word==term][1]
        print(termpola)
        termstrength= sntdb$type[sntdb$word==term][1]
        termscore =0
        
        
        if(termpola == 'negative' && termstrength =='strongsubj'){termscore = -2}
        if(termpola == 'negative' && termstrength =='weaksubj'){termscore = -1}
        if(termpola == 'positive' && termstrength =='weaksubj'){termscore = 1}
        if(termpola == 'positive' && termstrength =='strongsubj'){termscore = 2}
        
        polarity_net = polarity_net +negation.sign*termscore
        polarity_total= polarity_total + abs(termscore)
      }
      
    }   
      
    }
}

print(polarity_net)
print(polarity_total)


#Converted files in Text format and then Run the Sentimental analysis 

Dell = file("C:\\Users\\dubey\\Desktop\\Data_exam\\New folder\\G1\\Dell.txt",open='r')
Dell= readLines(Dell)

docnumber = length(Dell)
sentscore = rep(0,docnumber)


senti.score = list()

sentence = unlist(tokenize_sentences(Dell[20],strip_punctuation = TRUE))

for (i in 1:docnumber)
{
  
  polarity_net = 0
  polarity_total = 0
  sentence= unlist(tokenize_sentences(Dell[i],strip_punctuation = TRUE))
  corpus = Corpus(VectorSource(sentence))
  
  for (j in 1:length(corpus))
  {
    negation.sign =1
    texttemp = corpus[[j]][1]
    termlist = scan_tokenizer(texttemp)
    
    
    for(term in termlist)
    {
      if(term %in% negation_word)
      {
        if(negation.sign==1)
        {negation.sign = -1}
        else
        {negation.sign=1} 
      }
      if(term %in% sntdb$word)
      {
        termpola = sntdb$polarity[sntdb$word==term][1]
        termstrength= sntdb$type[sntdb$word==term][1]
        termscore =0
        
        
        if(termpola == 'negative' && termstrength =='strongsubj'){termscore = -2}
        if(termpola == 'negative' && termstrength =='weaksubj'){termscore = -1}
        if(termpola == 'positive' && termstrength =='weaksubj'){termscore = 1}
        if(termpola == 'positive' && termstrength =='strongsubj'){termscore = 2}
        
        polarity_net = polarity_net +negation.sign*termscore
        polarity_total= polarity_total + abs(termscore)
      }
      
    }   
    


    
  }
}

print(polarity_net)
print(polarity_total)





Intel = file("C:\\Users\\dubey\\Desktop\\Data_exam\\New folder\\G1\\Intel.txt",open='r')
Intel= readLines(Intel)

docnumber = length(Intel)
sentscore = rep(0,docnumber)


senti.score = list()

sentence = unlist(tokenize_sentences(Intel[20],strip_punctuation = TRUE))

for (i in 1:docnumber)
{
  
  polarity_net = 0
  polarity_total = 0
  sentence= unlist(tokenize_sentences(Intel[i],strip_punctuation = TRUE))
  corpus = Corpus(VectorSource(sentence))
  
  for (j in 1:length(corpus))
  {
    negation.sign =1
    texttemp = corpus[[j]][1]
    termlist = scan_tokenizer(texttemp)
    
    
    for(term in termlist)
    {
      if(term %in% negation_word)
      {
        if(negation.sign==1)
        {negation.sign = -1}
        else
        {negation.sign=1} 
      }
      if(term %in% sntdb$word)
      {
        termpola = sntdb$polarity[sntdb$word==term][1]
        termstrength= sntdb$type[sntdb$word==term][1]
        termscore =0
        
        
        if(termpola == 'negative' && termstrength =='strongsubj'){termscore = -2}
        if(termpola == 'negative' && termstrength =='weaksubj'){termscore = -1}
        if(termpola == 'positive' && termstrength =='weaksubj'){termscore = 1}
        if(termpola == 'positive' && termstrength =='strongsubj'){termscore = 2}
        
        polarity_net = polarity_net +negation.sign*termscore
        polarity_total= polarity_total + abs(termscore)
      }
      
    }   
    
    
    
    
  }
}

print(polarity_net)
print(polarity_total)









