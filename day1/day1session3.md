
# Day1 Session 3
---

### Goals for Session 3

* more on managing your environment and cleaning up data objects
* selecting elements within data objects - select a column, select a row, select a section
* saving your workspace (all objects) and saving specific objects
* clearing your workspace
* and then loading back your workspace and/or individual objects already saved (*.RData files)
* read in data files - CSV, TAB delimited, XLX, XLSX, SAV SPSS, 
* also reading in a SAS formatted file - experimental however

---

## Managing and Cleaning up your environment as you go.

You can also remove objects as you go. This is especially helpful when working with (A) really large data files and objects and (B) if you are working with a large number of objects or with programs or functions that create many objects that you don't need long term (i.e. temporary files).

### Let's create some new objects:


```r
x <- 3 * 8 + 6
y <- 1:12
y2 <- y**2
```

Let's combine y and y2 both of which are vectors of length 12 with the 2 Constants month.abb and month.name. An easy way to do this is to use cbind() - but this will make (or coerce) ALL of the vectors to the same type. Here we're mixing numbers and characters, so R makes them all character variables. df1 is of "matrix" class type. A matrix in R has to have all elements in every row and column be the same type. In this case everything is now a character type. You can see this running the structure `str()` commands.

### Combine objects to make new objects
#### Create a Matrix Using `cbind()`


```r
df1 <- cbind(y, y2, month.abb, month.name)
class(df1)
```

```
## [1] "matrix"
```

```r
str(df1)
```

```
##  chr [1:12, 1:4] "1" "2" "3" "4" "5" "6" "7" "8" "9" ...
##  - attr(*, "dimnames")=List of 2
##   ..$ : NULL
##   ..$ : chr [1:4] "y" "y2" "month.abb" "month.name"
```

#### Create a Data Frame Using `data.frame()`

Another way to do this is using the `data.frame()` function. A data frame can handle multiple different data types at the same time. The `data frame` is actually a specical case of a `list` type which also mixes different types of objects and variables. Since `y`, `y2`, `month.abb` and `month.name` are all the same length of 12 - we can combine them together as follows. Data frames require the vectors to all be the same length.


```r
df1a <- data.frame(y,y2,month.abb,month.name)
class(df1a)
```

```
## [1] "data.frame"
```

```r
str(df1a)
```

```
## 'data.frame':	12 obs. of  4 variables:
##  $ y         : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ y2        : num  1 4 9 16 25 36 49 64 81 100 ...
##  $ month.abb : Factor w/ 12 levels "Apr","Aug","Dec",..: 5 4 8 1 9 7 6 2 12 11 ...
##  $ month.name: Factor w/ 12 levels "April","August",..: 5 4 8 1 9 7 6 2 12 11 ...
```

#### Creating a Combination of Different Objects - different structure and different classes - Make a List using `list()`

Lists are a more general object type - you can mix and match types of variables and mix and match types of objects. In the example below we can combine 3 objects:
* `x` - a single number (vector of length 1)
* `y` - a integer vecotr of length 12
* `df1a` - the data frame we created above - so YES we have now put a data frame which is a special kind of list inside another list!


```r
list1 <- list(x,y,df1a)
class(list1)
```

```
## [1] "list"
```

```r
str(list1)
```

```
## List of 3
##  $ : num 30
##  $ : int [1:12] 1 2 3 4 5 6 7 8 9 10 ...
##  $ :'data.frame':	12 obs. of  4 variables:
##   ..$ y         : int [1:12] 1 2 3 4 5 6 7 8 9 10 ...
##   ..$ y2        : num [1:12] 1 4 9 16 25 36 49 64 81 100 ...
##   ..$ month.abb : Factor w/ 12 levels "Apr","Aug","Dec",..: 5 4 8 1 9 7 6 2 12 11 ...
##   ..$ month.name: Factor w/ 12 levels "April","August",..: 5 4 8 1 9 7 6 2 12 11 ...
```

