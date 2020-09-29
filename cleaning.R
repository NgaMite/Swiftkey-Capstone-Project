library(tm)

blogs <- readLines("./final/en_US/en_US.blogs.txt")
news <- readLines("./final/en_US/en_US.news.txt")
twitter <- readLines("./final/en_US/en_US.twitter.txt")

blog.sample <- sample(blogs,10000)
news.sample <- sample(news,10000)
twitter.sample <- sample(twitter,10000)

##Create corpus
sampledata <- c(blog.sample,news.sample,twitter.sample)
writeLines(sampledata,"output/sampledata.txt")
sample_data <- readLines("./output/sampledata.txt")

##Cleaning the Data
sample_data <- removePunctuation(sample_data)
sample_data <- tolower(sample_data)
sample_data <- removeNumbers(sample_data)
sample_data <- stemDocument(sample_data)
sample_data <- removeWords(sample_data, c('the', stopwords("english")))
sample_data <- stripWhitespace(sample_data)

##Tokenization
sample_data <- paste0(unlist(sample_data), collapse=" ")
sample_data <- strsplit(sample_data, " ", fixed=TRUE)[[1L]]
sample_data <- sample_data[sample_data != ""]