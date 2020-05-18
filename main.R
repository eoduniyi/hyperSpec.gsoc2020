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
