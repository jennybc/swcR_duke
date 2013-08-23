% Block 0: R and RStudio Set Up
% Jenny Bryan
% 2013 Jan 09

You need to install and test R and RStudio before the workshop. Download some files we will use, just in case we have any network problems. It is recommended to also install a few add-on packages.

## R and RStudio

* Download and install [R, a free software environment for statistical computing and graphics](http://www.r-project.org) from [CRAN](http://cran.rstudio.com), the Comprehensive R Archive Network. It is _highly recommended_ to install a precompiled binary distribution for your operating system -- use the links up at the top of the CRAN page linked to above!

* Install RStudio, a powerful user interface for R: <http://www.rstudio.com/ide/download/>

## Testing testing

* Do whatever is appropriate for your OS to launch RStudio. You should get a window similar to the screenshot you see [here](http://www.rstudio.com/ide/), but yours will be more boring because you haven't written any code or made any figures yet!

* Put your cursor in the pane labelled Console, which is where you interact with the live R process. Create a simple object with code like `x <- 2 * 4` (followed by enter or return). Then inspect the `x` object by typing `x` followed by enter or return. Obviously you should see the value 8 print to screen. If yes, you are good to go.

## Gapminder stuff

* We will work with some of the data from the [Gapminder project](http://www.gapminder.org). Here is an excerpt I have prepared for our use. Please save this file on your computer prior to the workshop and note the location!
  - http://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt

## Add-on packages

* Installing add-on packages. R is an extensible system and many people share useful code they have developed as a _package_ via CRAN and github. To install a package, for example the [`plyr` package](http://plyr.had.co.nz) for data aggregation, here is one way to do it in the R console (there are others).

```
  install.packages("plyr", dependencies = TRUE)
```
Another package you may wish to play around with soon is [`knitr`](http://yihui.name/knitr/), which facilitates the creation of dynamic reports. You could install it in the same way.
```
  install.packages("knitr", dependencies = TRUE)
```

## Further resources

The above is enough preparation but here are some links if you are interested in reading a bit further.

* How to Use RStudio:
    - <http://www.rstudio.com/ide/docs/>
* RStudio Public Discussion & Troubleshooting Guide:
  - <http://support.rstudio.org/help/>
* How to Install R:
    - <http://cran.r-project.org/doc/manuals/R-admin.html>
    - <http://cran.stat.sfu.ca/doc/FAQ/R-FAQ.html#How-can-R-be-installed_003f>
* R FAQ:
    - <http://cran.r-project.org/doc/FAQ/R-FAQ.html>
* More about add-on packages in the R Installation and Administration Manual
     - <http://cran.r-project.org/doc/manuals/R-admin.html#Add_002don-packages>
     

<!-- Notes from an October 2012 workshop
  ["R carpentry - Finding Help"](../modules/r-carpentry-finding-help.html)
  (quite rough at this point) -->
  
<!-- we don't need this if we remove Q4c, right? -->