### Selecting parts and subsets of objects
#### Selecting individual elements

For the matrix `df1` we created using `cbind()` above, we can "select" elements from inside `df1` as follows. You can select elements using the object name followed by brackets []. Inside the brackets you put in 2 values - the row number followed by the column number separated by a comma. Let's select the ELEMENT in row 3, column 3 of `df1`.


```r
df1[3,3]
```

```
## month.abb 
##     "Mar"
```

#### Select a COLUMN

We can also select a whole column by leaving the row value empty which implies to select all rows and then only provide the column number after the comma. Let's select COLUMN 3 of `df1`.


```r
df1[,3]
```

```
##  [1] "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov"
## [12] "Dec"
```

#### Select a ROW

We can also select a whole row by leaving the column value empty which implies to select all columns and then only provide the row number before the comma. Let's select ROW 5 of `df1`.


```r
df1[5,]
```

```
##          y         y2  month.abb month.name 
##        "5"       "25"      "May"      "May"
```

### Compare class types of variables

As we noted above ALL of the elements in `df1` are character type becuase we used the `cbind()` command and we mixed numeric and character type vectors. We can confirm this by using the `class()` and `str()` functions to see the class and structure of the 1st column of `df1`.


```r
df1[,1]
```

```
##  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12"
```

```r
class(df1[,1])
```

```
## [1] "character"
```

```r
str(df1[,1])
```

```
##  chr [1:12] "1" "2" "3" "4" "5" "6" "7" "8" "9" ...
```

Let's compare this with the 1st column of `df1a` which was created using the `data.frame()` command where the types of vectors could be mixed together. So the `class()` and `str()` of `df1a[,1]` should be an integer type instead of character type.


```r
df1a[,1]
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12
```

```r
class(df1a[,1])
```

```
## [1] "integer"
```

```r
str(df1a[,1])
```

```
##  int [1:12] 1 2 3 4 5 6 7 8 9 10 ...
```

### Create some more objects

We'll also create `z` and `sinz` and then combine them together using `data.frame()` to make one more data frame object `df2`.


```r
z <- seq(0,10,.5)
sinz <- sin(z)
df2 <- data.frame(z, sinz)
```

### Clean up redundant objects

Notice that we created `y` and `y2` and included these in matrix `df1` and in data frame `df1a`. So, now we have the same data/information in 2 places which is redundant. We could remove `y` and `y2` since they are now contained inside `df1` and in `df1a`. Similarly, we created `z` and `sinz` which are now also contained inside `df2`. So, let's **clean** up our environment by removing `y`, `y2`, `z`, `sinz`. 

Let's list the current list of objects and then remove these and list the objects again.


```r
ls()
```

```
##  [1] "a1"         "a1to5cbind" "a1to5df"    "a1to5dfnf"  "a1to5list" 
##  [6] "a1to5rbind" "a2"         "a3"         "a4"         "a5"        
## [11] "alist1"     "bib"        "df1"        "df1a"       "df2"       
## [16] "list1"      "p"          "sinz"       "x"          "y"         
## [21] "y2"         "z"
```

```r
rm(y, y2, z, sinz)
ls()
```

```
##  [1] "a1"         "a1to5cbind" "a1to5df"    "a1to5dfnf"  "a1to5list" 
##  [6] "a1to5rbind" "a2"         "a3"         "a4"         "a5"        
## [11] "alist1"     "bib"        "df1"        "df1a"       "df2"       
## [16] "list1"      "p"          "x"
```

### More on selecting elements in objects

Let's select the 1st column of df2. In addition to using the brackets [] you can also SELECT variables in lists or in data frames by using the $ dollar sign which is another selector in R. Also you can put comments after code.


```r
df2[,1] # use the column number
```

```
##  [1]  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5
## [15]  7.0  7.5  8.0  8.5  9.0  9.5 10.0
```

```r
df2$z # select by column name
```

