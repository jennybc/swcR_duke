## use File --> Compile Notebook on me !
## or click notebook button in top right of editor pane
## will require knitr package to work
## to install: install.packages("knitr")

library(lattice)

## the working directory will differ for live execution vs. using Compile Notebook
## you will need to toggle the comment status of these lines to get
## what you want

## for Compile Notebook:
str(gCoef <- readRDS("../results/gCoef.rds"))

## for live execution when working directory set correctly to top-level
## directory for this project
## str(gCoef <- readRDS("results/gCoef.rds"))

hDat <-
  droplevels(subset(gCoef,
                    continent %in% c("Asia", "Americas")))
str(hDat)
dotplot(slope ~ continent, hDat)
t.test(slope ~ continent, hDat)
