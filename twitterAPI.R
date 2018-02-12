install.packages("twitteR")
install.packages("data.table")
install.packages("igraph")
library(data.table)
library(twitteR)
library(igraph)

# Change the next four lines based on your own consumer_key, consume_secret, access_token, and access_secret. 
consumer_key <- "z4BiE0xRkkbFO7EzMC5sF6Utf"
consumer_secret <- "fsAng9rf8ubixgg7SCdJNECEo1futVHCcAIQqApRZGwR0Sw1ZU"
access_token <- "356578335-M92lqZaoGuGmp3gNRLi8DDpNTz6Qv62KPY5WJz0Q"
access_secret <- "VQNFrxu905eZMHbIZhatUupRkkdFfNv2ofAYywGM6LO0M"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tw = twitteR::searchTwitter('#realDonaldTrump + #HillaryClinton', n = 1e4, since = '2016-11-08', retryOnRateLimit = 1e3)
d = twitteR::twListToDF(tw)

userTimeline(user='liveaction', n=20)
mention <- mentions(n=100)
head(mention)