```
##  [1]  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5
## [15]  7.0  7.5  8.0  8.5  9.0  9.5 10.0
```

You can combine these selectors. Here we'll use the $ dollar sign to select the column "month.name" in `df1a`. Once that column is selected, we can use the brackets to pull out the 3rd element in this column variable - this should be the month name "March". NOTE: This variable is technically a factor so ignore the 2nd line of output below which says there are 12 levels. Factors will be explained later.


```r
df1a$month.name[3]
```

```
## [1] March
## 12 Levels: April August December February January July June March ... September
```

### Saving objects, workspace and datasets

You can save all of these objects as a `*.RData` file which saves the workspace with all of the objects into 1 file. This can be achieved a couple of ways. In the Global Enviroment window (top right) you can click on the "save disk" icon. This can also be achieved through the menus at Session/Save Workspace As. You can also run the `save()` or `save.image()` functions.

Let's use the `save.image()` function:


```r
save.image("allobjects.RData")
```

We could also save individual objects as `*.RData` files. For example suppose we wanted to save the 2nd data frame `df2`, we would use the `save()` function.


```r
save(df2, file="df2.RData")
```

Look in your current working directory and make sure that you now see both of these files: <br> <br> `allobjects.RData` <br> and <br> `df2.RData`

Now that we know these files have been saved, let's remove them from our environment and add them back in. We will use the `load()` command to read these data back into our environment.

First clear the environment:


```r
rm(list = ls())
```

Then `load()` the data back. Let's load `df2.RData` first and then the complete workspace `allobjects.RData`.


```r
load(file="df2.RData")
```

Next the full workspace. NOTE: Ignore the `bib` object shown below which is created as part of this RGitbook.


```r
load("allobjects.RData")
```


```r
ls()
```

```
##  [1] "a1"         "a1to5cbind" "a1to5df"    "a1to5dfnf"  "a1to5list" 
##  [6] "a1to5rbind" "a2"         "a3"         "a4"         "a5"        
## [11] "alist1"     "bib"        "df1"        "df1a"       "df2"       
## [16] "list1"      "p"          "x"
```


You have now successfully accomplished the following:
* created data objects in R
* saved your entire workspace collection of objects
* saved a specific data frame object
* cleared your workspace
* loaded back the specific data frame object
* and loaded back your entire workspace

Next - let's load or import external data files (such as from Excel, CSV and SPSS) and save them back out.

## Example Datafiles

