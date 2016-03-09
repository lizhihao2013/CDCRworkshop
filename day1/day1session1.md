
# Day1 Session 1
---

### Goals for Session 1

* Quick introduction to Git and Github
* Quick overview of R, RStudio, how to install and get started
* Getting acquainted with R and the RStudio interface
* Using R codes to do math and run calculations
* Looking up the named constants in R and getting help
* Create different kinds of data objects in R
* Using commands and the Global Environment to understand the data object types and classes and structure
* Create lists and data frames built from other objects

---

## Explore RStudio
1. Open/Run RStudio
2. Explore the windows and menus
3. See what your settings are in "Tools"/"Global Options"
   + change your "Appearance" to a font size and theme you like
   + take a look at the other options but leave the defaults for now
4. Create a New File - go to "File"/"New File"/"R Script"
    + This will create a new (blank) window at the top left where you can type in an execute R commands. This is similar to the SAS program window.
    + As you type in commands you can select the command (or commands) you want to execute and click "Run" or go to the end of the line and hit "Cntl-Enter".
    + You can also execute commands in the Console window (lower left) but this is like typing commands in at the command line and harder to enter longer commands and edit as needed.
    + However as you run commands from the R Script window, they are echo'd in the Console window. And output is also shown in the console window as appropriate.
    
## Begin writing code in your new script window.

Now that you have your R Script window open, go ahead and save it somewhere on your computer/local storage location (e.g. flash drive, cloud or network drive). Click "File"/"Save As"/ and enter in a name for your file "myfile.r". If you leave off the ".r" extension, it should be added automatically for you. Open your local drive and check to make sure the file saved correctly.

As you enter code, it is always a good idea to add informative comments as you go. The number sign `#` is the delimiter R uses to denote comments. Anything typed after the `#` is echo'd to the screen and not executed. You'll also notice that the R scripting window inside RStudio tries to be helpful by color coding different commands, functions, variables and such so you notice each is handled differently. The comments will be a different color than commands R is trying to execute as code.

Let's try the following code `getwd()` to see what R thinks is your current "home" directory.

```
# ======================================
# see what directory R is currently set to
getwd()

# ======================================
# change your "working directory"
# to a location of your choice
setwd('C:/MyGithub/CDCRworkshopCode')

# ======================================
# check location again
getwd()
```
## Typing in commands - do simple math

Let's type in the following commands and do some math using R. 

You will notice there are 2 ways to enter an exponent: (1) you can use 2 asterix `**` together or (2) you can use the caret `^` symbol.


```r
2 + 2
```

```
## [1] 4
```

```r
3 + (4*8)
```

```
## [1] 35
```

```r
3 + 4*8
```

```
## [1] 35
```

```r
6 + (8**2) # exponents can be done using two
```

```
## [1] 70
```

```r
           # asterix's ** or you can use
           # the caret ^ symbol
12^2
```

```
## [1] 144
```

We can also put in named constants like `pi` and have R retrieve the actual stored value (at least to the numerical precision available).


```r
pi         # pi is a built in Constant
```

```
## [1] 3.141593
```

```r
4 * pi
```

```
## [1] 12.56637
```

`pi` is a constant built into R. Let's find out what the other constants that are in the base R package? For this we will invoke the `help()` function.


```r
help(Constants)

LETTERS
```

```
##  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q"
## [18] "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
```

```r
letters
```

```
##  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q"
## [18] "r" "s" "t" "u" "v" "w" "x" "y" "z"
```

```r
month.abb
```

```
##  [1] "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov"
## [12] "Dec"
```

```r
month.name
```

```
##  [1] "January"   "February"  "March"     "April"     "May"      
##  [6] "June"      "July"      "August"    "September" "October"  
## [11] "November"  "December"
```

## Let's create some data objects and variables with R: numbers and vectors

In the code block below we will create several new data objects in R. As these variables are created notice that the objects are shown and catalogued in the "Global Environment" window (top right).


