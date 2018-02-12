install.packages("twitteR")
install.packages("data.table")
install.packages("igraph")
install.packages("gsubfn")
install.packages("grep")
install.packages("stringr")
library(data.table)
library(twitteR)
library(igraph)
library(gsubfn)
library(stringr)

# Change the next four lines based on your own consumer_key, consume_secret, access_token, and access_secret. 
consumer_key <- "z4BiE0xRkkbFO7EzMC5sF6Utf"
consumer_secret <- "fsAng9rf8ubixgg7SCdJNECEo1futVHCcAIQqApRZGwR0Sw1ZU"
access_token <- "356578335-M92lqZaoGuGmp3gNRLi8DDpNTz6Qv62KPY5WJz0Q"
access_secret <- "VQNFrxu905eZMHbIZhatUupRkkdFfNv2ofAYywGM6LO0M"


#Pulling Data
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tw = twitteR::searchTwitter('@liveaction', n = 1e3, since = '2016-11-08', retryOnRateLimit = 1e3)
d = twitteR::twListToDF(tw)

mentions <- str_extract_all(d$text, "\\@(\\w*)")
df.l <- lapply(mentions, function(x) data.frame(mentions=c(x)))
df <- do.call(rbind, df.l)
mentions2 <- gsub("\\@", "", mentions)


edgelist <- list()
for (i in length(d$screenName)){
  for (j in length(mentions[[i]])){
    #name <- d$screenName[i]
    tmp <- list(from=d$screenName[i], to = mentions[[i]][j])
    #edgelist[[name]] <- append(edgelist, tmp)
    edgelist <- base::rbind(edgelist, tmp)
  }
}


#Building network into an iGraph dataframe


#Top nodes by degree


#Top nodes by betweenness
bet <- betweenness(g, v = V(g), directed = TRUE, weights = NULL,
                   nobigint = TRUE, normalized = FALSE)


#Top nodes by closeness
clo <- closeness(g, vids = V(g), mode = c("out", "in", "all", "total"),
                 weights = NULL, normalized = FALSE)


#Top nodes by eigenvector centrality
eig <- eigen_centrality(g, directed = FALSE, scale = TRUE, weights = NULL,
                        options = arpack_defaults)

#Diameter of network
diam <- diameter(g, directed = TRUE, unconnected = TRUE, weights = NULL)

save(d, file="df.rds")