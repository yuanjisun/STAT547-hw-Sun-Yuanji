# Load libraries
library(broom)
library(magrittr)
library(tidyverse)
library(stringr)
library(ggmap)
library(purrr)
library(repurrrsive)
library(ggplot2)
library(dplyr)

# Import the data created in the first script
data_sorted <- read.table(file="exploratory_analyses.tsv", sep="\t", skip = 1,
			  col.names=c("country", "continent", "year", "lifeExp", "pop", "gdpPercap"))

# 
plot_fun <- function(continent_input){
	pic <- data_sorted %>%
		filter(continent==continent_input) %>%
		group_by(country) %>%
		ggplot(aes(x=year, y=lifeExp)) +
		geom_point() +
		geom_smooth(method="lm", se=FALSE) +
		facet_wrap(~ country) +
		labs(x="Year",y="Life Expectancy", title=paste("Life Expectancy over Year in",
			continent_input)) +
		theme(plot.title = element_text(hjust=0.5), axis.text.x = element_text(angle = 45))
	filename=paste(continent_input, ".png", sep = "")
	ggsave(filename)
}

plot_fun("Africa")
plot_fun("Asia")
plot_fun("Americas")
plot_fun("Europe")
plot_fun("Oceania")