I have created a simple dataset for us to work with. The files are available via Dropbox at [https://www.dropbox.com/sh/vlo5bzrl5ayo1bk/AADD0WieyuEdyGwiveuCoRr-a?dl=0](https://www.dropbox.com/sh/vlo5bzrl5ayo1bk/AADD0WieyuEdyGwiveuCoRr-a?dl=0)

The data files include:
* XLS - the older 1997-2003 EXCEL file format
* XLSX - the newer EXCEL file workbook format
* CSV - a comma delimited dataset
* xxx_tab.TXT - a TAB delimited dataset
* SAV - SPSS file format
* and R scripts (xxx.R) for Workshops 1 and 2 so far...

We will work through importing each of these datafile types.

---

## The dataset description

The dataset we'll be working with here has 8 variables and 20 cases (or 20 subjects).

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> SubjectID </th>
   <th style="text-align:right;"> Age </th>
   <th style="text-align:right;"> WeightPRE </th>
   <th style="text-align:right;"> WeightPOST </th>
   <th style="text-align:right;"> Height </th>
   <th style="text-align:right;"> SES </th>
   <th style="text-align:right;"> GenderSTR </th>
   <th style="text-align:right;"> GenderCoded </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:right;"> 145 </td>
   <td style="text-align:right;"> 5.6 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> m </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 167 </td>
   <td style="text-align:right;"> 166 </td>
   <td style="text-align:right;"> 5.4 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> f </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 35 </td>
   <td style="text-align:right;"> 143 </td>
   <td style="text-align:right;"> 135 </td>
   <td style="text-align:right;"> 5.6 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> F </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 44 </td>
   <td style="text-align:right;"> 216 </td>
   <td style="text-align:right;"> 201 </td>
   <td style="text-align:right;"> 5.6 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> m </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 243 </td>
   <td style="text-align:right;"> 223 </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> m </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 48 </td>
   <td style="text-align:right;"> 165 </td>
   <td style="text-align:right;"> 145 </td>
   <td style="text-align:right;"> 5.2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> f </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 132 </td>
   <td style="text-align:right;"> 132 </td>
   <td style="text-align:right;"> 5.3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> m </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 108 </td>
   <td style="text-align:right;"> 5.1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> f </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 46 </td>
   <td style="text-align:right;"> 167 </td>
   <td style="text-align:right;"> 158 </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 35 </td>
   <td style="text-align:right;"> 190 </td>
   <td style="text-align:right;"> 200 </td>
   <td style="text-align:right;"> 5.8 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> Male </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:right;"> 230 </td>
   <td style="text-align:right;"> 210 </td>
   <td style="text-align:right;"> 6.2 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> m </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 40 </td>
   <td style="text-align:right;"> 200 </td>
   <td style="text-align:right;"> 195 </td>
   <td style="text-align:right;"> 6.1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> f </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:right;"> 180 </td>
   <td style="text-align:right;"> 185 </td>
   <td style="text-align:right;"> 5.9 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> f </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 52 </td>
   <td style="text-align:right;"> 240 </td>
   <td style="text-align:right;"> 220 </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> m </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 24 </td>
   <td style="text-align:right;"> 250 </td>
   <td style="text-align:right;"> 240 </td>
   <td style="text-align:right;"> 6.4 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> M </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 35 </td>
   <td style="text-align:right;"> 175 </td>
   <td style="text-align:right;"> 174 </td>
   <td style="text-align:right;"> 5.8 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> F </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:right;"> 220 </td>
   <td style="text-align:right;"> 221 </td>
   <td style="text-align:right;"> 6.3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> m </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:right;"> 230 </td>
   <td style="text-align:right;"> 215 </td>
   <td style="text-align:right;"> 2.6 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> m </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:right;"> 190 </td>
   <td style="text-align:right;"> 180 </td>
   <td style="text-align:right;"> 5.7 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> female </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 44 </td>
   <td style="text-align:right;"> 260 </td>
   <td style="text-align:right;"> 240 </td>
   <td style="text-align:right;"> 6.4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> male </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>



## IMPORT a basic CSV (comma delimited) or TAB (TAB delimited) text data file

Let's import a simple data file in CSV (comma delimited) format. This is the most common simple format used for exchanging data between different software/data handling packages.

In basic R the following functions are useful for reading in or importing in datasets:
* `read.table()`
* `read.csv()` 
* `read.delim()`

For each of these files you need to specify the data file, and possibly also supply whether the dataset has a header row, what the separator character is and more options. To see complete details see `help(read.table)`

For each example below, I am providing the specific directory path. However, if these datafiles are located in your current working directory you can just type the filename without the full path.

### Option 1 - use `read.table()`

The basic code is `read.table(file="xxx", header=TRUE, sep=",")` but these options can be changed as needed if your file does not have a header row or if your file has a separator other than a comma - some separators can be spaces or tabs.


```r
data.rt <- read.table(file="C:/MyGithub/CDCRworkshop/datasets/Dataset_01_comma.csv",header=TRUE,sep=",")
data.rt
```

```
##    SubjectID Age WeightPRE WeightPOST Height SES GenderSTR GenderCoded
## 1          1  45       150        145    5.6   2         m           1
## 2          2  50       167        166    5.4   2         f           2
## 3          3  35       143        135    5.6   2         F           2
## 4          4  44       216        201    5.6   2         m           1
## 5          5  32       243        223    6.0   2         m           1
## 6          6  48       165        145    5.2   2         f           2
## 7          7  50       132        132    5.3   2         m           1
## 8          8  51       110        108    5.1   3         f           2
## 9          9  46       167        158    5.5   2                    NA
## 10        10  35       190        200    5.8   1      Male           1
## 11        11  36       230        210    6.2   1         m           1
## 12        12  40       200        195    6.1   1         f           2
## 13        13  45       180        185    5.9   3         f           2
## 14        14  52       240        220    6.5   2         m           1
## 15        15  24       250        240    6.4   2         M           1
## 16        16  35       175        174    5.8   2         F           2
## 17        17  51       220        221    6.3   2         m           1
## 18        18  43       230        215    2.6   2         m           1
## 19        19  36       190        180    5.7   1    female           2
## 20        20  44       260        240    6.4   3      male           1
```

### Option 2 - use `read.csv()`

Option 2 assumes that there is a header row and the datafile uses a comma separator.


```r
data.csv <- read.csv(file="C:/MyGithub/CDCRworkshop/datasets/Dataset_01_comma.csv")
data.csv
```

```
##    SubjectID Age WeightPRE WeightPOST Height SES GenderSTR GenderCoded
## 1          1  45       150        145    5.6   2         m           1
## 2          2  50       167        166    5.4   2         f           2
## 3          3  35       143        135    5.6   2         F           2
## 4          4  44       216        201    5.6   2         m           1
## 5          5  32       243        223    6.0   2         m           1
## 6          6  48       165        145    5.2   2         f           2
## 7          7  50       132        132    5.3   2         m           1
## 8          8  51       110        108    5.1   3         f           2
## 9          9  46       167        158    5.5   2                    NA
## 10        10  35       190        200    5.8   1      Male           1
## 11        11  36       230        210    6.2   1         m           1
## 12        12  40       200        195    6.1   1         f           2
## 13        13  45       180        185    5.9   3         f           2
## 14        14  52       240        220    6.5   2         m           1
## 15        15  24       250        240    6.4   2         M           1
## 16        16  35       175        174    5.8   2         F           2
## 17        17  51       220        221    6.3   2         m           1
## 18        18  43       230        215    2.6   2         m           1
## 19        19  36       190        180    5.7   1    female           2
## 20        20  44       260        240    6.4   3      male           1
```

### Option 3 - use `read.delim()`

Option 3 assumes that there is a header row and the datafile uses a TAB separator.


```r
data.tab <- read.delim(file="C:/MyGithub/CDCRworkshop/datasets/Dataset_01_tab.txt")
data.tab
```

```
##    SubjectID Age WeightPRE WeightPOST Height SES GenderSTR GenderCoded
## 1          1  45       150        145    5.6   2         m           1
## 2          2  50       167        166    5.4   2         f           2
## 3          3  35       143        135    5.6   2         F           2
## 4          4  44       216        201    5.6   2         m           1
## 5          5  32       243        223    6.0   2         m           1
## 6          6  48       165        145    5.2   2         f           2
## 7          7  50       132        132    5.3   2         m           1
## 8          8  51       110        108    5.1   3         f           2
## 9          9  46       167        158    5.5   2                    NA
## 10        10  35       190        200    5.8   1      Male           1
## 11        11  36       230        210    6.2   1         m           1
## 12        12  40       200        195    6.1   1         f           2
## 13        13  45       180        185    5.9   3         f           2
## 14        14  52       240        220    6.5   2         m           1
## 15        15  24       250        240    6.4   2         M           1
## 16        16  35       175        174    5.8   2         F           2
## 17        17  51       220        221    6.3   2         m           1
## 18        18  43       230        215    2.6   2         m           1
## 19        19  36       190        180    5.7   1    female           2
## 20        20  44       260        240    6.4   3      male           1
```

## IMPORT data from an EXCEL file XLS and XLSX formats

We will use the `readxl` package. Be sure to install this package `install.package("readxl")` and then load it using `library(readxl)`.

Here is code for reading in a XLS format


```r
data.xls <- read_excel("C:/MyGithub/CDCRworkshop/datasets/Dataset_01.xls", sheet=1)
data.xls
```

```
## Source: local data frame [20 x 8]
## 
##    SubjectID   Age WeightPRE WeightPOST Height   SES GenderSTR GenderCoded
##        (dbl) (dbl)     (dbl)      (dbl)  (dbl) (dbl)     (chr)       (dbl)
## 1          1    45       150        145    5.6     2         m           1
## 2          2    50       167        166    5.4     2         f           2
## 3          3    35       143        135    5.6     2         F           2
## 4          4    44       216        201    5.6     2         m           1
## 5          5    32       243        223    6.0     2         m           1
## 6          6    48       165        145    5.2     2         f           2
## 7          7    50       132        132    5.3     2         m           1
## 8          8    51       110        108    5.1     3         f           2
## 9          9    46       167        158    5.5     2        NA          NA
## 10        10    35       190        200    5.8     1      Male           1
## 11        11    36       230        210    6.2     1         m           1
## 12        12    40       200        195    6.1     1         f           2
## 13        13    45       180        185    5.9     3         f           2
## 14        14    52       240        220    6.5     2         m           1
## 15        15    24       250        240    6.4     2         M           1
## 16        16    35       175        174    5.8     2         F           2
## 17        17    51       220        221    6.3     2         m           1
## 18        18    43       230        215    2.6     2         m           1
## 19        19    36       190        180    5.7     1    female           2
## 20        20    44       260        240    6.4     3      male           1
```

Here is code for reading in a XLSX format


```r
data.xlsx <- read_excel("C:/MyGithub/CDCRworkshop/datasets/Dataset_01.xlsx", sheet=1)
data.xlsx
```

```
## Source: local data frame [20 x 8]
## 
##    SubjectID   Age WeightPRE WeightPOST Height   SES GenderSTR GenderCoded
##        (dbl) (dbl)     (dbl)      (dbl)  (dbl) (dbl)     (chr)       (dbl)
## 1          1    45       150        145    5.6     2         m           1
## 2          2    50       167        166    5.4     2         f           2
## 3          3    35       143        135    5.6     2         F           2
## 4          4    44       216        201    5.6     2         m           1
## 5          5    32       243        223    6.0     2         m           1
## 6          6    48       165        145    5.2     2         f           2
## 7          7    50       132        132    5.3     2         m           1
## 8          8    51       110        108    5.1     3         f           2
## 9          9    46       167        158    5.5     2        NA          NA
## 10        10    35       190        200    5.8     1      Male           1
## 11        11    36       230        210    6.2     1         m           1
## 12        12    40       200        195    6.1     1         f           2
## 13        13    45       180        185    5.9     3         f           2
## 14        14    52       240        220    6.5     2         m           1
## 15        15    24       250        240    6.4     2         M           1
## 16        16    35       175        174    5.8     2         F           2
## 17        17    51       220        221    6.3     2         m           1
## 18        18    43       230        215    2.6     2         m           1
## 19        19    36       190        180    5.7     1    female           2
## 20        20    44       260        240    6.4     3      male           1
```

## IMPORT data from a SPSS file in SAV format

In order to read datafiles from SPSS, other statistical software, and many other datafile types. To see detailed info look at help for the `foreign` package. Remember to `install.packages("foreign")` and load the package using `library(foreign)`. Run the following code to see details on this package and all the formats supported:

```
help(package = "foreign")
```
We will use this package to read in an SPSS datafile in the SAV format. The function we will use is `read.spss()`. See more detailed information on the various options by running `help(read.spss)`. For now we will specify the filename and tell the function to make sure the file is output as a data frame object using the `to.data.frame` option set to `TRUE`.


```r
data.spss <- read.spss(file = "C:/MyGithub/CDCRworkshop/datasets/Dataset_01.sav",
                       to.data.frame=TRUE)
data.spss
```

```
##    SubjectID Age WeightPRE WeightPOST Height            SES
## 1          1  45       150        145    5.6 Average Income
## 2          2  50       167        166    5.4 Average Income
## 3          3  35       143        135    5.6 Average Income
## 4          4  44       216        201    5.6 Average Income
## 5          5  32       243        223    6.0 Average Income
## 6          6  48       165        145    5.2 Average Income
## 7          7  50       132        132    5.3 Average Income
## 8          8  51       110        108    5.1    High Income
## 9          9  46       167        158    5.5 Average Income
## 10        10  35       190        200    5.8     Low Income
## 11        11  36       230        210    6.2     Low Income
## 12        12  40       200        195    6.1     Low Income
## 13        13  45       180        185    5.9    High Income
## 14        14  52       240        220    6.5 Average Income
## 15        15  24       250        240    6.4 Average Income
## 16        16  35       175        174    5.8 Average Income
## 17        17  51       220        221    6.3 Average Income
## 18        18  43       230        215    6.2 Average Income
## 19        19  36       190        180    5.7     Low Income
## 20        20  44       260        240    6.4    High Income
##                   GenderSTR GenderCoded
## 1  m                               Male
## 2  f                             Female
## 3  F                             Female
## 4  m                               Male
## 5  m                               Male
## 6  f                             Female
## 7  m                               Male
## 8  f                             Female
## 9                                  <NA>
## 10 Male                            Male
## 11 m                               Male
## 12 f                             Female
## 13 f                             Female
## 14 m                               Male
## 15 M                               Male
## 16 F                             Female
## 17 m                               Male
## 18 m                               Male
## 19 female                        Female
## 20 male                            Male
```

## IMPORT data from a SAS Transport XPT file format

In order to read datafiles from SAS, we will still be using the `foreign` package. The function we will use is `read.xport()`. See more detailed information on the various options by running `help(read.xport)`. You just need to specify the filename. You'll notice that the variable names have been truncated to 8 characters.


```r
data.xpt <- read.xport(file = "C:/MyGithub/CDCRworkshop/datasets/Dataset_01.xpt")
data.xpt
```

```
##    SUBJECTI AGE WEIGHTPR WEIGHTPO HEIGHT SES GENDERST GENDERCO
## 1         1  45      150      145    5.6   2        m        1
## 2         2  50      167      166    5.4   2        f        2
## 3         3  35      143      135    5.6   2        F        2
## 4         4  44      216      201    5.6   2        m        1
## 5         5  32      243      223    6.0   2        m        1
## 6         6  48      165      145    5.2   2        f        2
## 7         7  50      132      132    5.3   2        m        1
## 8         8  51      110      108    5.1   3        f        2
## 9         9  46      167      158    5.5   2                NA
## 10       10  35      190      200    5.8   1     Male        1
## 11       11  36      230      210    6.2   1        m        1
## 12       12  40      200      195    6.1   1        f        2
## 13       13  45      180      185    5.9   3        f        2
## 14       14  52      240      220    6.5   2        m        1
## 15       15  24      250      240    6.4   2        M        1
## 16       16  35      175      174    5.8   2        F        2
## 17       17  51      220      221    6.3   2        m        1
## 18       18  43      230      215    6.2   2        m        1
## 19       19  36      190      180    5.7   1   female        2
## 20       20  44      260      240    6.4   3     male        1
```

## **Experimental** SAS Database Reader 

There is a relatively new package called `sas7bdat` which is still listed as experimental for reading the binary SAS formatted files `*.sas7bdat`. To try this package, install it `install.packages("sas7bdat")` and then load it `library(sas7bdat)`. Once loaded you can use the `read.sas7bdat()` function as follows.

_**This did NOT work for me as you'll see below - thus more work is needed before this package will be useful and bug-free.**_

Read more on the package at [http://biostatmatt.com/archives/tag/sas7bdat](http://biostatmatt.com/archives/tag/sas7bdat)

It looks like this package has been updated and a new one is now hosted at Github - see more at [https://github.com/biostatmatt/sas7bdat.parso](https://github.com/biostatmatt/sas7bdat.parso). 


```r
data.sas <- read.sas7bdat(file = "C:/MyGithub/CDCRworkshop/datasets/Dataset_01.sas7bdat")
  
data.sas
```

```
##        SubjectID           Age     WeightPRE     WeightPOST        Height
## 1  5.299809e-315 5.327817e-315 5.336964e-315  1.903598e+185 5.312242e-315
## 2  5.304989e-315 5.328626e-315 5.337652e-315 -2.353438e-185 5.311983e-315
## 3  5.307580e-315 5.326198e-315 5.336681e-315  1.903598e+185 5.312242e-315
## 4  5.310170e-315 5.327655e-315 5.339635e-315  1.903598e+185 5.312242e-315
## 5  5.311465e-315 5.325712e-315 5.340728e-315  5.339918e-315 5.312760e-315
## 6  5.312760e-315 5.328302e-315 5.337571e-315  -9.255965e+61 5.311724e-315
## 7  5.314056e-315 5.328626e-315 5.336235e-315   4.667262e-62 5.311854e-315
## 8  5.315351e-315 5.328788e-315 5.334616e-315  1.903598e+185 5.311595e-315
## 9  5.315998e-315 5.327979e-315 5.337652e-315  5.337288e-315 5.312113e-315
## 10 5.316646e-315 5.326198e-315 5.338583e-315   4.667262e-62 5.312501e-315
## 11 5.317294e-315 5.326360e-315 5.340202e-315  -9.255965e+61 5.313019e-315
## 12 5.317941e-315 5.327007e-315 5.338988e-315  1.903598e+185 5.312890e-315
## 13 5.318589e-315 5.327817e-315 5.338178e-315 -2.353438e-185 5.312631e-315
## 14 5.319236e-315 5.328950e-315 5.340606e-315  5.339797e-315 5.313408e-315
## 15 5.319884e-315 5.323122e-315 5.341011e-315 -2.353438e-185 5.313279e-315
## 16 5.320531e-315 5.326198e-315 5.337976e-315   4.667262e-62 5.312501e-315
## 17 5.320855e-315 5.328788e-315 5.339797e-315   4.667262e-62 5.313149e-315
## 18 5.321179e-315 5.327493e-315 5.340202e-315  -9.255965e+61 5.313019e-315
## 19 5.321503e-315 5.326360e-315 5.338583e-315  -9.255965e+61 5.312372e-315
## 20 5.321827e-315 5.327655e-315 5.341335e-315 -2.353438e-185 5.313279e-315
##              SES GenderSTR   GenderCoded
## 1  5.304989e-315           6.013909e-154
## 2  5.304989e-315           6.013869e-154
## 3  5.304989e-315           6.013687e-154
## 4  5.304989e-315           6.013909e-154
## 5  5.304989e-315           6.013909e-154
## 6  5.304989e-315           6.013869e-154
## 7  5.304989e-315           6.013909e-154
## 8  5.307580e-315           6.013869e-154
## 9  5.304989e-315           6.013475e-154
## 10 5.299809e-315           3.680113e+180
## 11 5.299809e-315           6.013909e-154
## 12 5.299809e-315           6.013869e-154
## 13 5.307580e-315           6.013869e-154
## 14 5.304989e-315           6.013909e-154
## 15 5.304989e-315           6.013727e-154
## 16 5.304989e-315           6.013687e-154
## 17 5.304989e-315           6.013909e-154
## 18 5.304989e-315           6.013909e-154
## 19 5.299809e-315        le 2.066414e+161
## 20 5.307580e-315           3.680176e+180
```


