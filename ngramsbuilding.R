##This part should be done after running the "cleaning.R" file first"

##unigram

one_grams <- as.data.frame(sample_data)
one_grams <- sort(table(one_grams), decreasing = T)
saveRDS(one_grams, file = "output/onegrams.RDS")

##bigram

bigrams <- vapply(ngrams(sample_data, 2L), paste, "", collapse=" ")
two_grams <- as.data.frame(bigrams)
two_grams <- sort(table(two_grams), decreasing = T)
saveRDS(two_grams, file = "output/twograms.RDS")

##trigram

trigrams <- vapply(ngrams(sample_data, 3L), paste, "", collapse=" ")
three_grams <- as.data.frame(trigrams)
three_grams <- sort(table(trigrams), decreasing = T)
saveRDS(three_grams, file = "output/threegrams.RDS")

##Combine
unigrams <- read.csv("output/onegrams.csv", stringsAsFactors = FALSE)
bigrams <- read.csv("output/twograms.csv", stringsAsFactors = FALSE)
trigrams <- read.csv("output/threegrams.csv", stringsAsFactors = FALSE)
modelslist = list(trigrams,bigrams,unigrams)
saveRDS(modelslist, file = "output/modelslist.RDS")