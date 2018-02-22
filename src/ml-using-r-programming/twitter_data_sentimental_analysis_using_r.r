#-----------TWITTER DATA ANALYTICS USING R------------------

consumer_key <- "GIVE YOUR CONSUMER KEY"
consumer_secret_key <- "SECRETKEY"

access_token <- "ACCESS_TOKEN"
access_token_secret <- "TOKEN SECRET"

consumer_key

install.packages("twitteR")
install.packages("httr")
install.packages("ROAuth")
install.packages("devtools")


library(httr)
library(devtools)
library(twitteR)
library(ROAuth)
library(RCurl)
library(plyr)
library(stringr)
library(ggplot2)

#============================================================

---
  title: "Twitter"
output:
  html_document: default
word_document: default
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


## 

# save credentials
### https://apps.twitter.com/
library(httr)
library(devtools)
library(twitteR)
#install.packages("ROAuth")
library(ROAuth)
#install.packages('base64enc')
library(base64enc)
library(plyr)
library(stringr)
library(ggplot2)
library(httpuv)
library(RCurl)
# Set SSL certs globally

options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

requestURL = "https://api.twitter.com/oauth/request_token"
accessURL = "https://api.twitter.com/oauth/access_token"
authURL = "https://api.twitter.com/oauth/authorize"
consumerKey <- consumer_key
consumerSecret <- consumer_secret_key
#consumerKey
accessToken <- access_token
accessSecret <- access_token_secret
options(httr_oauth_cache=T)

setup_twitter_oauth(consumerKey,
                    consumerSecret,
                    accessToken,
                    accessSecret)

#to get the 1000 tweeets in a list, machine learning
r_stats <- searchTwitter("machinelearning", n=1000)
r_stats
class(r_stats)
y_stats.df = twListToDF(r_stats) 
View(y_stats.df)


# Sentiment Analysis or social media analytics 
library(plyr)
library(stringr)
library(ggplot2)

DatasetKKRiders <- read.csv("C:\\Users\\Administrator\\Desktop\\KKRidersTweets.csv")
#DatasetKKRiders$text<-as.factor(DatasetKKRiders$text)

Datasetlionsdenkxip <- read.csv("C:\\Users\\Administrator\\Desktop\\lionsdenKXIPTweets.csv")
#Datasetlionsdenkxip$text<-as.factor(Datasetlionsdenkxip$text)

###############################
#Sentiment Function     
###############################

library (plyr)
library (stringr)

score.sentiment = function(sentences, pos.words, neg.words, .progress='none')  
{  
  require(plyr)  
  require(stringr)       
  
  # we got a vector of sentences. plyr will handle a list  
  # or a vector as an "l" for us  
  # we want a simple array ("a") of scores back, so we use   
  # "l" + "a" + "ply" = "laply":  
  
  scores = laply(sentences, function(sentence, pos.words, neg.words) {  
    
    # clean up sentences with R's regex-driven global substitute, gsub():  
    
    sentence = gsub('[[:punct:]]', '', sentence)  
    
    sentence = gsub('[[:cntrl:]]', '', sentence)  
    
    sentence = gsub('\\d+', '', sentence)  
    
    # and convert to lower case:  
    
    sentence = tolower(sentence)  
    
    # split into words. str_split is in the stringr package  
    
    word.list = str_split(sentence, '\\s+')  
    
    # sometimes a list() is one level of hierarchy too much  
    
    words = unlist(word.list)  
    
    # compare our words to the dictionaries of positive & negative terms  
    
    pos.matches = match(words, pos.words)  
    neg.matches = match(words, neg.words)  
    
    # match() returns the position of the matched term or NA  
    # we just want a TRUE/FALSE:  
    
    pos.matches = !is.na(pos.matches)  
    
    neg.matches = !is.na(neg.matches)  
    
    # and conveniently enough, TRUE/FALSE will be treated as 1/0 by sum():  
    
    score = sum(pos.matches) - sum(neg.matches)  
    
    return(score)  
    
  }, pos.words, neg.words, .progress=.progress )  
  scores.df = data.frame(score=scores, text=sentences)  
  return(scores.df)  
} 


############################################
#Scoring Tweets & Adding a column      
############################################

## List of positive and negative words can be downloaded from below link
## http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html#lexicon

#Load sentiment word lists
hu.liu.pos = scan('F:/New folder/R Videos/positive-words.txt', what='character', comment.char=';')
hu.liu.neg = scan('F:/New folder/R Videos/negative-words.txt', what='character', comment.char=';')

#Add words to list # Optional 
pos.words = c(hu.liu.pos, 'upgrade','jai ho')
neg.words = c(hu.liu.neg, 'wtf', 'wait','waiting', 'epicfail', 'mechanical')

#Score all tweets 
KKRiders.scores = score.sentiment(DatasetKKRiders$text, pos.words,neg.words, .progress='text')
lionsdenkxip.scores = score.sentiment(Datasetlionsdenkxip$text, pos.words,neg.words, .progress='text')
View(KKRiders.scores)


#path<-""
#write.csv(KKRiders.scores,file=paste(path,"KKRidersScores.csv",sep=""),row.names=TRUE)
#write.csv(lionsdenkxip.scores,file=paste(path," lionsdenkxipScores.csv",sep=""),row.names=TRUE)

