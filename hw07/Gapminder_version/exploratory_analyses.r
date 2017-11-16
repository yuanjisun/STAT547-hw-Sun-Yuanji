# Load libraries
library(tidyverse)
library(reshape2)
library(knitr)

# Bring the data in as data frame (read_tsv)
data <- read.table(file="gapminder.tsv", sep="\t", skip = 1,
		   col.names=c("country", "continent", "year", "lifeExp", "pop", "gdpPercap"))

# Save a couple descriptive plots to file with highly informative names
Min_Max_GDP_per_Capita_year <- data %>%
	group_by(continent, year) %>%
	summarize(minGPDpercap=min(gdpPercap), maxGPDpercap=max(gdpPercap)) %>%
	melt(measure.vars=c("minGPDpercap","maxGPDpercap")) %>%
	ggplot(aes(x=continent, y=value)) +
	facet_wrap(~ year) +
	geom_bar(aes(fill=variable),stat='identity', position='dodge') +
	labs(x="Continent",y="GDP per Capita", title="Min/Max GDP per Capita over Years") +
	theme(plot.title = element_text(hjust=0.5), axis.text.x = element_text(angle = 45))
ggsave("Min_Max_GDP_per_Capita_year.png")

GDP_per_Capita_Continent <- data %>%
	ggplot(aes(x = factor(year), y = gdpPercap)) +
	scale_y_log10() +
	geom_boxplot() +
	facet_wrap(~ continent) +
	labs(x="Year", y="GDP per Capita", title="Spread of GDP per Capita within Continents") +
	theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45))
ggsave("GDP_per_Capita_Continent.png")

# Reorder the continents based on average life expectancy and plot
mlec <- data %>%
	group_by(continent) %>%
	summarise(mean_lifeExp = mean(lifeExp)) %>%
	mutate(continent = fct_reorder(continent, mean_lifeExp, .desc = FALSE))

mlec %>%
	ggplot() +
	aes(x = continent, y = mean_lifeExp) +
	geom_point() +
	labs(x="Continent", y="Average Life Expectancy", title="Average Life Expectancy of Each Continent") 
ggsave("mean_lifeExp_continent.png")

# Sort the actual data in a deliberate fashion. This should at least implement your new continent ordering.
data_sorted <- data %>%
	group_by(continent) %>%
	mutate(mean_lifeExp = mean(lifeExp)) %>%
	arrange(mean_lifeExp, country)

fct_reorder(data_sorted$continent, data_sorted$mean_lifeExp, .desc = FALSE)

data_sorted$mean_lifeExp <- NULL # Remove mean_lifeExp

# Write the Gapminder data to file(s), for immediate and future reuse
write.table(data_sorted, "exploratory_analyses.tsv",
	    sep = "\t", row.names = FALSE, quote = FALSE)
