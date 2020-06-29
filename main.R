library(hyperSpec)
library(dplyr)
df <- data.frame(a=1:5, b=1:5)
df

df$a
df$b <- df$b+1
df
df %>% select(a_new = b)

library(hyperSpec)
test <- flu
test@data$spc/2
test@data$spc
test@data$spc <- test@data$spc/2
head(test@data)
qplotspc(test)
qplotspc(flu)
head(flu@data)
# Take a look at the flu object
# Take a look at the flu object data
# head(flu@data, 3)
# # Plot flu
# qplotspc(flu, spc.nmax = 3)¸¸
# # Collect the indices of the specified wavelength
# wl2i(flu, 405:407)
# wl2i(flu, 405~407)

# flu
# flu[, , wl2i(flu, 405~407), wl.index = TRUE]

# flu
# head(flu@data)
# mat <- matrix(1:9, nrow = 3, ncol = 3)
# mat
# spc <- matrix (rnorm (12), ncol = 4)
# colnames (spc) <- 600:603
# spc
# flu@data$spc[2,3]

# wl.range <- wl2i(flu, c(405:407, 408:409), unlist = TRUE)

# length(wl.range)
# tmp <- wl.range
# tmp
# seq_along(tmp)
# tmp[[1]][TRUE] <- 1
# tmp
# tmp[[2]][TRUE] <- 2
# tmp
# unlist(tmp)
# 1:length(c(1,3,4,2))
# qplotspc(flu, spc.nmax = 3)
flu.test <- flu
transmute(flu.test@data, spc = spc)
transmute(flu.test@data, spc = spc/2)
flu.test
head(flu.test@data, 2)
flu.test@data$spc/2
flu.test@data$spc <- flu@data$spc
flu.test@data$spc <- flu.test@data$spc*1
head(flu.test@data, 2)
flu.test@data[c("spc")]
flu.test@data$spc*1
m <- matrix(c(1,2,3,4), nrow=1, ncol=4)
df <- data.frame(id = rep(1, nrow(m)))
df
X <- as.data.frame(as.matrix(gasoline))
df
X <- as.data.frame(as.matrix(gasoline))
X
library(pls)

newGas <- cbind(X[1], NIR = I(as.matrix(X[-1])))
I(as.matrix(flu@data$spc*2))
I(flu@data$spc*2)
transmute(flu@data, spc = spc)
transmute(flu@data, spc = as.matrix(flu@data$spc*2))
flu.test <- flu
flu.test
flu.test@data$spc2 <- flu.test@data$spc*2
flu.test
head(flu.test@data, 2)
transmute(flu.test@data, spc = spc, spc2 = spc2)

df <- data.frame(a = 1:5, b = 1:5)
fun <- function(df, ...){
  args <- list(...)
  # print(args)
  # length(args)
}

args$x
args <- fun(df, spc = flu@data$spc, spc2 = flu@data$spc*2)
colname <- names(args)[1]
colname
flu.test@data$colname <- args$colname
flu.test
flu.test@data[c(colname)] <- args[1]
flu.test
res <- flu
tmp <- data.frame()
names(args)[1]
names(args[1])
res@data[c(names(args)[1])] <- args[1]
transmute(res@data, x = x)
v <- as.name()
v
transmute(res@data, v = v)
names(args[1])
v = names(args[1])
transmute_(res@data, paste(names(args[1])))
as.name("string") = as.name("string")
y <- as.symbol(names(args[1]))
y
transmute(res@data, y)
res <- flu

res@data[c(names(args[1]))] <- args[1]
transmute_(res@data, paste(names(args[1])))
transmute(flu@data, c = spc, c = 1:6)
gather(flu@data$spc*2)
library(rlang)
args_quo <- rlang::quos(c(c, spc))
transmute.hyperSpec <- function(df, ...){
  args <- list(...)
}
df
transmute.hyperSpec(df, a, b = 2*b)
transmute(df, a, b)
proc_args <- function(.data, ...){
  args <- enquos(...)
  args
}
df
proc_args(df, a, b=4)
proc_args <- function(.data, ...){
  args <- enquos(...)
  args

  args_names <- names(args)
  args_name
}
proc_args(df, a, b=4)
proc_args <- function(.data, ...){
  args <- enquos(...)
  args

  args_names <- names(args)
  args_names
}
proc_args(df, a, b=4)
proc_args <- function(.data, ...){
  args <- enquos(...)
  print(args)

  args_names <- names(args)
  print(args_names)
}
proc_args(df, a, b=4)
library(dplyr)
args_gen <- function(.data, ...){
  args <- enquos(...)
  # print(args)

  # args_names <- names(args)
  # print(args_names)
  #
  # if(length(args) == 0L){
  #   return(NULL)
  # }
}
proc_args(df)

