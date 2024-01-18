rm(list=ls())
library(glmnet)
library(mice)
library(dplyr);
library(pROC);
library(ggplot2)
set.seed(1)

load("key_guide.rda")
load("nhanes_key.rda")
load("nhanes_data.rda")



hyper_tension_data <- nhanes_data[nhanes_data$htn_jnc7 == "Yes",]

ggplot(hyper_tension_data, aes(x = svy_year, fill = bp_med_use)) +
  geom_bar(position = "fill") +
  geom_text(
    aes(label=signif(..count.. / tapply(..count.., ..x.., sum)[as.character(..x..)], digits=3)),
    stat="count",
    position=position_fill(vjust=0.5)) +
  theme_classic()
