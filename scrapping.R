# Alfredo Madrid García
library(rvest)

url <- read.table("url.txt", sep = "\t", quote = "")
url <- as.data.frame(row.names(url))
url <- as.data.frame(url[2:nrow(url),])

for(i in 1:nrow(url)){
  html <- read_html(url[i,])
  x <- html %>% 
    html_node("table") %>% 
    html_table() %>%
    dplyr::filter(!is.na(X2))
  x <- x[4:ncol(x),1:2]
  write.table(x, file =paste0(i, ".txt"))
}