args <- proc_args(df, a, b=4)
args
args$b
quo_get_expr(args[[2]])
mutate(df, a = b, a = a*10, a = a*0)
mutate(df, a, a = b, a = a*10, a = a*0)
transmute(df, a = b, a = a*10, a = a*0, a)
names(args)[1]
is.null(names(args)[1])
length(names(args[1]))
length()
grepl('b', names(args[2]))

transmute(df, a, b)
do.call("transmute", list(a, b), envir = df)
transmute(df, mget(c('a', 'b')))
do.call("rnorm", list(100, 0, 1))
do.call("transmute", df, a)
nms <- c("a=a*2")
df %>% group_by_at(nms) %>% transmute
transmute(df, substitute("a"))
cols2get <- c('a = a*2', "b", "a = a*0")
myoptions <- paste(cols2get, collapse=", ")
eval(parse(text = paste( "transmute(df,", myoptions, ")")))
x <- c('a=2*a','b')
paste(x, collapse=", ")
args_gen <- function(.data, ...){
  args <- enquos(...)
  # print(args)

  # args_names <- names(args)
  # print(args_names)
  #
  # if(length(args) == 0L){
  #   return(NULL)
  # }
}

args <- args_gen(flu, spc*2)
args
seq_along(args)

proc_args <- function(.data, ...){

  # Check if user passed in a hyperSpec object
  chk.hy(.data)
  validObject(.data)

  # Collect function arguments
  args <- enquos(...)
  args_names <- names(args)
  if(length(args) == 0L){
    return(NULL)
  }

  # Prepare hyperSpec object
  res <- .data # store original hyperSpec object
  cols2get <- vector() # create a list to save the column names to
  tmp_spc <- res@data[c('spc')] # store original spc matrix

  # Prepare function arguments for transmute()
  # assumption: the variable `name` and `expr` share the same index (i.e., args[i] is the expr for the variable names(args[i]))
  for(i in seq_along(args)){
    expr <- quo_name(quo_get_expr(args[[i]]))
    # Process arguments with no names (assignments)
    if('' %in% args_names[i]){
      cols2get <- c(cols2get, expr)
    # Process `spc` argument assignments
    # Manipulate `spc` column before passing it on to transmute() or select()
    }else if('spc' %in% args_names[i]){
      res@data[c('spc')] <- tmp_spc
      eval(parse(text = paste("res@data[c('spc')]<-", "res@data$", expr)))
      if(!'spc' %in% cols2get){
        cols2get <- c(cols2get, 'spc') # ensures I always get a `spc` column
      }
    # Process non `spc` argument assignments
    }else{
      assign <- paste(args_names[i],'=', expr, sep='')
      cols2get <- c(cols2get, assign)
    }
  }

  # Hand off columns (i.e., prepared arguments) to transmute()
  transmute_args <- paste(cols2get, collapse=", ")
  eval(parse(text = paste("transmute(res@data,", transmute_args, ")")))

}
proc_args(flu, c = c*2)
proc_args(flu, c=c*2, b = 34, a = b)
proc_args(flu, c=c*2, c)
proc_args(flu, c, spc=spc*2, spc=spc*0)
paste(names(args)[1],'=', as.character(quo_get_expr(args[[1]])), sep='')
paste(test, collapse = "")
test <- quo_name(quo_get_expr(args[[1]]))
a <- quo(a*2)
quo_name(a)
transmute(flu@data, c = c*2)
proc_args(flu, c, spc)

test <- flu
flu@data$spc
test@data[c('spc')] <- spc
expr <- quo_get_expr(args[[1]])
test@data[c("spc*2")]
transmute(df, a=a*0, a=b*2, c = a)
transmute(df)
proc_args(flu, c, spc=spc*0, spc=spc*2, spc=spc*0, a = spc)

getwd()
setwd("/Users/erickoduniyi/Documents/Projects/open-source/hyperspec/hyperSpec.tidyverse")

getwd()
list.files()
library(devtools)
library(hyperSpec)
load_all()
load_all()
chondro.test <- chondro
chondro.test
head(dplyr::mutate(chondro, y, x, y2 = y))

 ead(transmute(chondro, y, x, y2 = y))
