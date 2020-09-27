library(tidyr)
library(dplyr)
library(utils)

## Download the data and extract it
data_url <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
zip_name <- "Coursera-SwiftKey.zip"
download.file(data_url, method="curl", destfile=zip_name)

unzip(zip_name, exdir="./data")

path_to_blogs <- "./data/final/en_US/en_US.blogs.txt"
path_to_news <- "./data/final/en_US/en_US.news.txt"
path_to_twitter <- "./data/final/en_US/en_US.twitter.txt"

#con <- file(path_to_twitter, "r") 
#readLines(con, 1) ## Read the first line of text 
#readLines(con, 1) ## Read the next line of text 
#readLines(con, 5) ## Read in the next 5 lines of text 
#close(con) 

file.remove(zip_name)

# Q1: The en_US.blogs.txt, file is how many megabytes?
# A1: ls -alh in the \verb|Coursera-Swiftkey/final/en_US|Coursera-Swiftkey/final/en_US
#
# Q2: The en_US.twitter.txt has how many lines of text?
# A2: wc -l en_US.twitter.txt in bash        # or 
#     length(readLines("en_US.twitter.txt")) # in R
#
# Q3: What is the length of the longest line seen in any of the three en_US data sets?
# A3: wc -L *.txt  # in the directory with the three files
#     Get length of longest line with bash:
#     awk '{ if (length($0) > max) {max = length($0); maxline = $0} } END { print maxline }' YOURFILE | wc -c
#
# Q4: In the en_US twitter data set, if you divide the number of lines where the 
#     word "love" (all lowercase) occurs by the number of lines the word "hate" 
#     (all lowercase) occurs, about what do you get?
# A4: grep "love" en_US.twitter wc −l 
#     grep "hate" en_US.twitter wc −l
#     and divide them with bc or do the following:
#     love=$(grep "love" en_US.twitter.txt  wc−l)  # then
#     hate=$(grep "hate" en_US.twitter.txt  wc−l)  # then
#     let m=love/hate # then
#     echo $m 
# 
# Q5: The one tweet in the en_US twitter data set that matches the word "biostats" says what?
# A5: grep -i "biostat" en_US.twitter.txt 
# 
# Q6: How many tweets have the exact characters "A computer once beat me at 
#     chess, but it was no match for me at kickboxing". (I.e. the line matches 
#     those characters exactly.)
# A6: grep -x "A computer once beat me at chess, but it was no match for me at kickboxing" en_US.twitter.txt wc −l
#



