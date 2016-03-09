# ==============================================
# The script below sets up the files, package
# and details for getting Rgitbook
# up and running as well as setting up
# a bibliography for references and such.
# ==============================================

# ==============================================
# Ideally, the original author was jbryer
# but I kept hitting glitches and errors
# and found instead a forked repository
# from raulossada that ran without issue
#
# devtools::install_github("jbryer/Rgitbook")
# require(Rgitbook)
# link below fixes some of the installation errors
# ==============================================

devtools::install_github("raulossada/Rgitbook")

# ==============================================
# once installed besure to load both
# Rgitbook and the knitcitations packages
# ==============================================

library(Rgitbook)
library(knitcitations)

# ==============================================
# only the 1st time - run through the steps to
# install Gitbook and get it running
#
# these need to be run as adminstrator to
# work correctly - you also need to run the
# system commands - I also ran some of these
# from the command window directly and not here...
#
# When setting this up for the 1st time
# you need to install nodejs
# go to https://nodejs.org/en/
# even though it says it will add npm to the path
# it won't. So open a command window and make sure
# to add the installation directory to the path
# add "C:\Program Files\nodejs" to the path
# ==============================================

installGitbook()
checkForGitbook()
system("npm install gitbook-plugin -g")
system("npm install -g gitbook-cli")

checkForGitbook()

gitbookInfo()

isAvailable <- checkForGitbook(quiet = TRUE)
isAvailable

# ==============================================
# skip these steps for now - these establish
# a new Gitbook
# ==============================================

setwd("C:/MyGithub/")

newGitbook("CDCRworkshop")
initGitbook()
buildRmd()
buildGitbook()
openGitbook()
publishGitbook("melindahiggins2000/gitbook3")

# ==============================================
# note - I had to open the Git command window and run each command separately
# git init 
# git commit --allow-empty -m 'Update built gitbook1' 
# git checkout -b gh-pages 
# git add . 
# git commit -a -m 'Update built gitbook2' 
# git push https://github.com/melindahiggins2000/gitbook3 gh-pages --force
# when I got here, I had to enter my login and password for github
# ==============================================

# ==============================================
# RUN THESE TO UPDATE AN EXISTING GITBOOK
# ==============================================

# go to GITBOOK directory ========================
setwd("C:/MyGithub/CDCRworkshop")
library(Rgitbook)
library(knitcitations)
library(ggplot2)
library(ggthemes)
library(knitr)
#library(xtable)
# library(rJava)
# library(xlsx) - has java problems
# library(gdata) - needs perl
library(readxl)
library(foreign)

library(plyr)
library(dplyr)

rm(list = ls())

# for a bibliography to be added
# assign it to the global environment first.
bib <- read.bibtex("references.bib")

# clean our cache of previous bibliography
cleanbib()

# load datasets and other objects referred to within
# these exercises and such.
# Dataset_01_comma <- read.csv(file="./datasets/Dataset_01_comma.csv")

# set clean=TRUE to make sure each RMD file gets rebuilt
buildRmd(clean=TRUE)
buildRmd()
buildGitbook()
openGitbook()

# then copy and update github

## ======================================
## NOTE: If buildGitbook() throws an error of "status 1"
## you need to run RStudio as admin
## also open console window and run through a series of npm installs
## > npm install gitbook -g
## > npm install gitbook-plugin -g
## > npm install -g gitbook-cli
## then go back to RStudio and run the 3 steps above
## buildRmd()
## buildGitbook()
## openGitbook()







