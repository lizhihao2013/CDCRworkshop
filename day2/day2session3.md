
# Day 2 Session 1
---

### Goals for Session 3

Session 3
* linear models - multiple regression - models comparison
* short introduction to regression subsets
* testing interaction effects and visualizing them
* simple one-way anova 
* ANOVA means plots with CIs
* a basic map example - cholopleth map of crime data in US
* very brief introduction to date/time handling

---

# session 3 =========================

# linear models
head(state.x77)
colnames(state.x77)
states <- as.data.frame(state.x77[,1:5])
names(states)
q <- names(states)[4]
names(states)[4] <- "LifeExp"
names(states)

fit1 <- lm(Murder ~ ., data=states)
summary(fit1)
fit2 <- lm(Murder ~ Population + Income + Illiteracy, data=states)
summary(fit2)

anova(fit1, fit2)

fit3 <- lm(Murder ~ LifeExp, data=states)
summary(fit3)

# try variable selection methods with stepAIC in MASS package
fit1 <- lm(Murder ~ ., data=states)
summary(fit1)
stepAIC(fit1, direction="backward")
stepAIC(fit1, direction="both")

# library leaps - all subsets regression
library(leaps)

leaps <- regsubsets(Murder ~ ., data=states, nbest=4)
plot(leaps, scale="adjr2")
library(car)
subsets(leaps, statistic="cp",
        main="Cp Plot for All subsets regression")
abline(1,1,lty=2,col="red")




# looking at interaction effects

fit <- lm(mpg ~ hp + wt + hp:wt, data=mtcars)
summary(fit)
library(effects)
plot(effect(term="hp:wt", 
            mod=fit,
            vcov.=vcov, 
            xlevels=list(wt=c(2.2, 3.2, 4.2))),
     multiline=TRUE)

# simple anova

library(multcomp)
head(cholesterol)
str(cholesterol)
table(cholesterol$trt)

df <- cholesterol

aggregate(df$response, 
          by=list(df$trt), 
          FUN=mean)

aggregate(df$response, 
          by=list(df$trt), 
          FUN=sd)

mystats <- function(x){
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  return(c(n=n, mean=m, stdev=s))
}

aggregate(df$response, 
          by=list(df$trt), 
          FUN=mystats)

fit <- aov(response ~ trt, df)
summary(fit)

library(gplots)
plotmeans(response ~ trt, data=df, 
          xlab="Treatment Groups",
          ylab="Response",
          main="Means Plot with 95% CI's")

# map example

head(USArrests)
aa <- tolower(rownames(USArrests))
aa2 <- rownames(USArrests)
crimes <- data.frame(state = tolower(rownames(USArrests)),
                     USArrests)
head(crimes)

library(maps)
states_map <- map_data("state")
crime_map <- merge(states_map, crimes, by.x="region", by.y="state")
head(crime_map)

library(plyr)
library(mapproj)
crime_map2 <- arrange(crime_map, group, order)
head(crime_map2)

ggplot(crime_map2, aes(x=long, y=lat, group=group, fill=Assault)) +
  geom_polygon(colour="black") +
  scale_fill_gradient2(low="#559999", mid="grey90", high="#BB650B",
                       midpoint=median(crimes$Assault)) +
  expand_limits(x=states_map$long, y=states_map$lat) +
  coord_map("polyconic")

# do one for Murder

ggplot(crime_map2, aes(x=long, y=lat, group=group, fill=Murder)) +
  geom_polygon(colour="black") +
  scale_fill_gradient2(low="#559999", mid="grey90", high="#BB650B",
                       midpoint=median(crimes$Murder)) +
  expand_limits(x=states_map$long, y=states_map$lat) +
  coord_map("polyconic")

# dates and times with lubridate

Sys.Date()
date()
today <- Sys.Date()
dob <- as.Date("1921-07-06") # Nancy Reagan's birthday
difftime(today, dob, units="weeks")
as.numeric(difftime(today, dob, units="days")/365)

diff1 <- today - dob
diff1
diff1/365

library(lubridate)
as.duration(diff1)
year(today) - year(dob)
wday(dob)
wday(dob, label=TRUE)
