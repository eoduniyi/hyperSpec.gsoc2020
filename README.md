# R GSoC 2020 hyperSpec
<p style="line-height:12px"> <b>Student:</b> <i>Erick Oduniyi</i>; <b>Project:</b> <i>hyperSpec</i></p>
This notebook contains notes and solutions for the R GSoC 2020 hyperSpec test.

## 1. Easy
**Task:** _Install `hyperSpec`, `covr` and `lintr` from CRAN and `hyperSpec.tidyverse` from github._

---


```R
# Install hyperSpec, covr, and lintr from CRAN
install.packages("hyperSpec", "covr", "lintr")

# Install hyperSpec.tidyverse from github
remotes::install_github("cbeleites/hyperSpec.tidyverse")
```

    Warning message in install.packages("hyperSpec", "covr", "lintr"):
    “'lib = "covr"' is not writable”



    Error in install.packages("hyperSpec", "covr", "lintr"): unable to install packages
    Traceback:


    1. install.packages("hyperSpec", "covr", "lintr")

    2. stop("unable to install packages")



```R
# Install hyperSpec, covr, and lintr packages from CRAN
install.packages("hyperSpec")
install.packages("lintr")
install.packages("covr")

# Install hyperSpec.tidyverse package from github
remotes::install_github("cbeleites/hyperSpec.tidyverse")
```


    The downloaded binary packages are in
    	/var/folders/4_/gg3mjn693bz4v5w1sxh71rtc0000gp/T//RtmpltRTPs/downloaded_packages


    also installing the dependencies ‘cyclocomp’, ‘xmlparsedata’





    The downloaded binary packages are in
    	/var/folders/4_/gg3mjn693bz4v5w1sxh71rtc0000gp/T//RtmpltRTPs/downloaded_packages

    The downloaded binary packages are in
    	/var/folders/4_/gg3mjn693bz4v5w1sxh71rtc0000gp/T//RtmpltRTPs/downloaded_packages


    Downloading GitHub repo cbeleites/hyperSpec.tidyverse@master




    [32m✔[39m  [38;5;247mchecking for file ‘/private/var/folders/4_/gg3mjn693bz4v5w1sxh71rtc0000gp/T/RtmpltRTPs/remotes81a11e602b6a/cbeleites-hyperSpec.tidyverse-d2122a6/DESCRIPTION’[39m[36m[39m
    [38;5;247m─[39m[38;5;247m  [39m[38;5;247mpreparing ‘hyperSpec.tidyverse’:[39m[36m[39m
    [32m✔[39m  [38;5;247mchecking DESCRIPTION meta-information[39m[36m[39m
    [38;5;247m─[39m[38;5;247m  [39m[38;5;247mchecking for LF line-endings in source and make files and shell scripts[39m[36m[39m
    [38;5;247m─[39m[38;5;247m  [39m[38;5;247mchecking for empty or unneeded directories[39m[36m[39m
    [38;5;247m─[39m[38;5;247m  [39m[38;5;247mbuilding ‘hyperSpec.tidyverse_0.1.0.tar.gz’[39m[36m[39m



## 2. Medium
**Task:** _Fork `hyperSpec` from github, use `lintr` to standardize code formatting, and submit a pull request with the improved code._

---

### 2.1. The nature of linting
<p align="justify">
In general, linting is a way to automatically debug code (i.e., error checking and code standardization) without executing the program. Linters aren't intelligent, so it only tries to adhere to a grammar and thus can only check for potential errors. There are two categories of linting: code style linting and syntax linting. There is no right or wrong way to lint, so it's important to choose a linting style (i.e., style convention) that fits the project.
</p>

<p align="justify">
So, linting is super helpful because it helps programmers adhere to style conventions. In the context of working on open source projects, this can add a bit of confidence to a programmers contribution, which of course is related to unit testing and continuous integration.
</p>

### 2.2. Applying `lintr` to hyperSpec
The `lintr` package is a very nice way to checks adherence to a given style, syntax errors and possible semantic issues.


```R
# Load lintr package
library(lintr)

# Go to the directory of hyperSpec source files
setwd("/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R")

# Check directory
list.files()
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'aggregate.R'</li><li>'all.equal.R'</li><li>'apply.R'</li><li>'Arith.R'</li><li>'as.data.frame.R'</li><li>'barbiturates.R'</li><li>'bind.R'</li><li>'call.list.R'</li><li>'chk.hy.R'</li><li>'chondro.R'</li><li>'collapse.R'</li><li>'colMeans.R'</li><li>'Compare.R'</li><li>'count_lines.R'</li><li>'cov.R'</li><li>'decomposition.R'</li><li>'deprecated.R'</li><li>'dim.R'</li><li>'dimnames.R'</li><li>'DollarNames.R'</li><li>'droplevels.R'</li><li>'empty.R'</li><li>'extract.R'</li><li>'factor2num.R'</li><li>'fileio.optional.R'</li><li>'fix_spc_colnames.R'</li><li>'flu.R'</li><li>'getbynames.R'</li><li>'guesswavelength.R'</li><li>'hyperspec-class.R'</li><li>'hyperspec-package.R'</li><li>'initialize.R'</li><li>'labels.R'</li><li>'laser.R'</li><li>'levelplot.R'</li><li>'makeraster.R'</li><li>'map.identify.R'</li><li>'map.sel.poly.R'</li><li>'mark.dendrogram.R'</li><li>'mark.peak.R'</li><li>'Math.R'</li><li>'matlab.palette.R'</li><li>'mean_sd.R'</li><li>'merge.R'</li><li>'mvtnorm.R'</li><li>'normalize01.R'</li><li>'options.R'</li><li>'orderwl.R'</li><li>'paracetamol.R'</li><li>'paste.row.R'</li><li>'pearson.dist.R'</li><li>'plot.R'</li><li>'plotc.R'</li><li>'plotmap.R'</li><li>'plotmat.R'</li><li>'plotspc.R'</li><li>'plotvoronoi.R'</li><li>'qplot.R'</li><li>'qplotmixmap.R'</li><li>'quantile.R'</li><li>'rbind.fill.R'</li><li>'read.asc.Andor.R'</li><li>'read.asc.PerkinElmer.R'</li><li>'read.ENVI.HySpex.R'</li><li>'read.ENVI.Nicolet.R'</li><li>'read.ENVI.R'</li><li>'read.ini.R'</li><li>'read.jdx.R'</li><li>'read.mat.Cytospec.R'</li><li>'read.mat.Witec.R'</li><li>'read.spc.Kaiser.R'</li><li>'read.spc.R'</li><li>'read.spc.Shimadzu.R'</li><li>'read.spe.R'</li><li>'read.txt.Horiba.R'</li><li>'read.txt.long.R'</li><li>'read.txt.Renishaw.R'</li><li>'read.txt.Shimadzu.R'</li><li>'read.txt.wide.R'</li><li>'read.txt.Witec.R'</li><li>'regexps.R'</li><li>'replace.R'</li><li>'sample.R'</li><li>'scale.R'</li><li>'seq.R'</li><li>'show.R'</li><li>'spc.bin.R'</li><li>'spc.fit.poly.R'</li><li>'spc.identify.R'</li><li>'spc.loess.R'</li><li>'spc.NA.approx.R'</li><li>'spc.rubberband.R'</li><li>'spc.spline.R'</li><li>'split.R'</li><li>'split.string.R'</li><li>'splitdots.R'</li><li>'subset.R'</li><li>'Summary.R'</li><li>'sweep.R'</li><li>'trellis.factor.key.R'</li><li>'units.R'</li><li>'unittest.R'</li><li>'validate.R'</li><li>'vandermonde.R'</li><li>'wc.R'</li><li>'wl.R'</li><li>'wl2i.R'</li><li>'wleval.R'</li><li>'write.txt.long.R'</li><li>'write.txt.wide.R'</li><li>'y-pastenames.R'</li><li>'zzz.R'</li></ol>




```R
# Try using the lintr package on a single file
lint("aggregate.R")
```


    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:1:1: [22m[34mstyle: [39m[1mLines should not be more than 80 characters.[22m
    .aggregate <- function (x, by = stop ("by is needed"), FUN = stop ("FUN is needed."),
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:1:24: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
    .aggregate <- function (x, by = stop ("by is needed"), FUN = stop ("FUN is needed."),
                           ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:1:38: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
    .aggregate <- function (x, by = stop ("by is needed"), FUN = stop ("FUN is needed."),
                                         ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:1:56: [22m[34mstyle: [39m[1mVariable and function name style should be snake_case.[22m
    .aggregate <- function (x, by = stop ("by is needed"), FUN = stop ("FUN is needed."),
                                                           ^~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:1:67: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
    .aggregate <- function (x, by = stop ("by is needed"), FUN = stop ("FUN is needed."),
                                                                      ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:2:30: [22m[34mstyle: [39m[1mVariable and function name style should be snake_case.[22m
                            ..., out.rows = NULL, append.rows = NULL,
                                 ^~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:3:43: [22m[34mstyle: [39m[1mThere should be a space between right parenthesis and an opening curly brace.[22m
                            by.isindex = FALSE){
                                              ^~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:4:15: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      validObject (x)
                  ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:6:16: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      if (!is.list (by) || ! by.isindex)
                   ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:7:17: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        by <- split (seq (x, index = TRUE), by, drop = TRUE)
                    ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:7:22: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        by <- split (seq (x, index = TRUE), by, drop = TRUE)
                         ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:13:15: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      if (is.null (out.rows)){
                  ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:13:25: [22m[34mstyle: [39m[1mThere should be a space between right parenthesis and an opening curly brace.[22m
      if (is.null (out.rows)){
                            ^~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:14:1: [22m[34mstyle: [39m[1mLines should not be more than 80 characters.[22m
        tmp <- .apply (data = x@data[by [[1]], , drop = FALSE], MARGIN = 2, FUN = FUN, ...)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:14:19: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        tmp <- .apply (data = x@data[by [[1]], , drop = FALSE], MARGIN = 2, FUN = FUN, ...)
                      ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:16:5: [22m[34mstyle: [39m[1mVariable and function name style should be snake_case.[22m
        out.rows <- nrow (tmp) * length (by)
        ^~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:16:22: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        out.rows <- nrow (tmp) * length (by)
                         ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:16:37: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        out.rows <- nrow (tmp) * length (by)
                                        ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:19:23: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      data  <- x@data[rep (1, out.rows), , drop = FALSE] # preallocate memory
                          ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:20:17: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      data <- cbind (data, .aggregate = NA)
                    ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:21:25: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      col.aggregate <- ncol (data)
                            ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:25:17: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      for (i in seq (along = by)){
                    ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:25:29: [22m[34mstyle: [39m[1mThere should be a space between right parenthesis and an opening curly brace.[22m
      for (i in seq (along = by)){
                                ^~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:26:1: [22m[34mstyle: [39m[1mLines should not be more than 80 characters.[22m
        tmp <- .apply (data = x@data[by [[i]], , drop  = FALSE], MARGIN = 2, FUN = FUN, ...)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:26:19: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        tmp <- .apply (data = x@data[by [[i]], , drop  = FALSE], MARGIN = 2, FUN = FUN, ...)
                      ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:28:19: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        prows <- nrow (tmp) - 1
                      ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:32:19: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
          if (is.null (append.rows))
                      ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:33:28: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
            append.rows <- max (100, ceiling (1 - (i / length (by)) * out.rows))
                               ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:33:42: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
            append.rows <- max (100, ceiling (1 - (i / length (by)) * out.rows))
                                             ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:33:59: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
            append.rows <- max (100, ceiling (1 - (i / length (by)) * out.rows))
                                                              ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:34:7: [22m[34mstyle: [39m[1mVariable and function name style should be snake_case.[22m
          out.rows <- max (append.rows + out.rows, r + prows)
          ^~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:34:23: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
          out.rows <- max (append.rows + out.rows, r + prows)
                          ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:35:1: [22m[34mstyle: [39m[1mLines should not be more than 80 characters.[22m
          data  <- rbind (data, data [rep (1, out.rows - nrow (data)), , drop = FALSE])
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:35:22: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
          data  <- rbind (data, data [rep (1, out.rows - nrow (data)), , drop = FALSE])
                         ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:35:39: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
          data  <- rbind (data, data [rep (1, out.rows - nrow (data)), , drop = FALSE])
                                          ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:35:59: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
          data  <- rbind (data, data [rep (1, out.rows - nrow (data)), , drop = FALSE])
                                                              ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:36:15: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
          warning ("At", i, "of", length (by),
                  ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:36:38: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
          warning ("At", i, "of", length (by),
                                         ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:41:19: [22m[34mstyle: [39m[1mThere should be a space between right parenthesis and an opening curly brace.[22m
        if (prows >= 0){
                      ^~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:49:26: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      x@data <- data[seq_len (r - 1), , drop = FALSE]
                             ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:50:1: [22m[34mstyle: [39m[1mLines should not be more than 80 characters.[22m
      x@data[, col.aggregate] <- factor (x@data[, col.aggregate], levels = seq_along (by))
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:50:37: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      x@data[, col.aggregate] <- factor (x@data[, col.aggregate], levels = seq_along (by))
                                        ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:50:82: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      x@data[, col.aggregate] <- factor (x@data[, col.aggregate], levels = seq_along (by))
                                                                                     ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:52:16: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      if (!is.null (names (by)) && !any (is.na (names (by))))
                   ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:52:23: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      if (!is.null (names (by)) && !any (is.na (names (by))))
                          ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:52:37: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      if (!is.null (names (by)) && !any (is.na (names (by))))
                                        ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:52:44: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      if (!is.null (names (by)) && !any (is.na (names (by))))
                                               ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:52:51: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      if (!is.null (names (by)) && !any (is.na (names (by))))
                                                      ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:53:12: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        levels (x@data[, col.aggregate]) <- names (by)
               ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:53:47: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        levels (x@data[, col.aggregate]) <- names (by)
                                                  ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:113:1: [22m[34mstyle: [39m[1mLines should not be more than 80 characters.[22m
    ##' spc <- new ("hyperSpec", spc = sweep (matrix (rnorm (10*20), ncol = 20), 1, (1:10)*5, "+"))
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:133:34: [22m[34mstyle: [39m[1mThere should be a space between right parenthesis and an opening curly brace.[22m
    ##' weird.function <- function (x){
                                     ^~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:147:11: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
    setMethod ("aggregate", signature = signature (x = "hyperSpec"), .aggregate)
              ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:147:47: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
    setMethod ("aggregate", signature = signature (x = "hyperSpec"), .aggregate)
                                                  ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:150:7: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
    .test (.aggregate) <- function (){
          ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:150:32: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
    .test (.aggregate) <- function (){
                                   ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:150:33: [22m[34mstyle: [39m[1mThere should be a space between right parenthesis and an opening curly brace.[22m
    .test (.aggregate) <- function (){
                                    ^~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:151:11: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      context ("aggregate")
              ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:153:5: [22m[34mstyle: [39m[1mVariable and function name style should be snake_case.[22m
        cluster.means <- aggregate (chondro, chondro$clusters, mean_pm_sd)
        ^~~~~~~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:153:32: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        cluster.means <- aggregate (chondro, chondro$clusters, mean_pm_sd)
                                   ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:154:21: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        expect_true(all (is.na (cluster.means$y)))
                        ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:154:28: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        expect_true(all (is.na (cluster.means$y)))
                               ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:155:21: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        expect_true(all (is.na (cluster.means$x)))
                        ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:155:28: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        expect_true(all (is.na (cluster.means$x)))
                               ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:157:18: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        expect_equal (cluster.means$clusters, cluster.means$.aggregate)
                     ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:159:28: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        for (cluster in levels (chondro$clusters))
                               ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:160:25: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
          expect_equivalent (cluster.means [[cluster.means$clusters == cluster,]],
                            ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:160:76: [22m[34mstyle: [39m[1mCommas should always have a space after.[22m
          expect_equivalent (cluster.means [[cluster.means$clusters == cluster,]],
                                                                               ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:161:1: [22m[34mstyle: [39m[1mLines should not be more than 80 characters.[22m
                             apply (chondro [[chondro$clusters == cluster,]],2, mean_pm_sd))
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:161:32: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
                             apply (chondro [[chondro$clusters == cluster,]],2, mean_pm_sd))
                                   ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:161:71: [22m[34mstyle: [39m[1mCommas should always have a space after.[22m
                             apply (chondro [[chondro$clusters == cluster,]],2, mean_pm_sd))
                                                                          ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:161:74: [22m[34mstyle: [39m[1mCommas should always have a space after.[22m
                             apply (chondro [[chondro$clusters == cluster,]],2, mean_pm_sd))
                                                                             ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:164:13: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
      test_that ("FUN returning different numbers of values for different groups", {
                ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:165:1: [22m[34mstyle: [39m[1mLines should not be more than 80 characters.[22m
        spc <- new ("hyperSpec", spc = sweep (matrix (rnorm (10*20), ncol = 20), 1, (1:10)*5
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:165:16: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        spc <- new ("hyperSpec", spc = sweep (matrix (rnorm (10*20), ncol = 20), 1, (1:10)*5
                   ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:165:42: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        spc <- new ("hyperSpec", spc = sweep (matrix (rnorm (10*20), ncol = 20), 1, (1:10)*5
                                             ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:165:50: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        spc <- new ("hyperSpec", spc = sweep (matrix (rnorm (10*20), ncol = 20), 1, (1:10)*5
                                                     ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:165:57: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        spc <- new ("hyperSpec", spc = sweep (matrix (rnorm (10*20), ncol = 20), 1, (1:10)*5
                                                            ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:165:60: [22m[34mstyle: [39m[1mPut spaces around all infix operators.[22m
        spc <- new ("hyperSpec", spc = sweep (matrix (rnorm (10*20), ncol = 20), 1, (1:10)*5
                                                              ~^~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:165:87: [22m[34mstyle: [39m[1mPut spaces around all infix operators.[22m
        spc <- new ("hyperSpec", spc = sweep (matrix (rnorm (10*20), ncol = 20), 1, (1:10)*5
                                                                                         ~^~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:167:21: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        by <- as.factor (c (1, 1, 1, 1, 1, 1, 5, 1, 2, 2))
                        ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:167:24: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        by <- as.factor (c (1, 1, 1, 1, 1, 1, 5, 1, 2, 2))
                           ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:169:5: [22m[34mstyle: [39m[1mVariable and function name style should be snake_case.[22m
        weird.function <- function (x){
        ^~~~~~~~~~~~~~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:169:32: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        weird.function <- function (x){
                                   ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:169:34: [22m[34mstyle: [39m[1mThere should be a space between right parenthesis and an opening curly brace.[22m
        weird.function <- function (x){
                                     ^~
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:170:18: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
          if (length (x) == 1)
                     ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:172:23: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
          else if (length (x) == 2)
                          ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:178:37: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        expect_warning(agg <- aggregate (spc, by, weird.function))
                                        ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:179:22: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        agg <- aggregate (spc, by, weird.function, out.rows = 20L)
                         ^
    [1m/Users/erickoduniyi/Documents/Projects/opensource/hyperspec/hyperSpec/hyperSpec/R/aggregate.R:181:18: [22m[34mstyle: [39m[1mRemove spaces before the left parenthesis in a function call.[22m
        expect_equal (agg$.aggregate,
                     ^


To get a better sense of the types of style suggestions lintr is proposing:


```R
# Collect lintr suggestions
lint.sugg <- lint("aggregate.R")

# Turn suggestions into a data frame
lint.df <- as.data.frame(lint.comments)
head(lint.df)
```

Additionally, `lintr~ can be integrated with Atom's **Linter** for "on the fly linting":

![atom-lintr-example](https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/atom-lintr-example.png)

While lintr gives you comments and suggestions related to your code, itself does not make any changes. Hence, the user must decide whether the changes should be made or rejected. Though this is mostly a good thing, if your code base contains more than 100 files that need to be linted, reviewing and manually implementing these suggestions can be cumbersome. Luckily, [issue #96 - Consistent code style](https://github.com/cbeleites/hyperSpec/issues/96) hints at using the `styler` package.  

### 2.3. Applying `styler` to hyperSpec
The `styler` package helps R user systematically enfore style across single R files and even entire packages or directories.


```R
# Install the styler package from CRAN
install.packages("styler")
```

    also installing the dependencies ‘R.methodsS3’, ‘R.oo’, ‘R.utils’, ‘R.cache’, ‘rematch2’





    The downloaded binary packages are in
    	/var/folders/4_/gg3mjn693bz4v5w1sxh71rtc0000gp/T//RtmpltRTPs/downloaded_packages


The `styler` pacakge has a lot of customaization capability, and so it's possible to define your own style guide or style transformers that the package will enforce when styling code. For testing purposes, we'll adhere to the tidyverse style guidelines:


```R
# Load styler library
library(styler)

# Adhere do tidyverse style guide
tidyverse_style(
  scope = "tokens",
  strict = TRUE,
  indent_by = 2,
  start_comments_with_one_space = FALSE,
  reindention = tidyverse_reindention(),
  math_token_spacing = tidyverse_math_token_spacing()
)
```


<dl>
	<dt>$initialize</dt>
		<dd><strong>$initialize</strong> = <pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    initialize_newlines(pd_flat) %&gt;% initialize_spaces() %&gt;% </span>
<span style=white-space:pre-wrap>        remove_attributes(c("line1", "line2", "col1", "col2", </span>
<span style=white-space:pre-wrap>            "parent", "id")) %&gt;% initialize_multi_line() %&gt;% </span>
<span style=white-space:pre-wrap>        initialize_indention_ref_pos_id() %&gt;% initialize_indent() %&gt;% </span>
<span style=white-space:pre-wrap>        validate_parse_data()</span>
}</code></pre></dd>
	<dt>$line_break</dt>
		<dd><dl>
	<dt>$set_line_break_around_comma</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    comma_with_line_break_that_can_be_removed_before &lt;- (pd$token == </span>
<span style=white-space:pre-wrap>        "','") &amp; (pd$lag_newlines &gt; 0) &amp; (pd$token_before != </span>
<span style=white-space:pre-wrap>        "COMMENT") &amp; (lag(pd$token) != "'['")</span>
<span style=white-space:pre-wrap>    pd$lag_newlines[comma_with_line_break_that_can_be_removed_before] &lt;- 0L</span>
<span style=white-space:pre-wrap>    pd$lag_newlines[lag(comma_with_line_break_that_can_be_removed_before)] &lt;- 1L</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
	<dt>$set_line_break_before_curly_opening</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    line_break_to_set_idx &lt;- which((pd$token_after == "'{'") &amp; </span>
<span style=white-space:pre-wrap>        (pd$token != "COMMENT"))</span>
<span style=white-space:pre-wrap>    line_break_to_set_idx &lt;- setdiff(line_break_to_set_idx, nrow(pd))</span>
<span style=white-space:pre-wrap>    if (length(line_break_to_set_idx) &gt; 0) {</span>
<span style=white-space:pre-wrap>        is_not_curly_curly &lt;- map_chr(line_break_to_set_idx + </span>
<span style=white-space:pre-wrap>            1L, ~next_terminal(pd[.x, ], vars = "token_after")$token_after) != </span>
<span style=white-space:pre-wrap>            "'{'"</span>
<span style=white-space:pre-wrap>        last_expr_idx &lt;- max(which(pd$token == "expr"))</span>
<span style=white-space:pre-wrap>        is_last_expr &lt;- ifelse(pd$token[1] == "IF", TRUE, (line_break_to_set_idx + </span>
<span style=white-space:pre-wrap>            1L) == last_expr_idx)</span>
<span style=white-space:pre-wrap>        eq_sub_before &lt;- pd$token[line_break_to_set_idx] == "EQ_SUB"</span>
<span style=white-space:pre-wrap>        linebreak_before_curly &lt;- ifelse(is_function_call(pd), </span>
<span style=white-space:pre-wrap>            any(pd$lag_newlines[seq2(1, line_break_to_set_idx[1])] &gt; </span>
<span style=white-space:pre-wrap>                0), FALSE)</span>
<span style=white-space:pre-wrap>        should_be_on_same_line &lt;- is_not_curly_curly &amp; ((is_last_expr &amp; </span>
<span style=white-space:pre-wrap>            !linebreak_before_curly) | eq_sub_before)</span>
<span style=white-space:pre-wrap>        is_not_curly_curly_idx &lt;- line_break_to_set_idx[should_be_on_same_line]</span>
<span style=white-space:pre-wrap>        pd$lag_newlines[1 + is_not_curly_curly_idx] &lt;- 0L</span>
<span style=white-space:pre-wrap>        should_not_be_on_same_line &lt;- is_not_curly_curly &amp; ((!is_last_expr | </span>
<span style=white-space:pre-wrap>            linebreak_before_curly) &amp; !eq_sub_before)</span>
<span style=white-space:pre-wrap>        should_not_be_on_same_line_idx &lt;- line_break_to_set_idx[should_not_be_on_same_line]</span>
<span style=white-space:pre-wrap>        pd$lag_newlines[1 + should_not_be_on_same_line_idx] &lt;- 1L</span>
<span style=white-space:pre-wrap>        if (length(should_not_be_on_same_line_idx) &gt; 0) {</span>
<span style=white-space:pre-wrap>            comma_exprs_idx &lt;- which(pd$token == "','")</span>
<span style=white-space:pre-wrap>            comma_exprs_idx &lt;- setdiff(comma_exprs_idx, 1 + is_not_curly_curly_idx)</span>
<span style=white-space:pre-wrap>            non_comment_after_comma &lt;- map_int(comma_exprs_idx, </span>
<span style=white-space:pre-wrap>                next_non_comment, pd = pd)</span>
<span style=white-space:pre-wrap>            non_comment_after_expr &lt;- non_comment_after_comma[non_comment_after_comma &gt; </span>
<span style=white-space:pre-wrap>                should_not_be_on_same_line_idx[1]]</span>
<span style=white-space:pre-wrap>            pd$lag_newlines[non_comment_after_comma] &lt;- 1L</span>
<span style=white-space:pre-wrap>        }</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
	<dt>$remove_line_break_before_round_closing_after_curly</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    round_after_curly &lt;- pd$token == "')'" &amp; (pd$token_before == </span>
<span style=white-space:pre-wrap>        "'}'")</span>
<span style=white-space:pre-wrap>    pd$lag_newlines[round_after_curly] &lt;- 0L</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
	<dt>$remove_line_break_before_round_closing_fun_dec</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    if (is_function_dec(pd)) {</span>
<span style=white-space:pre-wrap>        round_after &lt;- pd$token == "')'" &amp; pd$token_before != </span>
<span style=white-space:pre-wrap>            "COMMENT"</span>
<span style=white-space:pre-wrap>        pd$lag_newlines[round_after] &lt;- 0L</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
	<dt>$style_line_break_around_curly</dt>
		<dd><pre class=language-r><code>structure(function (...)
{
<span style=white-space:pre-wrap>    env_bind(mask, ... = env_get(current_env(), "..."))</span>
<span style=white-space:pre-wrap>    eval_tidy(call, mask)</span>
}, class = c("purrr_function_partial", "function"), body = ~(function (strict,
<span style=white-space:pre-wrap>    pd) </span>
{
<span style=white-space:pre-wrap>    if (is_curly_expr(pd) &amp;&amp; nrow(pd) &gt; 2) {</span>
<span style=white-space:pre-wrap>        closing_before &lt;- pd$token == "'}'"</span>
<span style=white-space:pre-wrap>        opening_before &lt;- (pd$token == "'{'") &amp; (pd$token_after != </span>
<span style=white-space:pre-wrap>            "COMMENT")</span>
<span style=white-space:pre-wrap>        to_break &lt;- lag(opening_before, default = FALSE) | closing_before</span>
<span style=white-space:pre-wrap>        len_to_break &lt;- sum(to_break)</span>
<span style=white-space:pre-wrap>        pd$lag_newlines[to_break] &lt;- ifelse(rep(strict, len_to_break), </span>
<span style=white-space:pre-wrap>            1L, pmax(1L, pd$lag_newlines[to_break]))</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd</span>
})(strict, ...), fn = style_line_break_around_curly)</code></pre></dd>
	<dt>$set_line_break_around_curly_curly</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    if (is_curly_expr(pd)) {</span>
<span style=white-space:pre-wrap>        opening_before &lt;- (pd$token == "'{'") &amp; (pd$token_before == </span>
<span style=white-space:pre-wrap>            "'{'" | pd$token_after == "'{'")</span>
<span style=white-space:pre-wrap>        closing_before &lt;- (pd$token == "'}'") &amp; (pd$token_after == </span>
<span style=white-space:pre-wrap>            "'}'" | pd$token_before == "'}'")</span>
<span style=white-space:pre-wrap>        if (any(opening_before) &amp;&amp; any(closing_before)) {</span>
<span style=white-space:pre-wrap>            pd$lag_newlines[lag(opening_before, default = FALSE)] &lt;- 0L</span>
<span style=white-space:pre-wrap>            pd$lag_newlines[closing_before] &lt;- 0L</span>
<span style=white-space:pre-wrap>        }</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
	<dt>$set_line_break_after_opening_if_call_is_multi_line</dt>
		<dd><pre class=language-r><code>structure(function (...)
{
<span style=white-space:pre-wrap>    env_bind(mask, ... = env_get(current_env(), "..."))</span>
<span style=white-space:pre-wrap>    eval_tidy(call, mask)</span>
}, class = c("purrr_function_partial", "function"), body = ~(function (pd,
<span style=white-space:pre-wrap>    except_token_after = NULL, except_text_before = NULL) </span>
{
<span style=white-space:pre-wrap>    if (!is_function_call(pd) &amp;&amp; !is_subset_expr(pd)) {</span>
<span style=white-space:pre-wrap>        return(pd)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    npd &lt;- nrow(pd)</span>
<span style=white-space:pre-wrap>    seq_x &lt;- seq2(3L, npd - 1L)</span>
<span style=white-space:pre-wrap>    is_multi_line &lt;- any((pd$lag_newlines[seq_x] &gt; 0) | (pd$token[seq_x] == </span>
<span style=white-space:pre-wrap>        "COMMENT"))</span>
<span style=white-space:pre-wrap>    if (!is_multi_line) {</span>
<span style=white-space:pre-wrap>        return(pd)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    break_pos &lt;- find_line_break_position_in_multiline_call(pd)</span>
<span style=white-space:pre-wrap>    exception_pos &lt;- c(which(pd$token %in% except_token_after), </span>
<span style=white-space:pre-wrap>        ifelse(pd$child[[1]]$text[1] %in% except_text_before, </span>
<span style=white-space:pre-wrap>            break_pos, NA))</span>
<span style=white-space:pre-wrap>    pd$lag_newlines[setdiff(break_pos, exception_pos)] &lt;- 1L</span>
<span style=white-space:pre-wrap>    pd</span>
})(except_token_after = "COMMENT", except_text_before = c("switch",
<span style=white-space:pre-wrap>    "ifelse", "if_else"), ...), fn = set_line_break_after_opening_if_call_is_multi_line)</span></code></pre></dd>
	<dt>$set_line_break_before_closing_call</dt>
		<dd><pre class=language-r><code>structure(function (...)
{
<span style=white-space:pre-wrap>    env_bind(mask, ... = env_get(current_env(), "..."))</span>
<span style=white-space:pre-wrap>    eval_tidy(call, mask)</span>
}, class = c("purrr_function_partial", "function"), body = ~(function (pd,
<span style=white-space:pre-wrap>    except_token_before) </span>
{
<span style=white-space:pre-wrap>    if (!is_function_call(pd) &amp;&amp; !is_subset_expr(pd)) {</span>
<span style=white-space:pre-wrap>        return(pd)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    npd &lt;- nrow(pd)</span>
<span style=white-space:pre-wrap>    is_multi_line &lt;- any(pd$lag_newlines[seq2(3L, npd - 1L)] &gt; </span>
<span style=white-space:pre-wrap>        0)</span>
<span style=white-space:pre-wrap>    if (!is_multi_line) {</span>
<span style=white-space:pre-wrap>        exception &lt;- which(pd$token_before %in% except_token_before)</span>
<span style=white-space:pre-wrap>        pd$lag_newlines[setdiff(npd, exception)] &lt;- 0L</span>
<span style=white-space:pre-wrap>        return(pd)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd$lag_newlines[npd] &lt;- 1L</span>
<span style=white-space:pre-wrap>    pd</span>
})(except_token_before = "COMMENT", ...), fn = set_line_break_before_closing_call)</code></pre></dd>
	<dt>$remove_line_break_in_empty_fun_call</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    if (is_function_call(pd) &amp;&amp; nrow(pd) == 3) {</span>
<span style=white-space:pre-wrap>        pd$lag_newlines[3] &lt;- 0L</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
	<dt>$add_line_break_after_pipe</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    is_pipe &lt;- pd$token == c("SPECIAL-PIPE") &amp; pd$token_after != </span>
<span style=white-space:pre-wrap>        "COMMENT"</span>
<span style=white-space:pre-wrap>    if (sum(is_pipe) &gt; 1 &amp;&amp; !(next_terminal(pd, vars = "token_before")$token_before %in% </span>
<span style=white-space:pre-wrap>        c("'('", "EQ_SUB", "','"))) {</span>
<span style=white-space:pre-wrap>        pd$lag_newlines[lag(is_pipe)] &lt;- 1L</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
	<dt>$set_linebreak_after_ggplot2_plus</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    is_plus_raw &lt;- pd$token == "'+'"</span>
<span style=white-space:pre-wrap>    if (any(is_plus_raw)) {</span>
<span style=white-space:pre-wrap>        first_plus &lt;- which(is_plus_raw)[1]</span>
<span style=white-space:pre-wrap>        next_non_comment &lt;- next_non_comment(pd, first_plus)</span>
<span style=white-space:pre-wrap>        is_plus_or_comment_after_plus_before_fun_call &lt;- lag(is_plus_raw, </span>
<span style=white-space:pre-wrap>            next_non_comment - first_plus - 1, default = FALSE) &amp; </span>
<span style=white-space:pre-wrap>            (pd$token_after == "SYMBOL_FUNCTION_CALL" | pd$token_after == </span>
<span style=white-space:pre-wrap>                "SYMBOL_PACKAGE")</span>
<span style=white-space:pre-wrap>        if (any(is_plus_or_comment_after_plus_before_fun_call)) {</span>
<span style=white-space:pre-wrap>            gg_call &lt;- pd$child[[previous_non_comment(pd, first_plus)]]$child[[1]]</span>
<span style=white-space:pre-wrap>            if (!is.null(gg_call) &amp;&amp; isTRUE(gg_call$text[gg_call$token == </span>
<span style=white-space:pre-wrap>                "SYMBOL_FUNCTION_CALL"] == "ggplot")) {</span>
<span style=white-space:pre-wrap>                plus_without_comment_after &lt;- setdiff(which(is_plus_raw), </span>
<span style=white-space:pre-wrap>                  which(lead(pd$token == "COMMENT")))</span>
<span style=white-space:pre-wrap>                pd$lag_newlines[plus_without_comment_after + </span>
<span style=white-space:pre-wrap>                  1] &lt;- 1L</span>
<span style=white-space:pre-wrap>            }</span>
<span style=white-space:pre-wrap>        }</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
</dl>
</dd>
	<dt>$space</dt>
		<dd><dl>
	<dt>$indent_braces</dt>
		<dd><pre class=language-r><code>structure(function (...)
{
<span style=white-space:pre-wrap>    env_bind(mask, ... = env_get(current_env(), "..."))</span>
<span style=white-space:pre-wrap>    eval_tidy(call, mask)</span>
}, class = c("purrr_function_partial", "function"), body = ~(function (pd,
<span style=white-space:pre-wrap>    indent_by) </span>
{
<span style=white-space:pre-wrap>    indent_indices &lt;- compute_indent_indices(pd, token_opening = c("'('", </span>
<span style=white-space:pre-wrap>        "'['", "'{'"), token_closing = c("')'", "']'", "'}'"))</span>
<span style=white-space:pre-wrap>    pd$indent[indent_indices] &lt;- pd$indent[indent_indices] + </span>
<span style=white-space:pre-wrap>        indent_by</span>
<span style=white-space:pre-wrap>    set_unindention_child(pd, token = "')'", unindent_by = indent_by)</span>
})(indent_by = indent_by, ...), fn = indent_braces)</code></pre></dd>
	<dt>$unindent_fun_dec</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    if (is_function_dec(pd)) {</span>
<span style=white-space:pre-wrap>        idx_closing_brace &lt;- which(pd$token %in% "')'")</span>
<span style=white-space:pre-wrap>        fun_dec_head &lt;- seq2(2L, idx_closing_brace)</span>
<span style=white-space:pre-wrap>        pd$indent[fun_dec_head] &lt;- 0L</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
	<dt>$indent_op</dt>
		<dd><pre class=language-r><code>structure(function (...)
{
<span style=white-space:pre-wrap>    env_bind(mask, ... = env_get(current_env(), "..."))</span>
<span style=white-space:pre-wrap>    eval_tidy(call, mask)</span>
}, class = c("purrr_function_partial", "function"), body = ~(function (pd,
<span style=white-space:pre-wrap>    indent_by, token = c(math_token, logical_token, special_token, </span>
<span style=white-space:pre-wrap>        "LEFT_ASSIGN", "EQ_ASSIGN", "'$'")) </span>
{
<span style=white-space:pre-wrap>    indent_indices &lt;- compute_indent_indices(pd, token)</span>
<span style=white-space:pre-wrap>    pd$indent[indent_indices] &lt;- pd$indent[indent_indices] + </span>
<span style=white-space:pre-wrap>        indent_by</span>
<span style=white-space:pre-wrap>    pd</span>
})(indent_by = indent_by, ...), fn = indent_op)</code></pre></dd>
	<dt>$indent_eq_sub</dt>
		<dd><pre class=language-r><code>structure(function (...)
{
<span style=white-space:pre-wrap>    env_bind(mask, ... = env_get(current_env(), "..."))</span>
<span style=white-space:pre-wrap>    eval_tidy(call, mask)</span>
}, class = c("purrr_function_partial", "function"), body = ~(function (pd,
<span style=white-space:pre-wrap>    indent_by, token = c("EQ_SUB", "EQ_FORMALS")) </span>
{
<span style=white-space:pre-wrap>    eq_sub &lt;- which(pd$token %in% token)</span>
<span style=white-space:pre-wrap>    if (length(eq_sub) == 0) {</span>
<span style=white-space:pre-wrap>        return(pd)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    has_line_break &lt;- which(pd$lag_newlines &gt; 0)</span>
<span style=white-space:pre-wrap>    indent_indices &lt;- intersect(eq_sub + 1, has_line_break)</span>
<span style=white-space:pre-wrap>    pd$indent[indent_indices] &lt;- pd$indent[indent_indices] + </span>
<span style=white-space:pre-wrap>        indent_by</span>
<span style=white-space:pre-wrap>    pd</span>
})(indent_by = indent_by, ...), fn = indent_eq_sub)</code></pre></dd>
	<dt>$indent_without_paren</dt>
		<dd><pre class=language-r><code>structure(function (...)
{
<span style=white-space:pre-wrap>    env_bind(mask, ... = env_get(current_env(), "..."))</span>
<span style=white-space:pre-wrap>    eval_tidy(call, mask)</span>
}, class = c("purrr_function_partial", "function"), body = ~(function (pd,
<span style=white-space:pre-wrap>    indent_by = 2) </span>
{
<span style=white-space:pre-wrap>    pd %&gt;% indent_without_paren_for_while_fun(indent_by) %&gt;% </span>
<span style=white-space:pre-wrap>        indent_without_paren_if_else(indent_by)</span>
})(indent_by = indent_by, ...), fn = indent_without_paren)</code></pre></dd>
	<dt>$remove_space_before_closing_paren</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    paren_after &lt;- pd_flat$token %in% c("')'", "']'")</span>
<span style=white-space:pre-wrap>    if (!any(paren_after)) {</span>
<span style=white-space:pre-wrap>        return(pd_flat)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    paren_before &lt;- lead(paren_after, default = FALSE)</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[paren_before &amp; (pd_flat$newlines == 0L)] &lt;- 0L</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$remove_space_before_opening_paren</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    paren_after &lt;- pd_flat$token == "'('"</span>
<span style=white-space:pre-wrap>    if (!any(paren_after)) {</span>
<span style=white-space:pre-wrap>        return(pd_flat)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    paren_before &lt;- lead(paren_after, default = FALSE)</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[paren_before &amp; (pd_flat$newlines == 0L)] &lt;- 0L</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$add_space_after_for_if_while</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    comma_after &lt;- pd_flat$token %in% c("FOR", "IF", "WHILE")</span>
<span style=white-space:pre-wrap>    if (!any(comma_after)) {</span>
<span style=white-space:pre-wrap>        return(pd_flat)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    idx &lt;- comma_after &amp; (pd_flat$newlines == 0L)</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[idx] &lt;- pmax(pd_flat$spaces[idx], 1L)</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$add_space_before_brace</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    op_after &lt;- pd_flat$token %in% "'{'"</span>
<span style=white-space:pre-wrap>    if (!any(op_after)) {</span>
<span style=white-space:pre-wrap>        return(pd_flat)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    op_before &lt;- lead(op_after, default = FALSE)</span>
<span style=white-space:pre-wrap>    idx_before &lt;- op_before &amp; (pd_flat$newlines == 0L) &amp; pd_flat$token != </span>
<span style=white-space:pre-wrap>        "'('"</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[idx_before] &lt;- pmax(pd_flat$spaces[idx_before], </span>
<span style=white-space:pre-wrap>        1L)</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$remove_space_before_comma</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    comma_after &lt;- pd_flat$token == "','"</span>
<span style=white-space:pre-wrap>    if (!any(comma_after)) {</span>
<span style=white-space:pre-wrap>        return(pd_flat)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    comma_before &lt;- lead(comma_after, default = FALSE)</span>
<span style=white-space:pre-wrap>    idx &lt;- comma_before &amp; (pd_flat$newlines == 0L)</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[idx] &lt;- 0L</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$style_space_around_math_token</dt>
		<dd><pre class=language-r><code>structure(function (...)
{
<span style=white-space:pre-wrap>    env_bind(mask, ... = env_get(current_env(), "..."))</span>
<span style=white-space:pre-wrap>    eval_tidy(call, mask)</span>
}, class = c("purrr_function_partial", "function"), body = ~(function (strict,
<span style=white-space:pre-wrap>    zero, one, pd_flat) </span>
{
<span style=white-space:pre-wrap>    if (any(pd_flat$token %in% zero)) {</span>
<span style=white-space:pre-wrap>        pd_flat &lt;- pd_flat %&gt;% style_space_around_token(strict = TRUE, </span>
<span style=white-space:pre-wrap>            tokens = zero, level_before = 0L, level_after = 0L)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    if (any(pd_flat$token %in% one)) {</span>
<span style=white-space:pre-wrap>        pd_flat &lt;- pd_flat %&gt;% style_space_around_token(strict = strict, </span>
<span style=white-space:pre-wrap>            tokens = one, level_before = 1L, level_after = 1L)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd_flat</span>
})(strict, math_token_spacing$zero, math_token_spacing$one, ...), fn = style_space_around_math_token)</code></pre></dd>
	<dt>$style_space_around_tilde</dt>
		<dd><pre class=language-r><code>structure(function (...)
{
<span style=white-space:pre-wrap>    env_bind(mask, ... = env_get(current_env(), "..."))</span>
<span style=white-space:pre-wrap>    eval_tidy(call, mask)</span>
}, class = c("purrr_function_partial", "function"), body = ~(function (pd_flat,
<span style=white-space:pre-wrap>    strict) </span>
{
<span style=white-space:pre-wrap>    if (is_symmetric_tilde_expr(pd_flat)) {</span>
<span style=white-space:pre-wrap>        pd_flat &lt;- style_space_around_token(pd_flat, strict, </span>
<span style=white-space:pre-wrap>            "'~'", level_before = 1, level_after = 1)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    else if (is_asymmetric_tilde_expr(pd_flat)) {</span>
<span style=white-space:pre-wrap>        pd_flat &lt;- style_space_around_token(pd_flat, strict = TRUE, </span>
<span style=white-space:pre-wrap>            "'~'", level_before = 1, level_after = ifelse(nrow(pd_flat$child[[2]]) &gt; </span>
<span style=white-space:pre-wrap>                1, 1, 0))</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd_flat</span>
})(strict = strict, ...), fn = style_space_around_tilde)</code></pre></dd>
	<dt>$spacing_around_op</dt>
		<dd><pre class=language-r><code>structure(function (...)
{
<span style=white-space:pre-wrap>    env_bind(mask, ... = env_get(current_env(), "..."))</span>
<span style=white-space:pre-wrap>    eval_tidy(call, mask)</span>
}, class = c("purrr_function_partial", "function"), body = ~(function (pd_flat,
<span style=white-space:pre-wrap>    strict) </span>
{
<span style=white-space:pre-wrap>    pd_flat &lt;- add_space_after_comma(pd_flat)</span>
<span style=white-space:pre-wrap>    op_after &lt;- pd_flat$token %in% op_token</span>
<span style=white-space:pre-wrap>    op_before &lt;- lead(op_after, default = FALSE)</span>
<span style=white-space:pre-wrap>    op_after &lt;- op_after | pd_flat$token == "','"</span>
<span style=white-space:pre-wrap>    if (!any(op_after)) {</span>
<span style=white-space:pre-wrap>        return(pd_flat)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    if (sum(pd_flat$lag_newlines) &gt; 2 &amp;&amp; is_function_call(pd_flat) &amp;&amp; </span>
<span style=white-space:pre-wrap>        any(pd_flat$token %in% c("EQ_SUB", "','"))) {</span>
<span style=white-space:pre-wrap>        is_on_aligned_line &lt;- token_is_on_aligned_line(pd_flat)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    else {</span>
<span style=white-space:pre-wrap>        is_on_aligned_line &lt;- FALSE</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    must_have_space_before &lt;- op_before &amp; (pd_flat$newlines == </span>
<span style=white-space:pre-wrap>        0L) &amp; !is_on_aligned_line</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[must_have_space_before] &lt;- if (strict) {</span>
<span style=white-space:pre-wrap>        1L</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    else {</span>
<span style=white-space:pre-wrap>        pmax(pd_flat$spaces[must_have_space_before], 1L)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    must_have_space_after &lt;- op_after &amp; (pd_flat$newlines == </span>
<span style=white-space:pre-wrap>        0L) &amp; !is_on_aligned_line</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[must_have_space_after] &lt;- if (strict) {</span>
<span style=white-space:pre-wrap>        1L</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    else {</span>
<span style=white-space:pre-wrap>        pmax(pd_flat$spaces[must_have_space_after], 1L)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd_flat</span>
})(strict = strict, ...), fn = set_space_around_op)</code></pre></dd>
	<dt>$remove_space_after_opening_paren</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    paren_after &lt;- pd_flat$token %in% c("'('", "'['", "LBB")</span>
<span style=white-space:pre-wrap>    if (!any(paren_after)) {</span>
<span style=white-space:pre-wrap>        return(pd_flat)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[paren_after &amp; (pd_flat$newlines == 0L)] &lt;- 0L</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$remove_space_after_excl</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    excl &lt;- (pd_flat$token == "'!'") &amp; (pd_flat$token_after != </span>
<span style=white-space:pre-wrap>        "'!'") &amp; (pd_flat$newlines == 0L)</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[excl] &lt;- 0L</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$set_space_after_bang_bang</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    last_bang &lt;- (pd_flat$token == "'!'") &amp; (pd_flat$token_after != </span>
<span style=white-space:pre-wrap>        "'!'") &amp; (pd_flat$newlines == 0L) &amp; (pd_flat$token_before == </span>
<span style=white-space:pre-wrap>        "'!'")</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[last_bang] &lt;- 0L</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$remove_space_before_dollar</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    dollar_after &lt;- (pd_flat$token == "'$'") &amp; (pd_flat$lag_newlines == </span>
<span style=white-space:pre-wrap>        0L)</span>
<span style=white-space:pre-wrap>    dollar_before &lt;- lead(dollar_after, default = FALSE)</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[dollar_before] &lt;- 0L</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$remove_space_after_fun_dec</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    fun_after &lt;- (pd_flat$token == "FUNCTION") &amp; (pd_flat$lag_newlines == </span>
<span style=white-space:pre-wrap>        0L)</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[fun_after] &lt;- 0L</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$remove_space_around_colons</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    one_two_or_three_col_after &lt;- pd_flat$token %in% c("':'", </span>
<span style=white-space:pre-wrap>        "NS_GET_INT", "NS_GET")</span>
<span style=white-space:pre-wrap>    one_two_or_three_col_before &lt;- lead(one_two_or_three_col_after, </span>
<span style=white-space:pre-wrap>        default = FALSE)</span>
<span style=white-space:pre-wrap>    col_around &lt;- one_two_or_three_col_before | one_two_or_three_col_after</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[col_around &amp; (pd_flat$newlines == 0L)] &lt;- 0L</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$start_comments_with_space</dt>
		<dd><pre class=language-r><code>structure(function (...)
{
<span style=white-space:pre-wrap>    env_bind(mask, ... = env_get(current_env(), "..."))</span>
<span style=white-space:pre-wrap>    eval_tidy(call, mask)</span>
}, class = c("purrr_function_partial", "function"), body = ~(function (pd,
<span style=white-space:pre-wrap>    force_one = FALSE) </span>
{
<span style=white-space:pre-wrap>    comment_pos &lt;- is_comment(pd) &amp; !is_shebang(pd) &amp; !is_code_chunk_header(pd)</span>
<span style=white-space:pre-wrap>    if (!any(comment_pos)) {</span>
<span style=white-space:pre-wrap>        return(pd)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    comments &lt;- rematch2::re_match(pd$text[comment_pos], "^(?&lt;prefix&gt;#+['\\*]*)(?&lt;space_after_prefix&gt; *)(?&lt;text&gt;.*)$")</span>
<span style=white-space:pre-wrap>    comments$space_after_prefix &lt;- nchar(comments$space_after_prefix, </span>
<span style=white-space:pre-wrap>        type = "width")</span>
<span style=white-space:pre-wrap>    comments$space_after_prefix &lt;- set_spaces(spaces_after_prefix = comments$space_after_prefix, </span>
<span style=white-space:pre-wrap>        force_one)</span>
<span style=white-space:pre-wrap>    pd$text[comment_pos] &lt;- paste0(comments$prefix, map_chr(comments$space_after_prefix, </span>
<span style=white-space:pre-wrap>        rep_char, char = " "), comments$text) %&gt;% trimws("right")</span>
<span style=white-space:pre-wrap>    pd$short[comment_pos] &lt;- substr(pd$text[comment_pos], 1, </span>
<span style=white-space:pre-wrap>        5)</span>
<span style=white-space:pre-wrap>    pd</span>
})(force_one = start_comments_with_one_space, ...), fn = start_comments_with_space)</code></pre></dd>
	<dt>$remove_space_after_unary_pm_nested</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    if (any(pd$token[1] %in% c("'+'", "'-'"))) {</span>
<span style=white-space:pre-wrap>        pd$spaces[1] &lt;- 0L</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
	<dt>$spacing_before_comments</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    comment_after &lt;- (pd_flat$token == "COMMENT") &amp; (pd_flat$lag_newlines == </span>
<span style=white-space:pre-wrap>        0L)</span>
<span style=white-space:pre-wrap>    if (!any(comment_after)) {</span>
<span style=white-space:pre-wrap>        return(pd_flat)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    comment_before &lt;- lead(comment_after, default = FALSE)</span>
<span style=white-space:pre-wrap>    pd_flat$spaces[comment_before &amp; (pd_flat$newlines == 0L)] &lt;- 1L</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$set_space_between_levels</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    if (pd_flat$token[1] %in% c("FUNCTION", "IF", "WHILE")) {</span>
<span style=white-space:pre-wrap>        index &lt;- pd_flat$token == "')'" &amp; pd_flat$newlines == </span>
<span style=white-space:pre-wrap>            0L</span>
<span style=white-space:pre-wrap>        pd_flat$spaces[index] &lt;- 1L</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    else if (pd_flat$token[1] == "FOR") {</span>
<span style=white-space:pre-wrap>        index &lt;- pd_flat$token == "forcond" &amp; pd_flat$newlines == </span>
<span style=white-space:pre-wrap>            0</span>
<span style=white-space:pre-wrap>        pd_flat$spaces[index] &lt;- 1L</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$set_space_between_eq_sub_and_comma</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    op_before &lt;- which(pd$token == "EQ_SUB" &amp; lead(pd$token == </span>
<span style=white-space:pre-wrap>        "','"))</span>
<span style=white-space:pre-wrap>    pd$spaces[op_before] &lt;- 1L</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
	<dt>$set_space_in_curly_curly</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    if (is_curly_expr(pd)) {</span>
<span style=white-space:pre-wrap>        after_inner_opening &lt;- pd$token == "'{'" &amp; pd$token_before == </span>
<span style=white-space:pre-wrap>            "'{'"</span>
<span style=white-space:pre-wrap>        before_inner_closing &lt;- lead(pd$token == "'}'" &amp; pd$token_after == </span>
<span style=white-space:pre-wrap>            "'}'")</span>
<span style=white-space:pre-wrap>        is_curly_curly_inner &lt;- any(after_inner_opening, na.rm = TRUE) &amp;&amp; </span>
<span style=white-space:pre-wrap>            any(before_inner_closing, na.rm = TRUE)</span>
<span style=white-space:pre-wrap>        if (is_curly_curly_inner) {</span>
<span style=white-space:pre-wrap>            pd$spaces[after_inner_opening] &lt;- 1L</span>
<span style=white-space:pre-wrap>            pd$spaces[before_inner_closing] &lt;- 1L</span>
<span style=white-space:pre-wrap>        }</span>
<span style=white-space:pre-wrap>        after_outer_opening &lt;- pd$token == "'{'" &amp; pd$token_after == </span>
<span style=white-space:pre-wrap>            "'{'"</span>
<span style=white-space:pre-wrap>        before_outer_closing &lt;- lead(pd$token == "'}'" &amp; pd$token_before == </span>
<span style=white-space:pre-wrap>            "'}'")</span>
<span style=white-space:pre-wrap>        is_curly_curly_outer &lt;- any(after_outer_opening, na.rm = TRUE) &amp;&amp; </span>
<span style=white-space:pre-wrap>            any(before_outer_closing, nna.rm = TRUE)</span>
<span style=white-space:pre-wrap>        if (is_curly_curly_outer) {</span>
<span style=white-space:pre-wrap>            pd$spaces[after_outer_opening] &lt;- 0L</span>
<span style=white-space:pre-wrap>            pd$spaces[before_outer_closing] &lt;- 0L</span>
<span style=white-space:pre-wrap>        }</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
</dl>
</dd>
	<dt>$token</dt>
		<dd><dl>
	<dt>$fix_quotes</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    str_const &lt;- which(pd_flat$token == "STR_CONST")</span>
<span style=white-space:pre-wrap>    if (is_empty(str_const)) {</span>
<span style=white-space:pre-wrap>        return(pd_flat)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd_flat$text[str_const] &lt;- map(pd_flat$text[str_const], fix_quotes_one)</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$force_assignment_op</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    to_replace &lt;- pd$token == "EQ_ASSIGN"</span>
<span style=white-space:pre-wrap>    pd$token[to_replace] &lt;- "LEFT_ASSIGN"</span>
<span style=white-space:pre-wrap>    pd$text[to_replace] &lt;- "&lt;-"</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
	<dt>$resolve_semicolon</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    is_semicolon &lt;- pd$token == "';'"</span>
<span style=white-space:pre-wrap>    if (!any(is_semicolon)) {</span>
<span style=white-space:pre-wrap>        return(pd)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd$lag_newlines[lag(is_semicolon)] &lt;- 1L</span>
<span style=white-space:pre-wrap>    pd &lt;- pd[!is_semicolon, ]</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
	<dt>$add_brackets_in_pipe</dt>
		<dd><pre class=language-r><code>function (pd)
{
<span style=white-space:pre-wrap>    is_pipe &lt;- pd$token == "SPECIAL-PIPE"</span>
<span style=white-space:pre-wrap>    Reduce(add_brackets_in_pipe_one, which(is_pipe), init = pd)</span>
}</code></pre></dd>
	<dt>$remove_terminal_token_before_and_after</dt>
		<dd><pre class=language-r><code>function (pd_flat)
{
<span style=white-space:pre-wrap>    pd_flat$token_before &lt;- NULL</span>
<span style=white-space:pre-wrap>    pd_flat$token_after &lt;- NULL</span>
<span style=white-space:pre-wrap>    pd_flat</span>
}</code></pre></dd>
	<dt>$wrap_if_else_while_for_fun_multi_line_in_curly</dt>
		<dd><pre class=language-r><code>function (pd, indent_by = 2)
{
<span style=white-space:pre-wrap>    key_token &lt;- when(pd, is_cond_expr(.) ~ "')'", is_while_expr(.) ~ </span>
<span style=white-space:pre-wrap>        "')'", is_for_expr(.) ~ "forcond", is_function_dec(.) ~ </span>
<span style=white-space:pre-wrap>        "')'")</span>
<span style=white-space:pre-wrap>    if (length(key_token) &gt; 0) {</span>
<span style=white-space:pre-wrap>        pd &lt;- pd %&gt;% wrap_multiline_curly(indent_by, space_after = ifelse(contains_else_expr(pd), </span>
<span style=white-space:pre-wrap>            1, 0), key_token = key_token)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    if (is_cond_expr(pd)) {</span>
<span style=white-space:pre-wrap>        pd &lt;- pd %&gt;% wrap_else_multiline_curly(indent_by, space_after = 0)</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd</span>
}</code></pre></dd>
</dl>
</dd>
	<dt>$indention</dt>
		<dd><strong>$update_indention_ref_fun_dec</strong> = <pre class=language-r><code>function (pd_nested)
{
<span style=white-space:pre-wrap>    if (pd_nested$token[1] == "FUNCTION") {</span>
<span style=white-space:pre-wrap>        seq &lt;- seq2(3, nrow(pd_nested) - 2)</span>
<span style=white-space:pre-wrap>        pd_nested$indention_ref_pos_id[seq] &lt;- pd_nested$pos_id[2]</span>
<span style=white-space:pre-wrap>    }</span>
<span style=white-space:pre-wrap>    pd_nested</span>
}</code></pre></dd>
	<dt>$use_raw_indention</dt>
		<dd>FALSE</dd>
	<dt>$reindention</dt>
		<dd><dl>
	<dt>$indention</dt>
		<dd>0</dd>
	<dt>$comments_only</dt>
		<dd>TRUE</dd>
</dl>
</dd>
	<dt>$style_guide_name</dt>
		<dd>'styler::tidyverse_style@https://github.com/r-lib'</dd>
	<dt>$style_guide_version</dt>
		<dd>'1.3.2'</dd>
</dl>




```R
# Perform directory level styling
style_dir(getwd(), transformers = tidyverse_style(strict = TRUE))
```

    Styling  112  files:
     aggregate.R            ℹ
     all.equal.R            ℹ
     apply.R                ℹ
     Arith.R                ℹ
     as.data.frame.R        ℹ
     barbiturates.R         ℹ
     bind.R                 ℹ
     call.list.R            ℹ
     chk.hy.R               ℹ
     chondro.R              ℹ
     collapse.R             ℹ
     colMeans.R             ℹ
     Compare.R              ℹ
     count_lines.R          ℹ
     cov.R                  ℹ
     decomposition.R        ℹ
     deprecated.R           ℹ
     dim.R                  ℹ
     dimnames.R             ℹ
     DollarNames.R          ℹ
     droplevels.R           ℹ
     empty.R                ℹ
     extract.R              ℹ
     factor2num.R           ℹ
     fileio.optional.R      ℹ
     fix_spc_colnames.R     ℹ
     flu.R                  ℹ
     getbynames.R           ℹ
     guesswavelength.R      ℹ
     hyperspec-class.R      ℹ
     hyperspec-package.R    ℹ
     initialize.R           ℹ
     labels.R               ℹ
     laser.R                ℹ
     levelplot.R            ℹ
     makeraster.R           ℹ
     map.identify.R         ℹ
     map.sel.poly.R         ℹ
     mark.dendrogram.R      ℹ
     mark.peak.R            ℹ
     Math.R                 ℹ
     matlab.palette.R       ℹ
     mean_sd.R              ℹ
     merge.R                ℹ
     mvtnorm.R              ℹ
     normalize01.R          ℹ
     options.R              ℹ
     orderwl.R              ℹ
     paracetamol.R          ℹ
     paste.row.R            ℹ
     pearson.dist.R         ℹ
     plot.R                 ℹ
     plotc.R                ℹ
     plotmap.R              ℹ
     plotmat.R              ℹ
     plotspc.R              ℹ
     plotvoronoi.R          ℹ
     qplot.R                ℹ
     qplotmixmap.R          ℹ
     quantile.R             ℹ
     rbind.fill.R           ℹ
     read.asc.Andor.R       ℹ
     read.asc.PerkinElmer.R ℹ
     read.ENVI.HySpex.R     ℹ
     read.ENVI.Nicolet.R    ℹ
     read.ENVI.R            ℹ
     read.ini.R             ℹ
     read.jdx.R             ℹ
     read.mat.Cytospec.R    ℹ
     read.mat.Witec.R       ℹ
     read.spc.Kaiser.R      ℹ
     read.spc.R             ℹ
     read.spc.Shimadzu.R    ℹ
     read.spe.R             ℹ
     read.txt.Horiba.R      ℹ
     read.txt.long.R        ℹ
     read.txt.Renishaw.R    ℹ
     read.txt.Shimadzu.R    ℹ
     read.txt.wide.R        ℹ
     read.txt.Witec.R       ℹ
     regexps.R              ✔
     replace.R              ℹ
     sample.R               ℹ
     scale.R                ℹ
     seq.R                  ℹ
     show.R                 ℹ
     spc.bin.R              ℹ
     spc.fit.poly.R         ℹ
     spc.identify.R         ℹ
     spc.loess.R            ℹ
     spc.NA.approx.R        ℹ
     spc.rubberband.R       ℹ
     spc.spline.R           ℹ
     split.R                ℹ
     split.string.R         ℹ
     splitdots.R            ℹ
     subset.R               ℹ
     Summary.R              ℹ
     sweep.R                ℹ
     trellis.factor.key.R   ℹ
     units.R                ℹ
     unittest.R             ℹ
     validate.R             ℹ
     vandermonde.R          ℹ
     wc.R                   ℹ
     wl.R                   ℹ
     wl2i.R                 ℹ
     wleval.R               ℹ
     write.txt.long.R       ℹ
     write.txt.wide.R       ℹ
     y-pastenames.R         ℹ
     zzz.R                  ℹ
    ────────────────────────────────────────
    Status	Count	Legend
    ✔ 	1	File unchanged.
    ℹ 	111	File changed.
    ✖ 	0	Styling threw an error.
    ────────────────────────────────────────
    Please review the changes carefully!


Neat! `styler` outputs the changes it made and encourages users to review changes carefully!

## 3. Hard
**Task:** _Tackle one of the "good first issues" in the hyperSpec.tidyverse issue thread_

---

### 3.1. Contributing to the hyperSpec.tidyverse project
The goal of the hyperSpec.tidyverse project is to create an R package that makes hyperSpec (hyperSpec objects) work smoothly with the **tidyverse**. Practically, this means making analog **tidyverse/dplyr** functions (e.g., `select()`, `rename()`, `mutate()`, `transmute()`, etc.) for hyperSpec objects. In the end, the hope is to support "wrangling of hyperSpec objects in a `dplyr`-like style".
![](https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/dplyr.functions.png)

### 3.2. Picking a "good first issue"
I decided to tackle [issue #5 - `dplyr::rename()`](https://github.com/cbeleites/hyperSpec.tidyverse/issues/5) because it was the first "good first issue" and although I'm not super familiar with tidyverse/dplyr, `rename()` seems like a straightforward function to implement.
![github-issue](https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/github-good-issue.png)

### 3.3. Creating a structure to work on hyperSpec.tidyverse
I like to use [Atom](https://en.wikipedia.org/wiki/Atom_(text_editor)) to manage projects and quickly develop coding ideas and RStudio for concrete implementation. Of course, before I can start working on my contribution I need to do:
* Fork hyperSpec.tidyverse repository
* Clone hyperSpec.tidyverse repository locally (i.e., computer hardrive)
* View project in Atom
* Open project in RStudio

### 3.4. Software Description
The task is to create a fortified version of `dplyr::rename()` so that it works smoothly with hyperSpec objects.

<img src="https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/use-case-rename.png" alt="Smiley face" height="500px" width="500px">

#### 3.4.1. The nature of `rename()` and `select()`
The `dplyr` package is a grammar of data manipulation. This makes common data manipulation task intuitive. Unsurprisingly, R users often want to rename the columns of their data frames or even select subsets of their tables to do more fine-grained analysis. It turns outs, these two operations are pretty similar.

#### 3.4.2. `dplyr::rename()`


```R
# Load dplyr and test data package
library(dplyr)
library(hflights)
```


    Attaching package: ‘dplyr’


    The following objects are masked from ‘package:stats’:

        filter, lag


    The following objects are masked from ‘package:base’:

        intersect, setdiff, setequal, union





```R
# Create a data frame using test data
df <- data.frame(hflights)[1:3, 1:3]
df
```


<table>
<caption>A data.frame: 3 × 3</caption>
<thead>
	<tr><th></th><th scope=col>Year</th><th scope=col>Month</th><th scope=col>DayofMonth</th></tr>
	<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>5424</th><td>2011</td><td>1</td><td>1</td></tr>
	<tr><th scope=row>5425</th><td>2011</td><td>1</td><td>2</td></tr>
	<tr><th scope=row>5426</th><td>2011</td><td>1</td><td>3</td></tr>
</tbody>
</table>




```R
# Rename columns of data frame
df %>% rename(YearNewColName = Year) # same as rename(df, YearNewColName = Year)
```


<table>
<caption>A data.frame: 3 × 3</caption>
<thead>
	<tr><th></th><th scope=col>YearNewColName</th><th scope=col>Month</th><th scope=col>DayofMonth</th></tr>
	<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>5424</th><td>2011</td><td>1</td><td>1</td></tr>
	<tr><th scope=row>5425</th><td>2011</td><td>1</td><td>2</td></tr>
	<tr><th scope=row>5426</th><td>2011</td><td>1</td><td>3</td></tr>
</tbody>
</table>



Observe `df %>% rename(NewColName = OldColName, ...)` only operates on the column names of the data frame and so while the column names of the data frame may be changed, the number of columns is preserved. So, if I pass in a $n x m$ data frame to `rename()`, then the result will be an $n x m$ data frame. `dplyr::rename()` is equivalent to:

```{R}
names(df)[names(df) == "OldColName"] <- "NewColName"
```

#### 3.4.3. `dplyr::select()`


```R
# Select columns of data frame
df %>% select(Year) # same as select(df, year)
```


<table>
<caption>A data.frame: 3 × 1</caption>
<thead>
	<tr><th></th><th scope=col>Year</th></tr>
	<tr><th></th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>5424</th><td>2011</td></tr>
	<tr><th scope=row>5425</th><td>2011</td></tr>
	<tr><th scope=row>5426</th><td>2011</td></tr>
</tbody>
</table>



Observe `df %>% select(ColName1, ColName2, ...)` selects a subset of the columns as specified by the column names. Thus, select operates on the entire data frame. So, if I pass in a $n x m$ data frame, then the result will be a data frame with $\#colsselected x m$. `dplyr::select()` is equivalent to:

```{R}
df[names(df) == "OldColName"]
```
However, you can use `select()` to also rename columns. That is, you can give new names to the selected subset:
`df %>% select(NewColName = OldColName, ...)` is equivalent to:

```{R}
df <- df[names(df) == "OldColName"]
names(df)[names(df) == "OldColName"] <- "NewColName"
```


```R
# Rename column with select
df %>% select(YearNewColName = Year)
```


<table>
<caption>A data.frame: 3 × 1</caption>
<thead>
	<tr><th></th><th scope=col>YearNewColName</th></tr>
	<tr><th></th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>5424</th><td>2011</td></tr>
	<tr><th scope=row>5425</th><td>2011</td></tr>
	<tr><th scope=row>5426</th><td>2011</td></tr>
</tbody>
</table>



### 3.5. Function Design

#### 3.5.1. The nature of `rename()` and `select()` cont.
While both `rename()` and `select()` operate on data frames (i.e., tables with column names) the difference between the two functions is that the former only changes column names of the data frame while the latter creates a subset of the data frame; in doing so, the names (column names) of these subsets can be changed as well.

#### 3.5.2. `rename()` and `select()` for hyperSpec
What does this mean for hyperSpec objects? Well, hyperSpec objects are a S4 class that contain 4 slots:
@wavelength, @data, @labels, and @log.
* @wavelength - numeric vector
* @data - a data frame with the spectra matrix ($spc)
* @labels - list of appropriate labels
* @log - ...

#### 3.5.3. Nature of hyperSpec objects
In fact, the hyperSpec packages comes with five data sets (hyperSpec objects):
* **chondro** - a Raman map of chondrocytes in cartilage
* **flu** - a set of fluorescence spectra of a calibration series
* **laser** - a time series of an unstable laser emission
* **paracetamol** - a Raman spectrum of paracetamol (acetaminophene) ranging from 100 to 3200 cm−1 with overlapping wavelength ranges.
* **barbiturates** - GC-MS spectra with differing wavelength axes as a list of 286 hyperSpec objects

Let's take a look at the structure of these objects:


```R
# Load hyperSpec, Data Explorer, networkD3, and cli packages
library(hyperSpec)
library(DataExplorer)
library(networkD3)
library(cli)

# Create a function for exploring the structure hyperSpec objects
explore.object <- function(obj){
    print(obj)
    diagonalNetwork(plot_str(obj, print_network = FALSE))
}

# Take a look at the five hyperSpec objects
print("chondro")
explore.object(chondro)
```

    [1] "chondro"
    hyperSpec object
       875 spectra
       5 data columns
       300 data points / spectrum
    wavelength: Delta * tilde(nu)/cm^-1 [numeric] 602 606 ... 1798
    data:  (875 rows x 5 columns)
       1. y: y [numeric] -4.77 -4.77 ... 19.23
       2. x: x [numeric] -11.55 -10.55 ... 22.45
       3. filename: filename [character] rawdata/chondro.txt rawdata/chondro.txt ... rawdata/chondro.txt
       4. clusters: clusters [factor] matrix matrix ... lacuna + NA
       5. spc: I / a.u. [matrix300] 501.8194 500.4552 ... 169.2942
![](./img/chondro-graph.png)




So, not only does a hyperSpec object have to contain the 4 slots mentioned above, the `@data` slot must also contain the spectra matrix (`hyperSpecObject@data$spc`). Accordingly, the dplyr operations `rename()` and `select()` should only augment the `@data` slot. However, augmenting the data slot augments the `@label` slot. In other words, if I'm going to create a function that changes the column names of the data frame using `dplyr::rename()`, the function must also ensure that the spc column is **not** renamed and that the labels are correctly updated. Then, a function design (pseudo-code) for `rename.hyperSpec()` should look like this:

```{R}
# Function design for rename.hyperSpec()
rename.hyperSpec() <- function(hyperSpecObject){
  # Check if user passed in a hyperSpec object
  chk.hy(hyperSpecObject)
  # Use dplyr::rename() to rename hyperSpec object data slot
  res <- dplyr::rename(hyperSpecObject@data, ...)
  # Check if $spc was renamed
  if(spc.name.changed(res)){
    # Throw an error
    error("spc has been renamed")
  }else{
    # Update the data slot with newly renamed data frame
    hyperSpecObject@data <- res
    # Update labels of the hyperSpec object
    labels(hyperSpecObject) <- update.labels(hyperSpecObject)
    # Return hyperSpec object
    return{hyperSpecObject}
  }
}
```

### 3.6. Function Implementation
A few `dplyr` operations have already been implemented for hyperSpec (e.g., `filter.hyperSpec()` and `select.hyperSpec()`). Fortunately, `dplyr::select()` and `dplyr::rename()` are similar operations, so hyperSpec's implementation of `select()` should be a good guide to follow for `rename()`.
![](https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/select.hyperSpec.example.png)

Using the above-mentioned function requirements and function design for `rename.hySpec()` and `select.hyperSpec` as a guide, an implementation of `rename()` could be the following:


```R
# Function implementation for rename.hyperSpec()
rename.hyperSpec <- function(.data, ...){
  # Check if user passed in a hyperSpec object
  chk.hy(.data)
  # Use dplyr::rename() to rename hyperSpec object data slot
  res <- rename(.data@data, ...)
  # Check if $spc was renamed
  if(!'spc' %in% colnames(res)){
    # Throw an error
    stop("$spc cannot be renamed")
  }else{
    # Get new and current column names
    labels.to.update <- setdiff(colnames(res), colnames(.data))
    labels.to.remove <- setdiff(colnames(.data), colnames(res))
    # Update the data slot with newly renamed data frame
    .data@data <- res
    # Update labels of hyperSpec object
    new.labels <- lapply(labels(.data, labels.to.update), as.expression)
    labels(.data)[c(labels.to.remove)] <- NULL
    labels(.data)[c(labels.to.update)] <- new.labels
    .data
  }
}
```


```R
# Rename data frame of hyperSpec object
chondro %>% rename.hyperSpec(region = clusters)
chondro %>% rename.hyperSpec(spc2 = spc) # should throw an error
```


    hyperSpec object
       875 spectra
       5 data columns
       300 data points / spectrum
    wavelength: Delta * tilde(nu)/cm^-1 [numeric] 602 606 ... 1798
    data:  (875 rows x 5 columns)
       1. y: y [numeric] -4.77 -4.77 ... 19.23
       2. x: x [numeric] -11.55 -10.55 ... 22.45
       3. filename: filename [character] rawdata/chondro.txt rawdata/chondro.txt ... rawdata/chondro.txt
       4. region: region [factor] matrix matrix ... lacuna + NA
       5. spc: I / a.u. [matrix300] 501.8194 500.4552 ... 169.2942



    Error in rename.hyperSpec(., spc2 = spc): $spc cannot be renamed
    Traceback:


    1. chondro %>% rename.hyperSpec(spc2 = spc)

    2. withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))

    3. eval(quote(`_fseq`(`_lhs`)), env, env)

    4. eval(quote(`_fseq`(`_lhs`)), env, env)

    5. `_fseq`(`_lhs`)

    6. freduce(value, `_function_list`)

    7. withVisible(function_list[[k]](value))

    8. function_list[[k]](value)

    9. rename.hyperSpec(., spc2 = spc)

    10. stop("$spc cannot be renamed")   # at line 9 of file <text>


### 3.7. Testing and Validation
Now that `rename()` has been implemented it's important to test the code. Unit testing (UT) is an automated procedure for checking the correctness of pieces/components/cases of a function/module. The life cycle of UT and code development could like the following:

$$\mbox{function implementation} \leftrightarrow \mbox{unit test} \leftrightarrow \mbox{check test} \leftrightarrow \mbox{update implementation}$$

**Note:** _It's important to know whether or not there is a problem with your code or the unit test your wrote for the code._

#### 3.7.1. Writing unit test in R
In R, UT is carried out through the `testthat` package. The basic structure of `testthat` test are the following:
```{R}
test_that("a description of my test", {
        expect_condition(function_name(parameter), expected_result))
    })
```

See Hadley Wickham's [Testing chapter](https://r-pkgs.org/tests.html) to get more information about setting up unit testing for R. Additionally, André Müller's ["Unit Testing in R"](https://towardsdatascience.com/unit-testing-in-r-68ab9cc8d211) is a helpful resource for R test development.

#### 3.7.2. Writing unit test for `rename.hyperSpec()`
Because the column renaming functionality is provided by `dplyr::rename()` I don't need to test if that works (it's already being [tested](https://github.com/tidyverse/dplyr/blob/master/tests/testthat/test-rename.R)). Instead, the main things I want to test is that `rename()` doesn't allow the renaming of `$spc` and that when the columns of the data frame are renamed the labels are correctly updated:
![](https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/rename.hyperSpec.unittest.png)

Certainly there are more test I could write for `rename()`, but I think these three are a good start. We can use `covr` to check the testing coverage:
![](https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/hyperSpec.test-coverage.png)

**Note:** _"One hundred percent unit test coverage does not mean we had good tests, or even that the tests are complete. The tests could be missing important data and only testing with data that succeeds, failing to test data that causes failures. One hundred percent unit test coverage doesn’t say anything about missing code, missing error handling, or missing requirements."_ -  John Ruberto

### 3.8. Documentation
Now that the function has been implemented and tested the last thing to do is document the function and provide an example is the package vingette. RStudio and the `roxygen` package makes it easy to build documentation for functions and packages:
![](https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/rename.hyperSpec.implement.png)
![](https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/document.rename.hyperSpec.png)

The documentation output generated by `roxygen` can be viewed [here](https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/hyperSpec_tidyverse.html)

### 3.4. Submitting a pull request for `rename.R`
The last thing to do is commit and then submit a pull request for rename.R and wait for a code review
![](https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/rename.hyperSpec.pull.png)

### 4. Very Hard
The best is yet to come.
