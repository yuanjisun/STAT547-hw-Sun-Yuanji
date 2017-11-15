all: report.md

clean:
	del -f CTD.cnv Summary.jpg ctd_data.RData Pressure_Scan.jpg Density_Pressure.jpg

CTD.cnv:
	Rscript -e 'download.file("https://www.eoas.ubc.ca/~rich/Bamfield/archive/bamfield01/cnv/bam01001.cnv", destfile="CTD.cnv")'

ctd_data.RData: step_1.r CTD.cnv
	Rscript $<

%.jpg: step_2.r ctd_data.RData
	Rscript $<

report.md: report.rmd Summary.jpg Density_Pressure.jpg Pressure_Scan.jpg
	Rscript -e 'rmarkdown::render("$<")'


