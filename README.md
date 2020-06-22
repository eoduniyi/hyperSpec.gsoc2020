# [Report for Week of 6-8-20](/blog/weekly_reports.md)

#### Return of hyperSpec.mutate/transmute
Still need to finish fleshing out the details of the hyperSpec.mutate and hyperSpec.transmute functions. They're sooo close!!!

According to our conversation, the generalized mutate/transmute allows and disallows the following:
```R
# Is allowed:
hyperSpec.obj %>%
    mutate (x = y, x2 = y2) # allowed
hyperSpec.obj %>%
    mutate (c = c*2, c = c*0) # allowed
hyperSpec.obj %>%
    mutate (y, x, filename, spc2 = spc*2) # allowed
hyperSpec.obj %>%
    mutate(spc2 = spc*2) %>%
    mutate(spc2) %>%
    mutate(spc2*2) # allowed

# Let a and b be columns with row matrices, then
hyperSpec.obj %>%
    mutate (a = a*0, a = a*2, a = a*3, b) # allowed
hyperSpec.obj %>%
    mutate (a*0, a*2, a*3, b) # allowed

# Is not allowed:
hyperSpec.obj %>%
    mutate (y, x, filename, spc = spc*2) # not allowed
hyperSpec.obj %>%
    mutate (spc*2) # not allowed
hyperSpec.obj %>%
    mutate(spc2 = spc*2) %>%
    mutate(spc) # not allowed    
```
**Note:** `transmute` works in these cases as well except if `$spc` is not present in transmutation a data frame is returned (i.e., `transmute (x, y) # => df` )

`hyperSpec.mutate` performs the appropriate mutate or transmute operations by analyzing the input arguments. From the above code snippet you can see that there are a few cases that are accepted and not. Perhaps the most import thing about this function is how it handles operations regarding `spc`. In general, `spc` **can not** be mutated (`mutate(spc*2)`, `mutate(spc = spc*2)`). Additionally, all data columns with row matrices are handled similarly to `spc` the difference being mutation on these non-spc matrix columns is **fine** (`mutate(mat.col1*2)`, `mutate(mat.col1 = x)`).

The current implementation of  `mutate.R` is mostly expressed within the helper function `get_args()`:

