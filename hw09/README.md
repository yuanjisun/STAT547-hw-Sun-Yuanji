# README: Homework 09: Building your own R package

This is the folder for STAT 547M Homework 9. In this homework, I build a package called `marine`, which is used to help marine science researchers analyze CTD data quickly.

[Link to package](https://yuanjisun.shinyapps.io/CTD_app/)

__Report process__

1. I installed the package by mistake when writing the code. To uninstall it, use `remove.package()`.
2. For testthat, (1) I cannot test the function `raw_data` since it reads the .cnv file and I cannot compare the result with another result. However, I added an if-else statement in the function which provides a file format check to ensure it works properly. (2) All other tests are based on the input data, which is a very complex nested format (extremely complex). Thus, I cannot test it by creating an artifical input and compare the results. However, I used another way to do that. See below. (3) For GPS, since the data will be converted to numeric format instead of 121.11W, 48.33N, the `GPS_test_2` is used to test whether this conversion is correct or not. `GPS_test_1` is the result displayed in the console. It is used to see the accuracy of the result (there is slight difference).(4) For U-238, the test is to check whether the correct method is used or not. (5) For compensation depth, since it is quite easy to get the wrong depth by adding/minusing 1 meter, the test is to see whether the result is exactly 32 meters (based on the pre-loaded data and I know the accurate result, 32 m). Thus, 31 m and 33 m are used in the test. __All tests are based on the pro-loaded data and I cannot construct such a complex data input.__
3. I figured out how to store data that can be loaded with the package.
4. It is very important to write the README and help file in time. Otherwise I will confuze about what I did.
