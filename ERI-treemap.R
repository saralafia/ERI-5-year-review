#libraries
library(tidyverse)
library(treemap)

#load dataset (Kelly Caylor FOR groups and divisions from all publications)
#data <- read.table("Documents/21_Fall_19/ERI-5-year-review/publications/ERI-publications-Caylor-treemap.csv", header=T, sep=",")
#colnames(data) <- c("ind", "division", "group", "label", "count")
#head(data)

#load dataset (all of ERI groups and divisions from all publications)
data <- read.table("Documents/21_Fall_19/ERI-5-year-review/publications/ERI-publications-treemap.csv", header=T, sep=",")
colnames(data) <- c("ind", "division", "group", "label", "count")
head(data)

# plot
p <- treemap(data,
             
             # data
             index=c("division", "group"),
             vSize="count",
             type="index",
             
             # Main
             title="",
             palette="Dark2",
             
             # Borders:
             border.col=c("black", "grey"),             
             border.lwds=c(1,0.5),                         
             
             # Labels
             fontsize.labels=c(0.6, 0.5),
             fontcolor.labels=c("white", "white"),
             fontface.labels=1,            
             bg.labels=c("transparent"),              
             align.labels=list( c("center", "center"), c("left", "top"), c("right", "bottom")),                                  
             overlap.labels=0.5, inflate.labels=T  
)
