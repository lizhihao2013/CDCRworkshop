
# Day 2 Session 1
---

### Goals for Session 2

Session 2
* describing data summaries BY groups
* frequencies and contingency tables - with the vcd package
* running a chisq test, fisher's exact test 
* and the Cochran-Mantel-Haenszel Chi-Squared Test
* plots of categorical data - spinograms and mosaic plots
* correlations matrices and tests
* sctterplot matrices
* corrgrams
* t-tests and boxplots

---

# session 2 =========================

# descriptions by group - use the by() function
dstats <- function(x)sapply(x,mystats)
by(mtcars[myvars], mtcars$cyl, dstats)

out <- by(mtcars[myvars], mtcars$cyl, dstats)
kable(out[[1]], caption=paste(mtcars$cyl[1]," cylinders"))
kable(out[[2]], caption=paste(mtcars$cyl[2]," cylinders"))
kable(out[[3]], caption=paste(mtcars$cyl[3]," cylinders"))

# doBy package
library(doBy)
out <- summaryBy(mpg+disp+hp~cyl, data=mycars, FUN=mystats)
kable(out)

# frequency and contingency tables
library(vcd)
library(gmodels)

data()

head(Arthritis)
str(Arthritis)

table(Arthritis$Improved)
with(Arthritis, table(Improved))

mytable <- xtabs(~ Treatment + Improved, data=Arthritis)
mytable

margin.table(mytable, 1)
margin.table(mytable, 2)

prop.table(mytable)
prop.table(mytable, 1)
prop.table(mytable, 2)

addmargins(mytable)
addmargins(prop.table(mytable))
addmargins(prop.table(mytable,1), 2)
addmargins(prop.table(mytable,1)*100, 2)
addmargins(prop.table(mytable,2)*100, 1)

chisq.test(mytable)

mytable2 <- xtabs(~Improved+Sex, data=Arthritis)
mytable2
chisq.test(mytable2)
fisher.test(mytable2)

mytable3 <- xtabs(~Treatment+Improved+Sex, data=Arthritis)
mytable3
mantelhaen.test(mytable3)
# results suggest that the treatment received and 
# improvements reported were not independent within 
# each level of sex - in other words treated individuals
# improved more than those receving placebos when 
# controlling for sex

# plots for categorical data

attach(Arthritis)
counts <- table(Treatment, Improved)
spine(counts, main="Spinogram of Treatment by Group",
      gp=gpar(col = "blue", fill=rainbow(6)))
detach(Arthritis)

mosaic(~Treatment+Improved,
       data=Arthritis,
       gp = shading_max, split_vertical = TRUE,
       main="Arthritis: [Treatment] [Improved]")

# correlations

head(state.x77)
states <- state.x77[,1:6]
cor(states)
cor(states, method="spearman")

cor.test(states[,2], states[,3])

sum(is.na(states))

library(psych)
corr.test(states, use="complete")
print(corr.test(states, use="complete"), short=FALSE)

# scatterplot matrices

library(car)
myvars <- c("Murder", "Population", "Illiteracy", "Income", "Frost")
states <- as.data.frame(state.x77[,myvars])
palette("default")
scatterplotMatrix(states)
scatterplotMatrix(states, spread=FALSE)
scatterplotMatrix(states, spread=FALSE,
                  diagonal = "boxplot")

# graphical correlation matrix - corrgram package
library(corrgram)

corrgram(states, order=TRUE,
         lower.panel = panel.pts,
         upper.panel = panel.ellipse,
         diag.panel = panel.density,
         main = "Corrgram of 5 variables from States.x77 dataset")

corrgram(states, order=TRUE,
         lower.panel = panel.shade,
         upper.panel = panel.pie,
         text.panel = panel.txt,
         main = "Corrgram of 5 variables from States.x77 dataset")



t.test(mpg ~ am, data=mtcars)
boxplot(mpg ~ am, data=mtcars,
        col = c("blue","green"))
ggplot(data=mtcars, aes(as.factor(am), mpg)) +
  geom_boxplot()

# skip for now.....

boxplot(len ~ dose, data = ToothGrowth,
        boxwex = 0.25, at = 1:3 - 0.2,
        subset = supp == "VC", col = "yellow",
        main = "Guinea Pigs' Tooth Growth",
        xlab = "Vitamin C dose mg",
        ylab = "tooth length",
        xlim = c(0.5, 3.5), ylim = c(0, 35), yaxs = "i")
boxplot(len ~ dose, data = ToothGrowth, add = TRUE,
        boxwex = 0.25, at = 1:3 + 0.2,
        subset = supp == "OJ", col = "orange")
legend(2, 9, c("Ascorbic acid", "Orange juice"),
       fill = c("yellow", "orange"))