```r
# ====================================
# create x which had 1 numeric value
x <- 3 * 5    # notice nothing is shown in the console
              # you have to type the name of the object 
              # to "see" it
x
```

```
## [1] 15
```

```r
# create y which is a numeric (integer) vector
# with 12 elements
y <- 1:12
y
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12
```

```r
# create z a numeric vector
# containing a sequence of numbers from
# 0 to 10 in units of 0.5
z <- seq(0,10,.5)
z
```

```
##  [1]  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5
## [15]  7.0  7.5  8.0  8.5  9.0  9.5 10.0
```

```r
# the above code can also be done with the
# explict function arguments defined
# see the examples in help(seq)
help(seq)
z <- seq(from=0, to=10, by=0.5)
z
```

```
##  [1]  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5
## [15]  7.0  7.5  8.0  8.5  9.0  9.5 10.0
```

```r
# create new object sinz which is a numeric
# vector now containing the sin (sine function) 
# of the z values
sinz <- sin(z)
```

In addition to reviewing the objects listed in the "Global Environment" window (top right), you can also "list" the objects by running the `ls()` command. You can also get detailed listing using the `ls.str()` command which lists with the object structure details as well. This basically mimics what is provided in the "Global Environment" window. _You can ignore the `bib` object which is created as part of this Gitbook._


```r
ls()
```

```
## [1] "bib"  "sinz" "x"    "y"    "z"
```

```r
ls.str()
```

```
## bib : List of 4
##  $ xie2016knitr              :Classes 'BibEntry', 'bibentry'  hidden list of 1
##  $ boettiger2015knitcitations:Classes 'BibEntry', 'bibentry'  hidden list of 1
##  $ wickham2016devtools       :Classes 'BibEntry', 'bibentry'  hidden list of 1
##  $ 2014gitbook               :Classes 'BibEntry', 'bibentry'  hidden list of 1
## sinz :  num [1:21] 0 0.479 0.841 0.997 0.909 ...
## x :  num 15
## y :  int [1:12] 1 2 3 4 5 6 7 8 9 10 ...
## z :  num [1:21] 0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 ...
```

## Get details on your data objects.

Depending on the data objects you can get additional info from the command line which is helpful especially later on when wanting to know things like the number of variables or columns in a dataset or how many rows meet certain criteria and so on. In the commands below we will explore these commands:
*`length()` - provides the number of elements in a vector
* `str()` - described the structure of a data object
* `class()` - describes the attribute of an object (useful for debugging common errors)
* `dim()` - tells the dimension of a given object (usually a 2D matrix or data frame - gives the number of rows by number of columns)


```r
# ========================================
# while you can see information about each of these
# objects in the Global Environment (top right)
# of the RStudio window, the function length()
# is useful for determining how many elements are
# in a given vector/data object.
# ========================================
length(x)
```

```
## [1] 1
```

```r
length(y)
```

```
## [1] 12
```

```r
length(z)
```

```
## [1] 21
```

```r
length(sinz)
```

```
## [1] 21
```

```r
# ========================================
# other functions that are helpful for finding
# out about data objects is the str() "structure"
# function and the class() function.
# ========================================
str(y)
```

```
##  int [1:12] 1 2 3 4 5 6 7 8 9 10 ...
```

```r
class(y)
```

```
## [1] "integer"
```

```r
str(z)
```

```
##  num [1:21] 0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 ...
```

```r
class(z)
```

```
## [1] "numeric"
```

## Create some more data objects including matrices and data frames

Let's make some different "classes" of vectors and see what happens when we mix different kinds of data inside a vector. We will use the "combine" or `c()` function to create these simple elements.

The first 3 vectors each have elements that are all the same type (or class). But then we'll mix and match the data element types and see what happens.

* a1 is numeric
* a2 is character
* a3 is logical
* a4 is mixed numeric, character and logical
    + so R sets all to the best option so a4 becomes all character type
* a5 is also mixed but only numeric and logical
    + In this case, the logical values are converted to numeric and TRUE becomes 1 and FALSE becomes 0
    
