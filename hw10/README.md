# README: Homework 10: Data from the Web

This is the folder for STAT 547M Homework 10. This homework is still based on my research in Oceanography, which are divided into 3 parts.

Part 1: Get weather information of major cities in China using API, and generate an interactive map. [Map is only supported in HTML version.]

Part 2: Get oceanographic data from a single WHOI website and generate plots.

Part 3: Get oceanographic data from a bunch of WHOI websites and generate plots. This work improves my speed of analyzing big data. It will be modified and create a package for my future research later.

[Link to RMD file](https://github.com/yuanjisun/STAT547-hw-Sun-Yuanji/blob/master/hw10/hw10.Rmd)

[Link to MD file](https://github.com/yuanjisun/STAT547-hw-Sun-Yuanji/blob/master/hw10/hw10.md)

[Link to HTML file](https://github.com/yuanjisun/STAT547-hw-Sun-Yuanji/blob/master/hw10/hw10.html)

__Report process__

I ran into and solved the following problems when doing this homework.

1. API key must be put in double quotation mark. Otherwise, the function will not work.
2. The raw weather data of different cities has different lengths, and even for the same city, the data length will change when the data is updated every a few hours. Thus, I selected the most important and common vaiables and created a dataframe.
3. For Part 3, I noticed that the missing value was in `nd` on the website. In order to generate an empty figure if all values are missing, I should use `na.strings = "nd"` and then convert it to numeric form. This is because I cannot use `NA_integer_` or other similar code in `read.table()`.
4. There is a bug of `ggplot()`. In the for loop, I used `ggplot(data=data, mapping=colnames(data)[j], y="depth"))`. Yes, it is right logically but when `j` changes, the previous figure will also be changed. This is because even though the figure is generated and saved in `plot_list`, the figure is still linked with `j` and will change. Thus, in my first trial, all figures were the same except the axis names.

Please note that the 6th to 10th figures are wrong. I do NOT know why this happend. I used the correct functions and all other figures are correct except these five.


__Useful resource__

1. Google
2. Lecture notes
3. R for Data Science

__Acknowlegement__
All oceanography data comes from WHOI website, which is open to public. Weather information is obtained from https://openweathermap.org/api.
