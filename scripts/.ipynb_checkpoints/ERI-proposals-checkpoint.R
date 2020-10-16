library(ggplot2)
library(treemap)
#library(ggdendro)

#funded_14 <- read.table("Documents/21_Fall_19/ERI-5-year-review/data/projects/ERI-funded-2014-2019-bar.csv", header=T, sep=",")
#colnames(funded_14) <- c("ind", "amount", "agency", "relationship", "id", "startYr", "endYr")
#head(funded_14)
#tail(funded_14)

# histogram, stacked bar, tree map data
test <- read.csv("Documents/21_Fall_19/ERI-5-year-review/data/projects/ERI-all-projects-2014-2019Updated.csv")
head(test)

# tree map difference data
data_diff <- read.table("Documents/21_Fall_19/ERI-5-year-review/data/projects/ERI-projects-all-sum-count.csv", header=T, sep=",")
colnames(data_diff) <- c("ind", "relationship", "agency", "count_14", "sum_14", "count_09", "sum_09", "count_norm", "sum_norm", "count_diff", "sum_diff")
head(data_diff)

#options(scipen=1000)
#YR <- 2007:2019
#A <- runif(2019,1,100)
#df <- data.frame(YR,A)

#histogram of combined data (funded | unfunded)
qplot(test$start, geom="histogram", binwidth=1,main="ERI Funded Projects (2009-2019)",xlab="Start (Year)", ylab="Count (Proposals)",fill=I("black"),col=I("grey"))

#stacked bar
ggplot(data = test, aes(x = start, y = amount, fill = relationship)) + scale_y_continuous(labels = scales::comma) +
  geom_bar(stat="identity")+ labs(title = "ERI: funded projects (2014-2018)", 
                                  y = "Funding Amount", x = "Reporting Years", fill = "Funding type") + scale_fill_brewer(palette = "Dark2")

#dendrogram
#theme_set(theme_bw())
#hc <- hclust(dist(test), "ave")  # hierarchical clustering
#ggdendrogram(hc, rotate = TRUE, size = 2)

#create a new label field combining agency and amount 
# test$label <- paste(test$agency, test$amount, sep = ", ")
# head(test)

#tree map
p <- treemap(test,

             # data
             index=c("relationship", "agency"),
             vSize="amount",
             vColor ="relationship",
             type="categorical",
             aspRatio = 1,
             palette="Set2",
             # range = c(0,2000),
             # mapping = c(0,1000,2000),
             # sortID = "ind",
             # algorithm = "squarified",

             # main
             title="ERI: funded projects (2014-2019)",
             fontsize.title = 22,

             # borders
             border.col=c("grey", "white"),
             border.lwds=c(1,0.5),

             # labels
             fontsize.labels=c(0, 0.9),
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

# plot treemap showing normalized difference (count | sum) between 2014-2019 and 2009-1014)
p <- treemap(data_diff,
             
             # data
             index=c("relationship", "agency"),
             vSize="sum_14",
             vColor ="sum_diff",
             type="value",
             aspRatio = 1,
             palette = "RdYlGn",
             # palette=tmColors$color[match(data_14$division, tmColors$division)],
             # range = c(0,2000),
             # mapping = c(0,1000,2000),
             # sortID = "ind",
             # algorithm = "squarified",
             
             # main
             title="ERI: Change in Project Funding Sources (2014-2019)",
             fontsize.title = 22,
             
             # borders
             border.col=c("grey", "grey"),
             border.lwds=c(1,0.5),
             
             # labels
             fontsize.labels=c(0, 0.6),
             fontcolor.labels=c("white", "black"),
             fontface.labels=1,
             bg.labels=c("transparent"),
             align.labels=list( c("center", "center"), c("left", "top"), c("right", "bottom")),
             overlap.labels=0.5, inflate.labels=T,
             
             # legend
             title.legend="Difference between 2014-2019 and 2009-2014 project funding (normalized by project dollar amount)",
             fontsize.legend = 10,
             # position.legend = "right",
             format.legend = NULL,
             drop.unused.levels = TRUE
)