We use the `class()` function to investigate further.
 

```r
a1 <- c(1,2,3,4,10,11)
a1
```

```
## [1]  1  2  3  4 10 11
```

```r
a2 <- c('a','g','f','r','t','s')
a2
```

```
## [1] "a" "g" "f" "r" "t" "s"
```

```r
a3 <- c(TRUE,FALSE,TRUE,TRUE,FALSE,TRUE)
a3
```

```
## [1]  TRUE FALSE  TRUE  TRUE FALSE  TRUE
```

```r
a4 <- c(1,2,'a','b',TRUE,FALSE)
a4
```

```
## [1] "1"     "2"     "a"     "b"     "TRUE"  "FALSE"
```

```r
a5 <- c(1,2,3,4,TRUE,FALSE)
a5
```

```
## [1] 1 2 3 4 1 0
```

```r
# use the class() function to investigate these further
class(a1)
```

```
## [1] "numeric"
```

```r
class(a2)
```

```
## [1] "character"
```

```r
class(a3)
```

```
## [1] "logical"
```

```r
class(a4)
```

```
## [1] "character"
```

```r
class(a5)
```

```
## [1] "numeric"
```

## Combine these vectors into different objects
### 2D Arrays or Matrices

We can use the commands `cbind()` to bind (or combine) vectors together columnwise and `rbind` to bind vectors together by or as rows. However, the resulting data object is a matrix (which is a 2D vector) and like a 1D vector the data elements all have to be of the same type (or class). So notice what happens when we combine these different vectors together (i.e. they all combine into a "character" matrix class).


```r
# using cbind()
a1to5cbind <- cbind(a1,a2,a3,a4,a5)
a1to5cbind
```

```
##      a1   a2  a3      a4      a5 
## [1,] "1"  "a" "TRUE"  "1"     "1"
## [2,] "2"  "g" "FALSE" "2"     "2"
## [3,] "3"  "f" "TRUE"  "a"     "3"
## [4,] "4"  "r" "TRUE"  "b"     "4"
## [5,] "10" "t" "FALSE" "TRUE"  "1"
## [6,] "11" "s" "TRUE"  "FALSE" "0"
```

```r
class(a1to5cbind)
```

```
## [1] "matrix"
```

```r
str(a1to5cbind)
```

```
##  chr [1:6, 1:5] "1" "2" "3" "4" "10" "11" "a" "g" ...
##  - attr(*, "dimnames")=List of 2
##   ..$ : NULL
##   ..$ : chr [1:5] "a1" "a2" "a3" "a4" ...
```

```r
dim(a1to5cbind)
```

```
## [1] 6 5
```

```r
#using rbind()
a1to5rbind <- rbind(a1,a2,a3,a4,a5)
a1to5rbind
```

```
##    [,1]   [,2]    [,3]   [,4]   [,5]    [,6]   
## a1 "1"    "2"     "3"    "4"    "10"    "11"   
## a2 "a"    "g"     "f"    "r"    "t"     "s"    
## a3 "TRUE" "FALSE" "TRUE" "TRUE" "FALSE" "TRUE" 
## a4 "1"    "2"     "a"    "b"    "TRUE"  "FALSE"
## a5 "1"    "2"     "3"    "4"    "1"     "0"
```

```r
class(a1to5rbind)
```

```
## [1] "matrix"
```

```r
str(a1to5rbind)
```

```
##  chr [1:5, 1:6] "1" "a" "TRUE" "1" "1" "2" "g" "FALSE" ...
##  - attr(*, "dimnames")=List of 2
##   ..$ : chr [1:5] "a1" "a2" "a3" "a4" ...
##   ..$ : NULL
```

```r
dim(a1to5rbind)
```

```
## [1] 5 6
```

### Lists

But what if want to keep the mixture different data element types. Then we need to use a more generic object class like the "list" or "data frame" (which is a special case of a list).

A "list" data object is simply that a list of different objects put together. THe objects can be different types and do not have to be the same length or structure. Let's combine the 5 vectors together. Notice that the `dim()` command does not tell you anything about a generic list. You'll notice that now each vectors data types are preserved.


