library(tm)
library(stringr)
library(tokenizers)


sntdb = as.data.frame(read.csv("C:\\Users\\dubey\\Documents\\GitHub\\Texas-Tech-University\\College Assingements\\Data and Text Mining\\Lecture 13\\sntdb.csv"))


negation_word = c("not","nor","none","no","doesnt","nobody","never","nothing","without","lack","havent","dont","isnt","arent")


BOA = file("C:\\Users\\dubey\\Desktop\\Data_exam\\New folder\\G2\\BOA.txt",open='r')
BOA= readLines(BOA)

docnumber = length(BOA)
sentscore = rep(0,docnumber)


senti.score = list()

sentence = unlist(tokenize_sentences(BOA[20],strip_punctuation = TRUE))

for (i in 1:docnumber)
{
  
  polarity_net = 0
  polarity_total = 0
  sentence= unlist(tokenize_sentences(BOA[i],strip_punctuation = TRUE))
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




WellsFargo = file("C:\\Users\\dubey\\Desktop\\Data_exam\\New folder\\G2\\WellsFargo.txt",open='r')
WellsFargo= readLines(WellsFargo)

docnumber = length(WellsFargo)
sentscore = rep(0,docnumber)


senti.score = list()

sentence = unlist(tokenize_sentences(WellsFargo[20],strip_punctuation = TRUE))

for (i in 1:docnumber)
{
  
  polarity_net = 0
  polarity_total = 0
  sentence= unlist(tokenize_sentences(WellsFargo[i],strip_punctuation = TRUE))
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





MorganStanley = file("C:\\Users\\dubey\\Desktop\\Data_exam\\New folder\\G2\\MorganStanley.txt",open='r')
MorganStanley= readLines(MorganStanley)

docnumber = length(MorganStanley)
sentscore = rep(0,docnumber)


senti.score = list()

sentence = unlist(tokenize_sentences(MorganStanley[20],strip_punctuation = TRUE))

for (i in 1:docnumber)
{
  
  polarity_net = 0
  polarity_total = 0
  sentence= unlist(tokenize_sentences(MorganStanley[i],strip_punctuation = TRUE))
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









