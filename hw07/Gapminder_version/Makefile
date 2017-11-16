all: Report.md

clean:
	del -f gapminder.tsv GDP_per_Capita_Continent.png Min_Max_GDP_per_Capita_year.png exploratory_analyses.tsv mean_lifeExp_continent.png Africa.png Asia.png Americas.png Europe.png Oceania.png Africa.tsv Asia.tsv Americas.tsv Europe.tsv Oceania.tsv model_result.tsv

gapminder.tsv:
	Rscript -e 'download.file("https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv", destfile="gapminder.tsv")'

exploratory_analyses.tsv: exploratory_analyses.r gapminder.tsv
	Rscript $<
	del -f Rplots.pdf

%.tsv: statistical_analyses.r exploratory_analyses.tsv
	Rscript $<

%.png: generate_figures.r exploratory_analyses.tsv %.tsv
	Rscript $<

Report.md: report.RMD %.tsv %.png
	Rscript -e 'rmarkdown::render("$<")'
