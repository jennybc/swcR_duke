## basically a copy of 02_slopeComparisonAsiaVsAmericas.R
## that does not anticipate/require the "Compile Notebook" treatment
library(lattice)

str(gCoef <- readRDS("gCoef.rds"))
hDat <-
  droplevels(subset(gCoef,
                    continent %in% c("Asia", "Americas")))
str(hDat)

pdf("slopes_AsiaVsAmericas.pdf")
dotplot(slope ~ continent, hDat)
dev.off()

sink("slopes_AsiaVsAmericas.txt")
t.test(slope ~ continent, hDat)
sink()