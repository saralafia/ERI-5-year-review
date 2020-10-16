#libraries
library(plyr)
library(ggplot2)
library(reshape2)
library(grid)
library(gridExtra)

# read in csv of divisions (includes 09-14 & 14-19)
divisions <- read.table("Documents/21_Fall_19/ERI-5-year-review/data/publications/ERI-publications-signatures-divisions.csv", header=T, sep=",")
colnames(divisions) <- c("code", "division", "count_09_14", "count_14_19", "norm_09_14", "norm_14_19")
head(divisions)

# division charts (bar and line plots)
p_bar <-ggplot(divisions, aes(x=code, y=count_09_14, fill=code)) + 
  geom_bar(stat="identity", color="grey", width = 0.7) + 
  geom_text(aes(label=code), vjust=1.6, color="black",
            position = position_dodge(0.9), size=3.5)
p_bar+scale_fill_gradientn(colors = rainbow(22)) + 
  labs(title="2009-2014 FOR Codes", 
       x ="Field of Research Code", 
       y ="Publication Count") + theme(axis.text.x = element_blank())

p_lin <-ggplot(divisions, aes(x=code, y=count_09_14, color=code)) +
  geom_line()
p_lin + scale_color_gradientn(colors = rainbow(22)) + 
  labs(title="2009-2014 FOR Codes", 
       x ="Field of Research Code", 
       y ="Publication Count")

c_bar <-ggplot(divisions, aes(x=code, y=count_14_19, fill=code)) + 
  geom_bar(stat="identity", color="grey", width = 0.7) + 
  geom_text(aes(label=code), vjust=1.6, color="black",
            position = position_dodge(0.9), size=3.5)
c_bar+scale_fill_gradientn(colors = rainbow(22)) + 
  labs(title="2014-2019 FOR Codes", 
       x ="Field of Research Code", 
       y ="Publication Count") + theme(axis.text.x = element_blank())

c_lin <-ggplot(divisions, aes(x=code, y=count_14_19, color=code)) +
  geom_line()
c_lin + scale_color_gradientn(colors = rainbow(22)) + 
  labs(title="2014-2019 FOR Codes", 
       x ="Field of Research Code", 
       y ="Publication Count")

# 4 figures arranged in 2 rows and 2 columns
grid.arrange(p_bar, c_bar, p_lin, c_lin)
