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
library(broom)

# Import the data created in the first script
data_sorted <- read.table(file="exploratory_analyses.tsv", sep="\t", skip = 1,
		   col.names=c("country", "continent", "year", "lifeExp", "pop", "gdpPercap"))

# Make sure your new continent order is still in force
levels(data_sorted$continent) # Still in the new order

# Fit a linear regression of life expectancy on year within each country. Write the estimated intercepts, slopes, and residual error variance (or sd) to file. The R package broom may be useful here.
data_nested <- data_sorted %>% 
	group_by(continent, country) %>% 
	nest()

my_function <- function(data_input, offset=1952) {lm(lifeExp ~ I(year-offset), data = data_input)}

model_result <- data_nested %>% 
	mutate(fit = map(data, my_function),
	       tidy = map(fit, tidy)) %>% 
	select(continent, country, tidy) %>% 
	unnest(tidy) %>%
	mutate(term = recode(term,
		`(Intercept)` = "intercept",
		`I(year)` = "slope"))

write.table(model_result, "model_result.tsv",
	    sep = "\t", row.names = FALSE, quote = FALSE)

# Find the 3 or 4 “worst” and “best” countries for each continent
rank_result <- function(continent_input){
	ranking <- model_result %>%
		filter(continent == continent_input) %>%
		filter(term == "intercept") %>%
		arrange(estimate) %>%
		select(country, estimate)
	filename=paste(continent_input, ".tsv", sep = "")
	write.table(ranking, filename, sep = "\t", row.names = FALSE, quote = FALSE)
}

rank_result("Africa")
rank_result("Americas")
rank_result("Asia")
rank_result("Europe")
rank_result("Oceania")






