#libraries
library(tidyverse)
library(treemap)
library(colorspace)

# TO DO deduplicate groups where divisions are also assigned
#load 2009-2014 ERI data (groups and divisions)
# data <- read.table("Documents/21_Fall_19/ERI-5-year-review/data/publications/ERI-publications-2009-2014-treemap.csv", header=T, sep=",")
# colnames(data) <- c("ind", "division", "group", "label", "count")
# #head(data)

#load 2014-2019 ERI data (groups and divisions)
data <- read.table("Documents/21_Fall_19/ERI-5-year-review/data/publications/ERI-publications-2014-2019-treemap.csv", header=T, sep=",")
colnames(data) <- c("ind", "division", "group", "label", "count")
#head(data)

#load 2009-2014 PI data (groups and divisions)
# data <- read.table("Documents/21_Fall_19/ERI-5-year-review/data/publications/ERI-publications-Siegel-2009-2014-treemap.csv", header=T, sep=",")
# colnames(data) <- c("ind", "division", "group", "label", "count")
#head(data)

#load 2014-2019 PI data (groups and divisions)
# data <- read.table("Documents/21_Fall_19/ERI-5-year-review/data/publications/ERI-publications-Siegel-2014-2019-treemap.csv", header=T, sep=",")
# colnames(data) <- c("ind", "division", "group", "label", "count")
#head(data)

# set hex symbology for all treemaps (qualitative, 22 divisions)
# TO DO standardize symbology across treemaps (e.g. 04 orange in any map)
#pal <- qualitative_hcl(21)
(jColors <-
    with(data,
         data.frame(division = levels(division),
                    color = I(qualitative_hcl(nlevels(division))))))

data.frame(subset(data, select = c(group, division)),
           matchRetVal = match(data$group, data$group))

# plot treemap
p <- treemap(data,

             # data
             index=c("division", "group"),
             vSize="count",
             # vColor = "label",
             type="index",
             # palette = pal,
             # range = c(0,2000),
             # mapping = c(0,1000,2000),
             # aspRatio = 1,
             # sortID = "ind",
             # algorithm = "squarified",

             # main
             title="ERI: Fields of Research (2014-2019)",
             fontsize.title = 22,
             palette=jColors$color[match(data$group, jColors$group)],

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
             title.legend="Field of Research (division)",
             fontsize.legend = 10,
             position.legend = "right",
             format.legend = NULL,
             #drop.unused.levels = TRUE
)
