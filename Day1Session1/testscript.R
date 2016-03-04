library(rapport)
library(nortest)

rapport("TTest", ius2008, x = "leisure", y = "gender")

rapport.ls()

rapport('Descriptives', ius2008, var = "leisure")





pkglist <- c("coin","vcd")
install.packages(pkglist)

lapply(pkglist, library, character.only = TRUE)