load_all()
test()
df <- data.frame(a = 1:2, b = 1:2)
df

flu %>% mutate.hyperSpec(c = a*b)
df %>% transmute.hyperSpec(c = a*b)
flu
flu %>% transmute.hyperSpec(filename, spc2 = spc*2)
flu %>% transmute.hyperSpec(c2 = c)
load_all()
test()
mutate.hyperSpec(flu, c=c*2, c=c*0)
transmute.hyperSpec(flu, filename, c)
typeof(chk.hy(flu))
typeof(chk.hy(df))
flu

.data <- flu
labels <- labels(.data)[c(".wavelength", colnames(.data))]
labels(.data)
colnames(.data)
labels
load_all()
load_all()
test()
flu
test <- mutate.hyperSpec(flu, c1 = c*c, c2 = c^3, c3 = c^4)
head(test)
labels(.data)
labels(test)
blah <- transmute.hyperSpec(flu, c)
labels(blah)
colnames(blah)
library(hyperSpec)
library(devtools)
labels(laser, ".wavelength")
laser
test <- laser
labels(test, ".wavelength") <- "f / THz"
test
labels(test)
load_all()
test()
test <- mutate.hyperSpec(flu, c1 = c, c2= c^2)
test
labels(test)

proc_args <- function(.data, ...){
  args <- enquos(...)
  args
}
names(proc_args(test, r = "@", z = expression(z)))
labels(test, 'c1') <- expression(c3)
test
proc_args <- function(.data, ...){
  args <- enquos(...)
  args_names <- names(args)
  labels2update <- args_names[args_names %in% colnames(.data)]
  print(.data)
  labels2get <- vector()
  for (i in seq_along(args)) {
      # labels(.data, args_names[i])
      # print(args_names[i])
      # print(labels(.data, args_names[i]))
      # labels(test2, "c") <- "c / ml"

      # Get new and current column names


      # Get new and current column names
      # labels.to.update <- setdiff(colnames(res), colnames(.data))
      # labels.to.remove <- setdiff(colnames(.data), colnames(res))
      # Update the data slot with newly renamed data frame
      # .data@data <- res
      # Update labels of hyperSpec object
      # new.labels <- lapply(labels(.data, labels.to.update), as.expression)
      # labels(.data)[c(labels.to.remove)] <- NULL
      # labels(.data)[c(labels.to.update)] <- new.labels
      # .data

      setlabels2 <- quo_name(quo_get_expr(args[[i]]))
      print(setlabels2)
      if(grepl('expr', setlabels2)) {
          setlabels2 <- as.expression(setlabels2)
      }
      # labels2set <- c(labels2get, setlabels2)
      labels(.data, labels2update[i]) <- setlabels2
      # print(label)
      # labels(.data, args_names[i]) <- label
      # print(labels(.data, args_names[i]))
      # print(quo_name(quo_get_expr(args[[i]])))
  }
  .data
  # print(labels(.data))
  # lapply(labels(.data, labels.to.update), as.expression)
  # labels(.data) <- labels2get
  # print(labels(.data))
}

test <- flu
test
proc_args(test, c = "c / ml", filename = expression(filename))

test
colnames(test)

labels(test)[c(".wavelength", colnames(test))]

# colnames(names(enquos(c = "c / ml", filename = expression(filename))))
test_quo <- function(.data, ...) {
    args <- enquos(...)
    args_names <- names(args)
    labels2update <- args_names[args_names %in% colnames(.data)]

    # Update labels of hyperSpec object
    new.labels <- lapply(labels(.data, labels.to.update), labels <- c("new", "juice"))
}
names2update <- test_quo(test, c = "c / ml", filename = expression(filename))
names2update
setdiff(args_names, colnames(test))
args_names
colnames(test)

setdiff(colnames(test), args_names)
ls <- args_names %in% colnames(test)
labels2update <- args_names[args_names %in% colnames(test)]
labels2update




labels(test, )

test2 <- flu
test2

labels(test2, "c") <- "c / ml"
test2