KKRiders.scores$Team = 'KKRiders'
View(KKRiders.scores)
lionsdenkxip.scores$Team = 'lionsdenkxip'
View(lionsdenkxip.scores)
############################# 
# Visualizing         
#############################

hist(KKRiders.scores$score)
qplot(KKRiders.scores$score)

hist(lionsdenkxip.scores$score)

qplot(lionsdenkxip.scores$score)

#################################
#Comparing 2 data sets                
#################################

# all.scores = rbind(KKRiders.scores, lionsdenkxip.scores, MLB.scores)
all.scores = rbind(KKRiders.scores, lionsdenkxip.scores)
ggplot(data=all.scores) + # ggplot works on data.frames, always
  geom_histogram(mapping=aes(x=score, fill=Team), binwidth=1) +
  facet_grid(Team~.) + # make a separate plot for each hashtag
  theme_bw() + scale_fill_brewer() # plain display, nicer colors

#####################################################
#https://apps.twitter.com

# You'd need to set global options with an authenticated app
consumerKey <- ""
consumerSecret <- ""
accessToken <- ""
accessTokenSecret <- ""

setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessTokenSecret)

# We can request only 3200 tweets at a time; it will return fewer
# depending on the API
tweets1 <- userTimeline("KKR", n = 100)
tweets1_df <- tbl_df(map_df(tweets1, as.data.frame))

-------------------------------------------------------------------------------
  #install.packages("wordcloud")
library(wordcloud)  
library(syuzhet)
library(plyr)
library(dplyr)
library(stringr)
library(ggplot2)


#Harvest some tweets
dhoni_tweets = searchTwitter("dhoni", n=2000, since = "2016-09-01", lang = "en")

#explore tweets
length.dhoni_tweets <- length(dhoni_tweets)
length.dhoni_tweets
dhoni_tweets

dhoni_tweets.df <- ldply(dhoni_tweets, function(t) t$toDataFrame())
write.csv(dhoni_tweets.df, "dhonitweets.csv")

#get the text

dhoni_tweets <- sapply(dhoni_tweets, function(x) x$getText())




#cleaning 1- Remove people name, RT text etc.
dhoni_tweets1 <- gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "",dhoni_tweets)
dhoni_tweets1

y_stats.df1 <- gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "",y_stats.df)


#Cleaning 2- remove html links
dhoni_tweets2 <- gsub("http[^[:blank:]]+","", dhoni_tweets1)

y_stats.df2 <- gsub("http[^[:blank:]]+","", y_stats.df1)

#cleaning 3- remove the people names
dhoni_tweets3 <- gsub("@\\w+", "", dhoni_tweets2)

y_stats.df3 <- gsub("@\\w+", "", y_stats.df2)


#cleaning 4- remove punctuations
dhoni_tweets4 <- gsub("[[:punct:]]", " ", dhoni_tweets3)

y_stats.df4 <- gsub("[[:punct:]]", " ", y_stats.df3)

#cleaning 5- remove Punctuations
dhoni_tweets5 <- gsub("[^[:alnum:]]", " ", dhoni_tweets4)


y_stats.df5 <- gsub("[^[:alnum:]]", " ", y_stats.df4)

# Exporting to Excel

write.csv(dhoni_tweets5, "dhonitweets1.csv")

write.csv(y_stats.df5, "ystats.csv")


library(tm)
library(tmap)
#library(expm)

#creating wordcorpus and cleaning
dhoni_tweets6 <- Corpus(VectorSource(dhoni_tweets5))
dhoni_tweets6 <- tm_map(dhoni_tweets6, removePunctuation)
dhoni_tweets6 <- tm_map(dhoni_tweets6, content_transformer(tolower))
dhoni_tweets6 <- tm_map(dhoni_tweets6, removeWords, stopwords("english"))
dhoni_tweets6 <- tm_map(dhoni_tweets6, stripWhitespace)

y_stats.df <- Corpus(VectorSource())

#building wordcloud
pal <- brewer.pal(8, "Dark2")

wordcloud(dhoni_tweets6, min.freq = 5, max.words = Inf, width = 1000, height = 1000,
          random.order = FALSE, color = pal)

#it will show 
wordcloud(dhoni_tweets6)

#Sentiment Analysis
#how the function works

get_nrc_sentiment("I bought an iphone a few days ago.
                  it is such a nice phone, although a little large.
                  the touch screen is cool. the voice quality is 
                  clear too. I simply love it!")

#Running on our data

dhonisentiment <- get_nrc_sentiment(dhoni_tweets5)
dhoniSentimentScores <- data.frame(colSums(dhonisentiment[,]))
names(dhoniSentimentScores) <- "score"
dhoniSentimentScores <- cbind("sentiment" = rownames(dhoniSentimentScores), dhoniSentimentScores)
rownames(dhoniSentimentScores) <- NULL
ggplot(data = dhoniSentimentScores, aes(x = sentiment, y = score))+
  geom_bar(aes(fill = sentiment), stat = "identity")+
  theme(legend.position = "none") +
  xlab("sentiment") + ylab("number of tweets") + ggtitle("Total Score 
                                                         Based on Dhoni Tweets")