```R
for (i in seq_along(args)) {
  expr <- quo_name(quo_get_expr(args[[i]]))
  # Process arguments with no names (assignments)
  if ("" %in% args_names[i]) {
    cols2get <- c(cols2get, expr)
    # Process matrix argument assignments
    # Manipulate `matrix column before passing it on to mutate/transmute
  } else if (args_names[i] %in% colnames(.data) && is.matrix(var_expr)) {

    # Handle misuse of spc column
    if (grepl("spc", deparse(substitute(expr))) && !"spc" %in% args_names[i]) {

      # Throw an error
      stop("$spc can only be mutated from itself")
    }
    tmp_hy@data[[args_names[i]]] <- .data@data[[args_names[i]]] # ensures operation on original column
    tmp_hy@data[[args_names[i]]] <- var_expr
    cols2get <- c(cols2get, args_names[i])
    # Process non matrix argument assignments
  } else {
    print("Here")
    assign <- paste(args_names[i], "=", expr, sep="")
    cols2get <- c(cols2get, assign)
  }
}
```

Let's try and distill the update as psuedo code:
```R
# If the argument has no name (only an expression)
if (args_name[i] is empty_string) {
    if (expr is matrix) {
        # going to be hard to deal with
        if (expr contains `spc`+anything_else) {
                stop("spc column can not be mutated")
        } else {
            # Update tmp .data
            # Store expr as column (# just store `mat` not `mat`+anything_else)
        }
    } else {
        # Store expr as column
    }

# If name of argument is a column with row matrices    
} else if (args_name[i] is matrix) {
    if (args_name[i] is `spc`) {
        stop("spc column can not be mutated")
    } else {
        # Update tmp .data
        # Store expr as column
    }
# If name of argument is not a column with row matrices    
} else {
    # Create an assignment using paste
    # Store expr as column
}
```

Now, let's try and implement the solution:

```R
pre_mutation <- function(.data, ...) {

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

  # Prepare function arguments for mutate/transmute
  # assumption: the variable name and expr
  # share the same index (i.e., args_name[i] is the expr for the variable names(args[i]))
  for (i in seq_along(args)) {
    expr <- quo_name(quo_get_expr(args[[i]]))
    col_name <- trimws(gsub("[[:punct:]].*","", expr), "right") # "base" expr ~should~ be in colnames(.data)
    # print(col_name)
    # print(args_names[i])

    # Capture expression value
    if (!grepl("\\D", expr)) {
      expr_val <- eval(parse(text = expr))
    } else {
      expr_val <- eval(parse(text = paste0("tmp_hy@data$", expr)))
    }

    # Argument has no name (only an expression)
    if ("" %in% args_names[i]) {

      # Expression is a column with row matrices
      if (is.matrix(expr_val)) {

        # Mutation is being performed on `spc``
        if ("spc" %in% col_name && grepl('[^[:alnum:]]', expr)) {

          # Throw error
          stop("$spc column cannot be mutated")

          # Collect `spc` column
        } else if ("spc" %in% expr) {

          # Store expr in column
          cols2get <- c(cols2get, 'spc')

          # Update temporary hyperSpec object before passing it to mutate/transmute
        } else {

          # Update tmp_hy@data
          tmp_hy@data[[col_name]] <- expr_val

          # Store expr in column (# just store `mat` not `mat`+anything_else)
          cols2get <- c(cols2get, col_name)
        }

        # Column already exist in the hyperSpec object
      } else {

        # Store "base" expr in column
        cols2get <- c(cols2get, expr)
      }

      # Expression's name (args_name[i]) is not empty
    } else {

      # Mutation is being performed on `spc`
      if ("spc" %in% args_names[i]) {

        # Throw error
        stop("$spc column cannot be a named argument")

        # Expression is a column with row matrices
      } else if (is.matrix(expr_val)) {

        # Update tmp_hy@data
        tmp_hy@data[[args_names[i]]] <- expr_val

        # Store "base" expr in column
        cols2get <- c(cols2get, args_names[i])

        # "vanilla" assignment
      } else {

        # Create an assignment using paste
        assign <- paste0(args_names[i], "=", expr)

        # Store expr in column
        cols2get <- c(cols2get, assign)
      }
    }
  }
    # Hand off columns (i.e., prepared arguments) to mutate()/transmute()
    cols2get <- unique(cols2get) # transmute/mutate might already take care of this...
    return(list(tmp_data = tmp_hy@data, args = paste(cols2get, collapse=", ")))

```
Well, according to [dplyr 1.0.0](https://www.tidyverse.org/blog/2020/06/dplyr-1-0-0/). `mutate` and `transmute` now support operations on columns with matrices. So, this basically means the above work is unnecessary _el o el_:

`mutate.R` for hyperSpec object:

```R
mutate.hyperSpec <- function(.data, ...) {

    # Check if user passed in a hyperSpec object
    chk.hy(.data)

    # Pass mutate arguments to dplyr::mutate
    res <- mutate(.data@data, ...)
    .data@data <- res
    .data
}
```

And for `transmute.R`:

```R
transmute.hyperSpec <- function(.data, ...) {

  # Check if user passed in a hyperSpec object
  chk.hy(.data)

  # Pass transmute arguments to dplyr::transmute
  res <- transmute(.data@data, ...)

  # Update labels
  setLabels.select(.data, res)
}
```
#### Replace `chondro` with `fauxCell`
I did not get very far with the replacement task. Though, now that I have taken a moment to collect my thoughts, I realize that it's actually not that difficult of a task.

##### Updating .R files
I used a [script](https://hyperspec.slack.com/archives/C010YFB5RQQ/p1591715140124200?thread_ts=1591714902.123500&cid=C010YFB5RQQ) to update the majority of the files and then did an inspection of each file to make sure that they weren't referencing anything that `fauxCell` did not have in its data slot.

##### Updating test
For each file I needed to make sure that the test could pass with `fauxCell`. To do this, I ran the following function in the RStudio console:
```R
with_reporter(reporter = SummaryReporter$new(), start_end_reporter = TRUE, get.test(.nameoffunction)())
```
Additionally, I performed the `make` -> `build` -> `check` after each updated file to ensure that everything was cool.

##### Keep track of updates
Now that I've completed replacing `chondro` with `fauxCell` in the files that reference `chondro`. Before committing I made sure the test and examples passed with the update. If it did not, I just skipped. Though, the only file that occurred in was `spc.fit.poly.R`

The files that have a reference to `chondro`, but I did not touch are:
`chondro.R`
`read.txt.Reinshaw.R`

Here is a table with my findings:
[table](/img/feature_145-chondro-replace-summary - Sheet1.pdf)

##### What else?
The vignettes still make use of examples that reference `chondro`, so at some point that also needs to be updated.

---

 # [Meeting notes for 6-22-20](/blog/meeting_notes.md)

 **Things to do:**
  * Update `hySpc.skeleton` documentation to `hyperSpec` repo quality
  * `hySpc.read.Witec`
  * `hySpc.read.JDX`
   * `readJDX`
  * Update unit test to work with `hySpc.testthat`
     * Wait on `hySpc.testthat`
  * Make commit messages align with: _"intention behind the change: we want to do this and that"_
     * ex. "fix this and this"
  * `install_url(readily-prepackaged-nightly-build)`
   * link that always points to the most recent build
  * `drat` package
  * Update labels for `hySpc.testthat` and `hySpc.dplyr`
  * Weekly repo maintenance


 **Things to look into:**
  * Are the make files still being used in `hyperSpec`; can these be deleted?
   * inst/doc/Makefile
  * `readJDX` package
  * Reviewing "issues" in the vignette
  * Linking packages that are built using AppVeyor and Travis
     * `install_url(readily-prepackaged-nightly-build)`