as.expression(expression(filename))
expression(filename)
grepl('expr','expression(filename)')
labels(test)
getwd()
load_all()
test()
test <- flu
test
test %>% setLabels(.wavelength = "lambda/nm", c = "c / (mg / l)")
setLabels(test, .wavelength = "filename2", c = "r / μm")
load_all()
load_all()
test()
load_all()
test()
load_all()
test()
transmute.hyperSpec(flu)
structure(tmp_hy = test, mutate_args = c("3","#@","23"))
f <- structure(1:10, comment = "This is my simple vector with info")
f <- list(name1 = test@data, name2 = 1:10)
f$name2
load_all()
test()
load_all()
test()
mutate.hyperSpec(test, c = c, c1 = c*2)
transmute.hyperSpec(test, c = c, c1 = c*2)
test()
test()
load_all()
test()

getwd()
setwd('/Users/erickoduniyi/Documents/Projects/open-source/hyperspec/hyperSpec.skeleton')
getwd()
list.files()
install.packages("pkgdown")
library(pkgdown)
library(devtools)
usethis::use_github_action("pkgdown")
pkgdown::build_site()
library(hyperSpec)
library(devtools)
library(testthat)
# update.examples expects a directory of .R files where the examples exist
# name of the new dataset
# name of the old dataset
update.examples <- function(dir, new_ds, old_ds) {

    # Check the difference between the two datasets
    old_ds_name <- deparse(substitute(old_ds))
    new_ds_name <- deparse(substitute(new_ds))
    message(paste("Checking differences between", old_ds_name, "and", new_ds_name))

    # Handle potential differences between datasets
    if (!setequal(colnames(old_ds), colnames(new_ds))) {
        col_diff_old <- setdiff(colnames(old_ds), colnames(new_ds))
        col_diff_new <- setdiff(colnames(new_ds), colnames(old_ds))
        message(paste("The following columns appear in", old_ds_name, "but not", new_ds_name, ":", col_diff))
        message(paste("Do you want to substitute", col_diff, "for one of the following columns in", new_ds_name, "?:"))
        select.list(sort(.packages(all.available = TRUE)))

    }

    # Read in the file
    print("Reading in file...")
    code <- readLines(dir)

    # Look for occurences of old_dt and replace with new_dt
    print("Updating file...")
    code_edited <- gsub("foo", "bar", code)
    writeLines(code_edited, getwd())

    # Output File
    print("Outputting file...")

    # Test File
    ## Check unittest
    print("Checking unittest...")
    print("Logging errors to...")

    ## Check examples
    print("Checking examples...")
    print("Logging errors to...")

    ## Check vingettes
    print("Checking vingettes...")
    print("Logging errors to...")

    print("Done!")
}
update.examples()
getwd()
old_dt <- deparse(substitute(chondro))
new_dt <- old_dt
print(paste("Checking differences between", old_dt, "and", new_dt))
select.list(sort(.packages(all.available = TRUE)))

col_tmp <- charmatch(colnames(.data), deparse(substitute(expr)))
cat(paste("deparse(substitute(expr)):", deparse(substitute(expr))), "\n")
cat(paste("colnames(data):", colnames(.data)), "\n")
cat(paste("col_tmp:", col_tmp), "\n")
# if (col_tmp[!is.na(col_tmp)] > 0) {
#   var_expr <- eval(parse(text = paste("tmp_hy@data$", expr, sep="")))
# }
print(args_names[i])
print(expr)

library(hyperSpec)
library(devtools)
library(dplyr)
library(rlang)
test_func <- function(.data, ...) {
    args <- enquos(...)
}
see <- test_func(chondro, x = y, y = x)
see
################################################################ - Mutate
mutate.hyperSpec <- function(.data, ...) {

    # Check if user passed in a hyperSpec object
    chk.hy(.data)

    # Collect mutate arguments
    mutate_args <- get_args(.data, ...)

    # Pass mutate arguments to dplyr::mutate
    .data@data <- eval(parse(text = paste("mutate(mutate_args$tmp_data,", mutate_args$args, ")")))
    .data
}
################################################################ - Transmute
transmute.hyperSpec <- function(.data, ...) {

    # Check if user passed in a hyperSpec object
    chk.hy(.data)

    # Collect transmute arguments
    transmute_args <- get_args(.data, ...)

    # Pass transmute arguments to dplyr::transmute
    res <- eval(parse(text = paste("transmute(transmute_args$tmp_data,", transmute_args$args, ")")))
    res

    # Update labels
    # setLabels.select(.data, res)
}
################################################################ - Get-Args