```r
#using list()
a1to5list <- list(a1,a2,a3,a4,a5)
a1to5list
```

```
## [[1]]
## [1]  1  2  3  4 10 11
## 
## [[2]]
## [1] "a" "g" "f" "r" "t" "s"
## 
## [[3]]
## [1]  TRUE FALSE  TRUE  TRUE FALSE  TRUE
## 
## [[4]]
## [1] "1"     "2"     "a"     "b"     "TRUE"  "FALSE"
## 
## [[5]]
## [1] 1 2 3 4 1 0
```

```r
class(a1to5list)
```

```
## [1] "list"
```

```r
str(a1to5list)
```

```
## List of 5
##  $ : num [1:6] 1 2 3 4 10 11
##  $ : chr [1:6] "a" "g" "f" "r" ...
##  $ : logi [1:6] TRUE FALSE TRUE TRUE FALSE TRUE
##  $ : chr [1:6] "1" "2" "a" "b" ...
##  $ : num [1:6] 1 2 3 4 1 0
```

```r
dim(a1to5list)
```

```
## NULL
```

But we could also combine different types of obijects together. Let's combine the number `x`, the 2 vectors `z` and `sinz` and the combined list we just made `a1to5list`.


```r
alist1 <- list(x, z, sinz, a1to5list)
alist1
```

```
## [[1]]
## [1] 15
## 
## [[2]]
##  [1]  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5
## [15]  7.0  7.5  8.0  8.5  9.0  9.5 10.0
## 
## [[3]]
##  [1]  0.00000000  0.47942554  0.84147098  0.99749499  0.90929743
##  [6]  0.59847214  0.14112001 -0.35078323 -0.75680250 -0.97753012
## [11] -0.95892427 -0.70554033 -0.27941550  0.21511999  0.65698660
## [16]  0.93799998  0.98935825  0.79848711  0.41211849 -0.07515112
## [21] -0.54402111
## 
## [[4]]
## [[4]][[1]]
## [1]  1  2  3  4 10 11
## 
## [[4]][[2]]
## [1] "a" "g" "f" "r" "t" "s"
## 
## [[4]][[3]]
## [1]  TRUE FALSE  TRUE  TRUE FALSE  TRUE
## 
## [[4]][[4]]
## [1] "1"     "2"     "a"     "b"     "TRUE"  "FALSE"
## 
## [[4]][[5]]
## [1] 1 2 3 4 1 0
```

```r
str(alist1)
```

```
## List of 4
##  $ : num 15
##  $ : num [1:21] 0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 ...
##  $ : num [1:21] 0 0.479 0.841 0.997 0.909 ...
##  $ :List of 5
##   ..$ : num [1:6] 1 2 3 4 10 11
##   ..$ : chr [1:6] "a" "g" "f" "r" ...
##   ..$ : logi [1:6] TRUE FALSE TRUE TRUE FALSE TRUE
##   ..$ : chr [1:6] "1" "2" "a" "b" ...
##   ..$ : num [1:6] 1 2 3 4 1 0
```

```r
class(alist1)
```

```
## [1] "list"
```

This may seem haphazard but is actually quite ingenious. The "list" is a great way to carry around a lot of information in 1 complete/compact object. This is the most common way R provides output from functions and statistical procedures and models.

### Data Frames

A special kind of list is the "data frame." A data frame is designed to be rectangular where every column has the same number of rows and likewise each row has the same number of columns (even if a given element in the table is missing or "NA").

Let's make a data frame using the `data.frame()` command. You'll notice this time the `dim()` command does work.


```r
#using data.frame()
a1to5df <- data.frame(a1,a2,a3,a4,a5)
a1to5df
```

```
##   a1 a2    a3    a4 a5
## 1  1  a  TRUE     1  1
## 2  2  g FALSE     2  2
## 3  3  f  TRUE     a  3
## 4  4  r  TRUE     b  4
## 5 10  t FALSE  TRUE  1
## 6 11  s  TRUE FALSE  0
```

