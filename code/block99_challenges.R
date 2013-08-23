## Challenges!

## Challenge 1: automation and mastering your file system

## Safely create a sub-directory of data, called countrySpecific
## "Safely" = if it exists, don't re-create it
## Clean this sub-dir out, if necessary (from previous attempts at below)

## If you cannot get this filesystem stuff working from R, just do it "by hand"
## however you know how!

## Write country-specific data files to data/countrySpecific/,
## named like so:
## Afghanistan.txt, Albania.txt, Algeria.txt, etc.

## Hints
## Use file.path() to construct paths
## Example: file.path(getwd(), "data")
## list.files() will list files and directories
## file.exists() reports if a file or directory exists
## dir.create() creates a directory
## file.remove() removes a file
## Sys.glob() does wildcard expansion on file paths
## paste0() concatenates character vectors
## Example: yo <- "hi"; paste0(yo, " there")
## Useful ways to iterate over countries include:
## for() loop, by(), d_ply()
## recall that write.table() writes data.frames


## Challenge 2: automation and mastering your file system

## Safely create a sub-directory of figs, called countrySpecific
## See Challenge 1 for details or a workaround

## Write country-specific scatterplots of lifeExpectancy vs year
## there, named like so:
## Afghanistan.pdf, Albania.pdf, Algeria.pdf, etc.


## Challenge 3: finding interesting stories

## Read in the country-specific estimate intercepts and slopes

## Find two interesting countries in each continent
## maybe start with random selection?
## or consider best/worst w/r/t lifeExpectancy slope
## or define "interesting" your way!

## write scatterplots to file for these interesting countries ...
## ? together as a group, on one figure, using panels ?
## ? one file and figure per country ?
## ? one file per continent with both countries on one fig ?
## you decide!



## Challenge 4: finding catastrophic model failure!

## Read in the Gapminder data

## For each country,
## Fit the linear model of lifeExpectancy on year
## Get the residuals
## Use the residuals to declare the model fit good or bad
## E.g. is there >= 1 |residual| > some threshhold?
## Store scatterplots of lifeExpectancy vs year for the
## countries for which linear model is poor fit

## Hints:
## resid() takes a fitted model and returns residuals
## xyplot(y ~ x, yourDat, type = c("p","r")) will include a linear fit

## Variant: Find the countries of interest by fitting linear model via OLS and
## via robust methods and look for countries where the intercept and/or slope is
## very different

## the robustbase package is great and offers a robust version of lm() in the
## function lmrob()


## code rescued from nescent content before deleting ... looks like me
## noodling around with challenge exercises? read closely later

file.path(getwd(), "results")
dir.create(file.path(getwd(), "results"))
list.files()
list.files(file.path(getwd(), "results"))

write.table(subset(gDat, country == "Canada"), file.path(getwd(), "results", "canada.txt"))
write.table(subset(gDat, country == "Canada"), file.path(getwd(), "results", "canada.txt"),
            quote = FALSE, row.names = FALSE, sep = "\t")
jCountry <- "Mexico"
paste0(jCountry, ".txt")
write.table(subset(gDat, country == jCountry), file.path(getwd(), "results", paste0(jCountry, ".txt")),
            quote = FALSE, row.names = FALSE, sep = "\t")

i <- 1
(jCountry <- levels(gDat$country)[i])
write.table(subset(gDat, country == jCountry), file.path(getwd(), "results", paste0(jCountry, ".txt")),
           quote = FALSE, row.names = FALSE, sep = "\t")

for(i in seq_along(levels(gDat$country))) {
  jCountry <- levels(gDat$country)[i]
  write.table(subset(gDat, country == jCountry), file.path(getwd(),
                                                           "results", paste0(jCountry, ".txt")),
              quote = FALSE, row.names = FALSE, sep = "\t")
}

file.remove(Sys.glob(file.path(getwd(), "results", "*")))

sapply(seq_along(levels(gDat$country)), function(i) {
  jCountry <- levels(gDat$country)[i]
  write.table(subset(gDat, country == jCountry), file.path(getwd(),
                                                           "results", paste0(jCountry, ".txt")),
              quote = FALSE, row.names = FALSE, sep = "\t")

})

file.remove(Sys.glob(file.path(getwd(), "results", "*")))

sapply(levels(gDat$country), function(jCountry) {
  write.table(subset(gDat, country == jCountry),
              file.path(getwd(), "results", paste0(jCountry, ".txt")),
              quote = FALSE, row.names = FALSE, sep = "\t")
})

## CHALLENGE

## in a totally new script
## read the country-specific data we just wrote
## write a scatterplot of lifeExpectancy vs year to figs/<country name>.pdf

## in a totally new script
## read in the country-level slopes and intercepts
## find some interesting countries within each continent, e.g. best/worst
## make scatterplot that includes just those countries (on same w/ legend? or conditioned/facetted) and write one figure file per continent to figs/<continent name>_<something descriptive>.pdf

xyplot(lifeExp ~ year, gDat, subset = country == "Germany", type = c("p", "r"),
       main = "dev.print()")
dev.print(pdf, "figs/germany.pdf", width = 3, height = 3)
dir.create("figs")
dev.print(pdf, "figs/germany.pdf")

pdf("figs/germany2.pdf", width = 3, height = 3)
xyplot(lifeExp ~ year, gDat, subset = country == "Germany", type = c("p", "r"),
       main = "pdf() ... dev.off()")
dev.off()

hDat <- droplevels(subset(gCoef, continent %in% c("Asia", "Americas")))
str(hDat)
dotplot(slope ~ continent, hDat)

t.test(slope ~ continent, hDat)