################################################################
get_args <- function(.data, ...) {

    # Collect function arguments
    args <- enquos(...)
    args_names <- names(args)

    # Give nothing, return nothing
    if (length(args) == 0L) {
      return(NULL)
    }

    # Make a copy of the original hyperSpec object
    tmp_hy <- .data
    cols2get <- vector()
    for (i in seq_along(args)) {
        expr <- quo_name(quo_get_expr(args[[i]]))
        col_name <- gsub("[[:punct:]].*","", expr) # "base" expr must be in colnames(.data)
        expr_val <- eval(parse(text = paste("tmp_hy@data$", expr)))

        # If the argument has no name (only an expression)
        if ("" %in% args_names[i]) {

            # If the expression is a column with row matrices
            if (is.matrix(expr_val)) {

                # If mutation is being performed on `spc`(3)
                if (grepl("spc", expr) && nchar(expr) > 3) {
                        stop("spc column can not be mutated")
                } else {

                    # Update tmp_hy@data
                    tmp_hy@data[[col_name]] <- expr_val

                    # Store expr as column (# just store `mat` not `mat`+anything_else)
                    cols2get <- c(cols2get, col_name)
                }
            } else {

                # Store "base" expr as column
                cols2get <- c(cols2get, expr)
            }
        # Else the expression's name (args_name[i]) is not empty
        } else {

            # If mutation is being performed on `spc`
            if ("spc" %in% args_names[i]) {
                stop("spc column can not be mutated")

            # If expression is a column with row matrices
            } else if (is.matrix(expr_val)) {

                # Update tmp_hy@data
                tmp_hy@data[[args_names[i]]] <- expr_val

                # Store "base" expr in column
                cols2get <- c(cols2get, col_name)

            # Else "vanilla" assignment
            } else {

                # Create an assignment using paste
                assign <- paste(args_names[i], "=", expr, sep="")

                # Store expr in column
                cols2get <- c(cols2get, assign)
            }
        }
        # Hand off columns (i.e., prepared arguments) to mutate()/transmute()
        cols2get <- unique(cols2get) # transmute/mutate already take care of this...
        return(list(tmp_data = tmp_hy@data, args = paste(cols2get, collapse=", ")))
    }
}
################################################################
transmute.hyperSpec(chondro, x)
dplyr::transmute(chondro@data, x) %>% head()

## Witec {#sec:read-txt-Witec}

\index{Witec!ASCII}
\index{ASCII!Witec}
\index{Graph ASCII!Witec}
\index{Witec!Graph ASCII}
\index{Raman!Witec!ASCII}
\index{Raman!Witec!Save ASCII X, Save ASCII Y}
\index{Raman!Witec!Export Table}
\index{Raman!Witec!spc}
\index{Raman!Witec!Graph ASCII}
\index{spc!Witec}

The Witec project software supports exporting spectra as Thermo Galactic `.spc` files.

```{r witec-spc, results='hide'}
read.spc("fileio/spc.Witec/Witec-timeseries.spc")
read.spc("fileio/spc.Witec/Witec-Map.spc")
```

`.spc` is in general the recommended format for package **hyperSpec** import.
For imaging data no spatial information for the set of spectra is provided (in version 2.10 this export option is not supported).

Imaging data (but also single spectra and time series) can be exported as ASCII X and Y files (Save ASCII X and Save ASCII Y, not supported in version 4).
These can be read by `read.dat.Witec()`{.r}:

```{r witec-dat, results='hide'}
read.dat.Witec("fileio/txt.Witec/Witec-timeseries-x.dat")
read.dat.Witec(
  filex = "fileio/txt.Witec/Witec-Map-x.dat",
  points.per.line = 5, lines.per.image = 5, type = "map"
)
```

Note that the Y data files also contain a wavelength information, but (at least Witec Project 2.10) this information is always wavelength in nm, not Raman shift in wavenumbers: this is provided by the X data file only.

Another option is Witec's txt table ASCII export (Export $\rightarrow$ Table), which produces ASCII files with each row corresponding to one wavelength.
The first column contains the wavelength axis, all further columns contain one spectrum each column.
Such files can be read with `read.txt.Witec()`{.r}:

```{r witec-txt, include=FALSE}
read.txt.Witec("fileio/txt.Witec/Witec-timeseries_no.txt")
```
`read.txt.Witec()`{.r} determines the number of wavelengths automaticallly.

Note that there are several Export Filter Options.
Here you can determine, which units should be used for the export (see XUnits tab).
In addition, it is possible to export two additional header lines containing information about spectra labels and units.
Therefore parameters `hdr.label`{.r} and `hdr.units`{.r} have to be set properly.
Otherwise, either an error will be displayed like