```r
class(a1to5df)
```

```
## [1] "data.frame"
```

```r
str(a1to5df)
```

```
## 'data.frame':	6 obs. of  5 variables:
##  $ a1: num  1 2 3 4 10 11
##  $ a2: Factor w/ 6 levels "a","f","g","r",..: 1 3 2 4 6 5
##  $ a3: logi  TRUE FALSE TRUE TRUE FALSE TRUE
##  $ a4: Factor w/ 6 levels "1","2","a","b",..: 1 2 3 4 6 5
##  $ a5: num  1 2 3 4 1 0
```

```r
dim(a1to5df)
```

```
## [1] 6 5
```

You'll notice that something new showed up - a "factor" object type (for the 2nd and 4th columns (a2 and a4) of `a1to5df`). We can avoid this by setting `stringsAsFactors` to `FALSE` when creating the data frame.


```r
a1to5dfnf <- data.frame(a1,a2,a3,a4,a5,
                        stringsAsFactors = FALSE)
a1to5dfnf
```

```
##   a1 a2    a3    a4 a5
## 1  1  a  TRUE     1  1
## 2  2  g FALSE     2  2
## 3  3  f  TRUE     a  3
## 4  4  r  TRUE     b  4
## 5 10  t FALSE  TRUE  1
## 6 11  s  TRUE FALSE  0
```

```r
class(a1to5dfnf)
```

```
## [1] "data.frame"
```

```r
str(a1to5dfnf)
```

```
## 'data.frame':	6 obs. of  5 variables:
##  $ a1: num  1 2 3 4 10 11
##  $ a2: chr  "a" "g" "f" "r" ...
##  $ a3: logi  TRUE FALSE TRUE TRUE FALSE TRUE
##  $ a4: chr  "1" "2" "a" "b" ...
##  $ a5: num  1 2 3 4 1 0
```

```r
dim(a1to5dfnf)
```

```
## [1] 6 5
```

# EXERCISE 1

Create a new data frame object called `df1` using the `data.frame()` command. Combine the object `y` with the built in constant for `month.name` and `month.abb`.

Create the data frame again and call it `df2` using the same 3 objects (`y`, `month.name` and `month.abb`) and set `stringsAsFactors` to FALSE.

# ANSWER to EXERCISE 1


```r
df1 <- data.frame(y, month.name, month.abb)
df1
```

```
##     y month.name month.abb
## 1   1    January       Jan
## 2   2   February       Feb
## 3   3      March       Mar
## 4   4      April       Apr
## 5   5        May       May
## 6   6       June       Jun
## 7   7       July       Jul
## 8   8     August       Aug
## 9   9  September       Sep
## 10 10    October       Oct
## 11 11   November       Nov
## 12 12   December       Dec
```

```r
str(df1)
```

```
## 'data.frame':	12 obs. of  3 variables:
##  $ y         : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ month.name: Factor w/ 12 levels "April","August",..: 5 4 8 1 9 7 6 2 12 11 ...
##  $ month.abb : Factor w/ 12 levels "Apr","Aug","Dec",..: 5 4 8 1 9 7 6 2 12 11 ...
```

```r
df2 <- data.frame(y, month.name, month.abb,
                  stringsAsFactors = FALSE)
df2
```

```
##     y month.name month.abb
## 1   1    January       Jan
## 2   2   February       Feb
## 3   3      March       Mar
## 4   4      April       Apr
## 5   5        May       May
## 6   6       June       Jun
## 7   7       July       Jul
## 8   8     August       Aug
## 9   9  September       Sep
## 10 10    October       Oct
## 11 11   November       Nov
## 12 12   December       Dec
```

```r
str(df2)
```

```
## 'data.frame':	12 obs. of  3 variables:
##  $ y         : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ month.name: chr  "January" "February" "March" "April" ...
##  $ month.abb : chr  "Jan" "Feb" "Mar" "Apr" ...
```

