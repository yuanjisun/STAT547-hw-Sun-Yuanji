# README: Homework 09: Building your own R package

This is the folder for STAT 547M Homework 9. In this homework, I build a package called `marine`, which is used to help marine science researchers analyze CTD data quickly.

This package is based on my real research. After talking to my supervisors, they strongly encourage me to develop and maintain this package and make it available to ocean scientists in the world. Very cool!

[Link to package](https://github.com/yuanjisun/marine)

__Report process__

1. I installed the package by mistake when writing the code. To uninstall it, use `remove.package()`.
2. For `testthat`, I used `expect_identical()`, `expect_error`, `expect_failure()` and `expect_equal()` to make the test. My test is different from other people's because the inputs of my functions have very complex structure, which can hardly be make manually. I finally succeeded in making one sample input to do the test.
3. I added input check for several functions and some defaults are assigned in functions.
4. I figured out how to store data that can be loaded with the package.
5. It is very important to write the README and help file in time. Otherwise I will confuze about what I did.
6. I successfully editted the README, package documentation and vignette. Detailed instructions can be found in README and vignette.
7. Since .cnv file is very unique, I provided two sample files in the package folder. Please download them and test the package.
8. There is no error and all checks are passed.

Useful resource:

1. Google
2. Lecture notes

Acknowlegement: The first step (read .cnv file and form the data structure) is based on a function in the package `oce`. Thanks the author for providing me with a great start.
