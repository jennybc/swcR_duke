all: results/avgX.txt figs/slopes_AsiaVsAmericas.pdf prose/02_slopeComparisonAsiaVsAmericas.html

results/avgX.txt figs/niftyPlot.pdf: data/gapminderDataFiveYear.txt code/block01_toyLine.R
	Rscript code/block01_toyLine.R

results/gCoef.txt results/gCoef.rds: data/gapminderDataFiveYear.txt code/01_countrySpecificInterceptSlope.R
	Rscript code/01_countrySpecificInterceptSlope.R

prose/02_slopeComparisonAsiaVsAmericas.html: results/gCoef.rds code/02_slopeComparisonAsiaVsAmericas.R
	cd prose;                                         \
  Rscript -e "knitr::stitch('../code/02_slopeComparisonAsiaVsAmericas.R', template = system.file('misc', 'knitr-template.Rmd', package = 'knitr'))";         \
  rm 02_slopeComparisonAsiaVsAmericas.md;           \
  rm -rf figure/

figs/slopes_AsiaVsAmericas.pdf results/slopes_AsiaVsAmericas.txt: results/gCoef.rds code/03_slopeComparisonAsiaVsAmericas.R
	Rscript code/03_slopeComparisonAsiaVsAmericas.R

clean:
	rm -f results/* figs/* prose/02_slopeComparisonAsiaVsAmericas.html
