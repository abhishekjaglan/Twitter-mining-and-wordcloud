# twitter mining and wordcloud
install.packages("twitteR")
install.packages("RCurl")
require(RCurl)
require(twitteR)
consumer_key <- 'dKwf8z95QrUFWjllrKyuakyse'
consumer_secret <- 'xGgTFqeYkLSoC0MSmQAtkk3SPvMwkdV1hTFjMj4d55F2aqXx8J'
access_key <- '1023429890085937153-Xi9xKoPcwY4WVdF9tuH9kXDz3TIMaY'
access_secret <- 'QWRMwvDhDqEYGeuSGnRIMv5uPMLHKiFWq2DJV8qBQcWGu'
setup_twitter_oauth(consumer_key = consumer_key,consumer_secret = consumer_secret,access_token = access_key,access_secret = access_secret)
barca_tweets <- searchTwitter("FCB", n=100, lang = "en")
barca_tweets
str(barca_tweets)
install.packages("tm")
require(tm)
install.packages("wordcloud")
require(wordcloud)
virus <- searchTwitter('coronavirus+india', lang = "en", n=1000, resultType = "recent")
class(virus)
virus_text <- sapply(virus, function(x) x$getText())
str(virus_text)
virus_corpus <- Corpus(VectorSource(virus_text))
virus_corpus
inspect(virus_corpus[3])
inspect(virus_corpus[100])
virus_clean <- tm_map(virus_corpus,removePunctuation)
virus_clean <- tm_map(virus_clean, content_transformer(tolower) )
virus_clean <- tm_map(virus_clean, removeWords, stopwords("english"))
virus_clean <- tm_map(virus_clean, removeNumbers)
viurs_clean <- tm_map(virus_clean, stripWhitespace)
wordcloud(virus_clean)
wordcloud(virus_clean, scale = c(7,.5))
wordcloud(virus_clean,random.order = F )
wordcloud(virus_clean,random.order = F,scale = c(6, 0.2) )
wordcloud(virus_clean, scale = c(7,.5), colors = rainbow(100))
