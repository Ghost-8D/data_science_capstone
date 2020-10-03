## Load CRAN modules 
library(downloader)
library(plyr);
library(dplyr)
library(knitr)
library(tm)
library(stringi)
library(RWeka)
library(ggplot2)
library(slam)

options(mc.cores=1)

## Set paths to datasets
path_to_blogs <- "./data/final/en_US/en_US.blogs.txt"
path_to_news <- "./data/final/en_US/en_US.news.txt"
path_to_twitter <- "./data/final/en_US/en_US.twitter.txt"

## Download the dataset and unzip folder
if (!file.exists(path_to_blogs) | !file.exists(path_to_news) | !file.exists(path_to_twitter)){
    data_url <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
    zip_name <- "Coursera-SwiftKey.zip"
    if(!file.exists(zip_name)){
        download.file(data_url, method="curl", destfile=zip_name)
    }
    unzip(zip_name, exdir="./data")
    file.remove(zip_name)
}


con <- file(path_to_twitter, "r") 
twitter_lines <- readLines(con, skipNul = TRUE)
close(con)

con <- file(path_to_blogs, "r") 
blog_lines <- readLines(con, skipNul = TRUE)
close(con)

con <- file(path_to_news, "r") 
news_lines <- readLines(con, skipNul = TRUE)
close(con)

# Get file sizes
blog_lines.size <- file.info(path_to_blogs)$size / 1024 ^ 2
news_lines.size <- file.info(path_to_news)$size / 1024 ^ 2
twitter_lines.size <- file.info(path_to_twitter)$size / 1024 ^ 2

# Get words in files
blog_lines.words <- stri_count_words(blog_lines)
news_lines.words <- stri_count_words(news_lines)
twitter_lines.words <- stri_count_words(twitter_lines)

# Summary of the data sets
data.frame(source = c("blogs", "news", "twitter"),
file.size.MB = c(blog_lines.size, news_lines.size, twitter_lines.size),
num.lines = c(length(blog_lines), length(news_lines), length(twitter_lines)),
num.words = c(sum(blog_lines.words), sum(news_lines.words), sum(twitter_lines.words)),
mean.num.words = c(mean(blog_lines.words), mean(news_lines.words), mean(twitter_lines.words)))
## Cleaning The Data
# Sample the data
set.seed(5000)
data.sample <- c(sample(blog_lines, length(blog_lines) * 0.02),
sample(news_lines, length(news_lines) * 0.02),
sample(twitter_lines, length(twitter_lines) * 0.02))

# Create corpus and clean the data
corpus <- VCorpus(VectorSource(data.sample))
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
corpus <- tm_map(corpus, toSpace, "(f|ht)tp(s?)://(.*)[.][a-z]+")
corpus <- tm_map(corpus, toSpace, "@[^\\s]+")
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, PlainTextDocument)
unicorpus <- tm_map(corpus, removeWords, stopwords("en"))


# Exploratory Analysis
# we will get the frequencies for each word
getFreq <- function(tdm) {
    freq <- sort(rowSums(as.matrix(tdm)), decreasing = TRUE)
    return(data.frame(word = names(freq), freq = freq))
}

# Prepare n-gram frequencies
getFreq <- function(tdm) {
    freq <- sort(rowSums(as.matrix(rollup(tdm, 2, FUN = sum)), na.rm = T), decreasing = TRUE)
    return(data.frame(word = names(freq), freq = freq))
}
bigram <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
trigram <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))
quadgram <- function(x) NGramTokenizer(x, Weka_control(min = 4, max = 4))
pentagram <- function(x) NGramTokenizer(x, Weka_control(min = 5, max = 5))
hexagram <- function(x) NGramTokenizer(x, Weka_control(min = 6, max = 6))

# Get frequencies of most common n-grams in data sample
freq1 <- getFreq(removeSparseTerms(TermDocumentMatrix(unicorpus), 0.999))
save(freq1, file="nfreq.f1.RData")
freq2 <- getFreq(TermDocumentMatrix(unicorpus, control = list(tokenize = bigram, bounds = list(global = c(5, Inf)))))
save(freq2, file="nfreq.f2.RData")
freq3 <- getFreq(TermDocumentMatrix(corpus, control = list(tokenize = trigram, bounds = list(global = c(3, Inf)))))
save(freq3, file="nfreq.f3.RData")
freq4 <- getFreq(TermDocumentMatrix(corpus, control = list(tokenize = quadgram, bounds = list(global = c(2, Inf)))))
save(freq4, file="nfreq.f4.RData")
freq5 <- getFreq(TermDocumentMatrix(corpus, control = list(tokenize = pentagram, bounds = list(global = c(2, Inf)))))
save(freq5, file="nfreq.f5.RData")
freq6 <- getFreq(TermDocumentMatrix(corpus, control = list(tokenize = hexagram, bounds = list(global = c(2, Inf)))))
save(freq6, file="nfreq.f6.RData")
nf <- list("f1" = freq1, "f2" = freq2, "f3" = freq3, "f4" = freq4, "f5" = freq5, "f6" = freq6)
save(nf, file="nfreq.v5.RData")



