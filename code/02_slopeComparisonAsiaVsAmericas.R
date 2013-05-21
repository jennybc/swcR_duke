## use File --> Compile Notebook on me !
## or click notebook button in top right of editor pane
## will require knitr package to work
## to install: install.packages("knitr")

library(lattice)
## this path is affected by using the Compile Notebook button, which runs where a script lives
## as opposed to the true home directory for this project
## you may need to (un)comment to get desired result
## str(gCoef <- readRDS("../results/gCoef.rds"))
str(gCoef <- readRDS("gCoef.rds"))
hDat <-
  droplevels(subset(gCoef,
                    continent %in% c("Asia", "Americas")))
str(hDat)
dotplot(slope ~ continent, hDat)
t.test(slope ~ continent, hDat)
