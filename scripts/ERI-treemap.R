#libraries
library(tidyverse)
library(treemap)
library(colorspace)
library(tidyr)

# #load 2009-2014 ERI deduplicated publication data (groups and divisions)
data_09 <- read.table("Documents/21_Fall_19/ERI-5-year-review/data/publications/ERI-publications-2009-2014-treemap-deduplicated.csv", header=T, sep=",")
colnames(data_09) <- c("ind", "division", "group", "label", "count")
head(data_09)

# #load 2009-2014 ERI project data (relationship)
# proj_09 <- read.table("Documents/21_Fall_19/ERI-5-year-review/data/publications/ERI-publications-2009-2014-treemap-deduplicated.csv", header=T, sep=",")
# colnames(proj_09) <- c("ind", "division", "group", "label", "count")
# head(proj_09)

# #load 2014-2019 ERI deduplicated data (groups and divisions)
data_14 <- read.table("Documents/21_Fall_19/ERI-5-year-review/data/publications/ERI-publications-2014-2019-treemap-deduplicated.csv", header=T, sep=",")
colnames(data_14) <- c("ind", "division", "group", "label", "count")
head(data_14)

#load difference 2019-2009 ERI deduplicated data (groups and divisions)
data_diff <- read.table("Documents/21_Fall_19/ERI-5-year-review/data/publications/ERI-publications-2019-2009-difference-treemap-deduplicated-V2.csv", header=T, sep=",")
colnames(data_diff) <- c("ind", "division", "group", "label", "count_14_19", "count_09_14", "difference", "norm_09_14", "norm_14_19", "norm_diff")
head(data_diff)

# set standard hex symbology (qualitative) for treemaps (based on divisions)
(tmColors <-
    with(data_14,
         data.frame(division = levels(division),
                    color = I(qualitative_hcl(nlevels(division),palette = "Cold")))))
#tmColors

data.frame(subset(data_09, select = c(group, division)),
           matchRetVal = match(data_09$division, tmColors$division))

tmDatColor <- merge(tmColors,data_09)
#tmDatColor
# 
# plot treemap (showing just one review period)
#palette.HCL.options <- list(hue_start=120, hue_end=240)
pal <- choose_palette()
p <- treemap(data_14, #tmDatColor,

             # data
             index=c("division", "group"),
             vSize="count",
             vColor ="division",
             type="categorical",
             aspRatio = 1,
             palette = rainbow_hcl(20),
             #palette = qualitative_hcl(20, palette = "Cold"),
             #palette.HCL.options=palette.HCL.options,
             # palette=tmColors$color[match(data_14$division, tmColors$division)],
             # range = c(0,2000),
             # mapping = c(0,1000,2000),
             sortID = "-size",
             #algorithm = "pivotSize",

             # main
             title="ERI: Fields of Research (2014-2019)",
             fontsize.title = 22,

             # borders
             border.col=c("grey", "white"),
             border.lwds=c(1,0.5),

             # labels
             fontsize.labels=c(0, 0),
             fontcolor.labels=c("white", "white"),
             fontface.labels=1,
             bg.labels=c("transparent"),
             align.labels=list( c("center", "center"), c("left", "top"), c("right", "bottom")),
             overlap.labels=0.5, inflate.labels=T,

             # legend
             title.legend="Field of Research (division)",
             fontsize.legend = 10,
             position.legend = "none",
             format.legend = NULL,
             drop.unused.levels = TRUE
)
 
# plot treemap (showing normalized difference between 2014-2019 and 2009-1014)
p <- treemap(data_diff,

             # data
             index=c("division", "group"),
             vSize="count_14_19",
             vColor ="norm_diff",
             type="value",
             aspRatio = 1,
             #palette = "RdYlBu",
             palette = diverging_hcl(20, "Blue-Red-3"),
             # palette=tmColors$color[match(data_14$division, tmColors$division)],
             # range = c(0,2000),
             # mapping = c(0,1000,2000),
             sortID = "-size",
             #algorithm = "pivotSize",

             # main
             title="ERI: Change in Fields of Research (2014-2019)",
             fontsize.title = 22,

             # borders
             border.col=c("grey", "grey"),
             border.lwds=c(1,0.5),

             # labels
             fontsize.labels=c(0, 0),
             fontcolor.labels=c("white", "black"),
             fontface.labels=1,
             bg.labels=c("transparent"),
             align.labels=list( c("center", "center"), c("left", "top"), c("right", "bottom")),
             overlap.labels=0.5, inflate.labels=T,

             # legend
             title.legend="Difference between 2014-2019 and 2009-2014 fields of research (normalized by publication count)",
             fontsize.legend = 10,
             # position.legend = "right",
             format.legend = NULL,
             drop.unused.levels = TRUE
)