```{r witec-txt-error, echo=FALSE}
cat("Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings,  :
  scan() expected 'a real', got 'rel.'")
```
or the one or two wavelengths will be skipped.

Depending on the used export options the header files should look like:

```{r witec-txt-textfiles, include=FALSE}
headline <- c(
  "with exported labels and units headerlines:",
  "\nwith exported labels headerline:",
  "\nwith exported units headerline:",
  "\nwithout headerline:"
)
files <- c(
  "fileio/txt.Witec/Witec-timeseries_full.txt",
  "fileio/txt.Witec/Witec-timeseries_label.txt",
  "fileio/txt.Witec/Witec-timeseries_unit.txt",
  "fileio/txt.Witec/Witec-timeseries_no.txt"
)

for (f in seq_along(files)) {
  cat(headline[f], "\n")
  tmp <- format(as.matrix(read.table(files[f], sep = "\t")[1:4, 1:3]))
  apply(tmp, 1, function(l) cat(l, "\n"))
}
```
For imaging data set parameter `type`{.r} to "map".
If the label header is exported, the spatial information can be extracted from this line.
Otherwise, at least one, `points.per.line`{.r} or `lines.per.image`{.r}, has to be given manually, if not, a warning will be shown.

```{r witec-txt-map, include=FALSE}
read.txt.Witec("fileio/txt.Witec/Witec-Map_full.txt",  type = "map", hdr.label = TRUE, hdr.units = TRUE)

read.txt.Witec("fileio/txt.Witec/Witec-Map_label.txt", type = "map", hdr.label = TRUE, hdr.units = FALSE)

read.txt.Witec("fileio/txt.Witec/Witec-Map_unit.txt",  type = "map", hdr.label = FALSE, hdr.units = TRUE)

read.txt.Witec("fileio/txt.Witec/Witec-Map_unit.txt",
  type = "map", hdr.label = FALSE, hdr.units = TRUE,
  points.per.line = 5
)

read.txt.Witec("fileio/txt.Witec/Witec-Map_no.txt", type = "map", hdr.label = FALSE, hdr.units = FALSE)

read.txt.Witec("fileio/txt.Witec/Witec-Map_no.txt",
  type = "map", hdr.label = FALSE, hdr.units = FALSE,
  lines.per.image = 5
)

read.txt.Witec("fileio/txt.Witec/Witec-Map_no.txt",
  type = "map", hdr.label = FALSE, hdr.units = FALSE,
  points.per.line = 5, lines.per.image = 5
)
```

For line scans and z-stacks use `type = "single"`{.r} because the provided information are looking the same like for timeseries, so no further information can be extracted from the header files.

Since version 4 WITec Project offers the Graph ASCII export (Export $\rightarrow$ Graph ASCII) which produces three ASCII files, named Header containing additional information, X-Axis containing the wavelength values and Y-Axis containing the spectra one spectrum in each column. Data exported in this way can be read with `read.txt.Witec.Graph()`{.r}:

```{r witec-txt-Graph, results='hide'}
read.txt.Witec.Graph("fileio/txt.Witec/Witec-timeseries (Header).txt")
read.txt.Witec.Graph("fileio/txt.Witec/Witec-Map (Header).txt", type = "map")
read.txt.Witec.Graph("fileio/txt.Witec/nofilename (Header).txt", encoding = "latin1")
```

This function reads the spectra files automatically, if they are named properly and extracts additional information of the header file. As for the other Witec functions it is possible to read image data by by selecting `type = "map"`{.r}. Line scans and z-stacks should be read as single spectra.


# Writing your own Import Function {#sec:writing-Import}

This section gives examples how to write import functions. The first example implements an import
filter for an ASCII file format basically from scratch. The second example shows how to implement
more details for an already existing import filter.


## A new ASCII Import Function: `read.txt.PerkinElmer` {#sec:read-txt-PerkinElmer}

\index{ASCII!long!Fluorescence}
\index{ASCII!long!PerkinElmer}
\index{Fluorescence!ASCII long}
\index{Fluorescence!PerkinElmer!ASCII}
\index{PerkinElmer!Fluorescence}
\index{PerkinElmer!ASCII long}

The raw spectra of the `flu`{.r} data set (see also the respective vignette) are in PerkinElmer's ASCII file format, one spectrum per file.

We need a function that automatically reads all files specified by a pattern, such as `*.txt`{.r}.
In order to gain speed, the spectra matrix should be preallocated after the first file is read.



<!-- ======================================================================= -->