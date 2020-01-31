library(ggplot2)
library(treemap)
#library(ggdendro)

#funded_14 <- read.table("Documents/21_Fall_19/ERI-5-year-review/data/projects/ERI-funded-2014-2019-bar.csv", header=T, sep=",")
#colnames(funded_14) <- c("ind", "amount", "agency", "relationship", "id", "startYr", "endYr")
#head(funded_14)
#tail(funded_14)

test <- read.delim("Documents/21_Fall_19/ERI-5-year-review/data/projects/test.txt")
head(test)

#options(scipen=1000)
#YR <- 2007:2019
#A <- runif(2019,1,100)
#df <- data.frame(YR,A)

#stacked bar
ggplot(data = test, aes(x = start, y = amount, fill = relationship)) + scale_y_continuous(labels = scales::comma) +
  geom_bar(stat="identity")+ labs(title = "ERI: unfunded projects (2009-2014)", 
                                  y = "Funding Amount", x = "Start Year", fill = "Funding type") + scale_fill_brewer(palette = "Dark2")

#dendrogram
#theme_set(theme_bw())
#hc <- hclust(dist(test), "ave")  # hierarchical clustering
#ggdendrogram(hc, rotate = TRUE, size = 2)

#tree map
p <- treemap(test,

             # data
             index=c("relationship", "agency"),
             vSize="amount",
             vColor ="relationship",
             type="categorical",
             aspRatio = 1,
             palette="Dark2",
             # range = c(0,2000),
             # mapping = c(0,1000,2000),
             # sortID = "ind",
             # algorithm = "squarified",

             # main
             title="ERI: unfunded projects (2009-2014)",
             fontsize.title = 22,

             # borders
             border.col=c("grey", "grey"),
             border.lwds=c(1,0.5),

             # labels
             fontsize.labels=c(0, 0.6),
             fontcolor.labels=c("white", "white"),
             fontface.labels=1,
             bg.labels=c("transparent"),
             align.labels=list( c("center", "center"), c("left", "top"), c("right", "bottom")),
             overlap.labels=0.5, inflate.labels=T,

             # legend
             title.legend="Funding agency",
             fontsize.legend = 10,
             # position.legend = "right",
             format.legend = NULL,
             drop.unused.levels = TRUE
)
