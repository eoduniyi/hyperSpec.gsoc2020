# Report for Week of 6-15-20
#### Return of hyperSpec.skeleton
#### Github Actions vs. Travis CI vs. rhub vs. winBuilder
#### Data package: drat, R.cache, piggyback

---

# Report for Week of 6-8-20

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
# Report for Week of 6-1-20
This was actually the start of the first coding period, but A LOT was going on locally, nationally, and globally, so I honestly took this week to mediate and organize. Pretty hard to be productive. Hopefully I can get back to it properly next week.

---
# Report for Week of 5-25-20

## 1. Replacing `chondro`
I need to replace all of the references of the `chondro` data set with the `fauxCell` data set

From Roman:

    @Erick Maybe you can start removal of chondro by first deleting the file chondro.R and the chondro vignette (the whole folder).
    This will break everything. Then try to fix it by finding all occurrences of chondro in the code and replacing them with fauxCell.
    It it works, you're done! :smile: If not, we'll have to check on a case-by-case basis.

According to Roman, I need to update the examples, unit test, and then vignettes.
```R
# update.examples expects a directory of .R files where the examples exist
# name of the new dataset
# name of the old dataset
update.examples <- function(dir, new_ds, old_ds) {
    # Check each .R file
    # Find all the occurrences of the old_dt
    # Swap the the old_dt occurrences with new_dt
    # Test to see if the package can be built with the updated change
    # If there is an error, warning, or break in test output it to the console and report it in the log
}

# Assumptions: The old_dt and new_dt exist in the package
```
**Note:** So, the first thing I'm going to do is test the entire package (you can submit a package without passing all of the unittest?):

```R
test("./hyperSpec")
```

**Note:** Also, it might be a better idea to run test locally per file as opposed to at the directory level:
```R
```

The first thing that needs to be done from the #145 branch is:

    make
    R CMD build hyperSpec --no-build-vignettes
    R CMD check hyperSpec_0.99-20200521.tar.gz --ignore-vignettes --as-cran

Then, one can open up RStudio and hit the `Load All` button under the `More` tab. To make sure everything is working properly:

```R
> fauxCell
hyperSpec object
   875 spectra
   4 data columns
   300 data points / spectrum
wavelength: Delta * tilde(nu)/cm^-1 [numeric] 602 606 ... 1798
data:  (875 rows x 4 columns)
   1. x: x position [numeric] -11.55 -10.55 ... 22.45
   2. y: y position [numeric] -4.77 -4.77 ... 19.23
   3. region:  [factor] matrix matrix ... matrix
   4. spc: intensity (arbitrary units) [matrix, array300] 45 82 ... 176
> chondro
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
   5. spc: I / a.u. [matrix, array300] 501.8194 500.4552 ... 169.2942
```
As you can see from the above code snippet there are some differences between the `fauxCell` and `chondro` datasets (i.e., labels, name of data slots)...which could all potentially effect the replacement process.

At the end of the day I need to replace the `chondro` data set with the `fauxCell` data set because the former has such a large overhead. Great, that should be the easiest part of the job (replacement/substitution).

The real work starts after the replacement happens. Because even IF, the two data sets are similar, there are a number of things that could break during the replacement process. In particular, the attached test, @examples, vignettes, and scattered references to `chondro`.

**Note:** Examples exist in within the .R files, man pages, and in the vignettes.

**General Questions:**
* #145 will also be a large commit...not sure how one can avoid this.
* Are the examples in the vignettes manually added? If so, does that mean I need to update the vignettes and then `R CMD check hyperSpec...`?

---
# Report for Week of 5-18-20

### 1. Generalizing mutate.R and improving setLabels.R

#### 1.1. `mutate`
I need to update mutate.R so that it accounts for hyperSpec objects that have other data slot columns with matrices. At the moment, mutate.R only checks to see if the `spc` column is being mutated/transmuted. Then, if it is, it "manually" assigns the value to be:

```R
.data@data$spc <- .data@data$spc*2
```

But again, I need to do this for all matrix data columns:

```R
.data@data$var <- .data@data$var*2
.data@data$var <- .data@data$spc*2
```
But I think checking if a column contains matrices is pretty straightforward:

```R
is.matrix(.data@data$var) # returns true if it is a matrix
```
Which means, I could just devise a helper function that checks if the "expression" is a matrix and then accordingly updates the "name":

```R
if(args_name[i] in colnames(tmp_hy)) {
    tmp_hy@data[c(args_name[i])] <- .data@data[c(args_name[i])]
}

.
.
.

if(args_names %in% colnames(.data)) {
  # create a tmp var
  tmp_var <- tmp_var
  tmp_var <- eval(parse(text = paste(".data@data$", args_names[i]))) # What needs to be saved
  tmp_hy@data[c(arg_names[i])] <-
}

handle_mat <- function(.data, expr) {
    var <- eval(parse(text = paste(.data@data$, expr)))
    if (is.matrix(var)) {
        eval(parse(text = paste("tmp_hy@data$", args_name[i], "<-tmp_hy@data$", expr)))
        cols2get <- (cols2get, args_name[i])
    }
    .
    .
    .
    cols2get <- unique(cols2get)

}
```

```R
make_tmp <- function(arg_names, .data) {
    if (arg_names %in% colnames(.data) && is.matrix(.data@data$[args_names])) {
        tmp_var <- .data@data$[args_names]
    }
}
```

```R
get_args <- function(.data, ...) {

    # Collect function arguments
    args <- enquos(...)
    args_names <- names(args)

    # Give nothing, return nothing
    if (length(args) == 0L) {
      return(NULL)
    }

    # Prepare a copy of the original hyperSpec object
    tmp_hy <- .data
    cols2get <- vector() # creates a list to save the column names to

    # Prepare function arguments for mutate/transmute
    # assumption: the variable name and expr
    # share the same index (i.e., args_name[i] is the expr for the variable names(args[i]))
    for (i in seq_along(args)) {
      expr <- quo_name(quo_get_expr(args[[i]]))
      # Process arguments with no names (assignments)
      if ('' %in% args_names[i]) {
        cols2get <- c(cols2get, expr)
      # Process matrix argument assignments
      # Manipulate `matrix column before passing it on to mutate/transmute
      } else if (args_names[i] %in% colnames(.data) && is.matrix(.data@data$[args_names[i]])) {
          if (grepl("spc", expr) && !"spc" %in% args_names[i]) {

              # Throw an error
              stop("$spc can only be mutated from itself")
          }
          tmp_hy@data[c(arg_names[i])] <- .data@data$[c(args_names[i])] # ensures operation on original column
          eval(parse(text = paste("tmp_hy@data[c(", arg_names[i], ")]<-", "tmp_hy@data$", expr)))
          cols2get <- c(cols2get, arg_names[i])
        }
      # Process non matrix argument assignments
      } else {
        assign <- paste(args_names[i],'=', expr, sep='')
        cols2get <- c(cols2get, assign)
      }
    }

    # Hand off columns (i.e., prepared arguments) to mutate()/transmute()
    cols2get <- unique(cols2get) # transmute/mutate already take care of this...
    ls_hy <- list(tmp_data = tmp_hy@data, args = paste(cols2get, collapse=", "))
}

```
**Notes:** What's the difference between data$colname and data["colname"]?

### 2. `pkgdown` and `drat`

#### 2.1. `pkgdown`
Use `pkgdown` to generate online documentation automatically:


```R
# Install pkgdown
install.packages("pkgdown")
```

    also installing the dependency 'highlight'



    The downloaded binary packages are in
    	/var/folders/4_/gg3mjn693bz4v5w1sxh71rtc0000gp/T//RtmpFMJVnd/downloaded_packages


```R
# Load libraries
library(pkgdown)
library(devtools)
```

    Loading required package: usethis


    Attaching package: 'devtools'


    The following object is masked from 'package:pkgdown':

        build_site


```R
# Run pkgdown
usethis::use_github_action("pkgdown")
```

    v Setting active project to '/Users/erickoduniyi/Documents/Projects/open-source/hyperspec/hyperSpec.skeleton'

    v Creating '.github/'

    v Adding '^\\.github$' to '.Rbuildignore'

    v Adding '*.html' to '.github/.gitignore'

    v Creating '.github/workflows/'

    v Writing '.github/workflows/pkgdown.yaml'


```R
# Build pkgdown site
pkgdown::build_site()
```

#### 2.2. `drat`

### 3. Flesh hyperSpec.skeleton Github repository
Add template labels to hyperSpec.skeleton so that the hyperSpec ecosystem has a consistent set of labels.

#### 3.1 shell script for fetching template labels
Each derived repository should include a file (shell script) that retrieves the hyperSpec.skeleton Github repository configuration (i.e., labels, pull request templates, issue templates)


    # hyperSpec.skeleton shell script
    # author: Erick Oduniyi

    # Make sure github-labels node package is installed
    npm install github-labels -g

    # Get Github username and repo name
    echo "enter username and name of derived package repository (username/repo)"
    read pkg_repo

    # Get personal access tokens
    echo "enter Personal access tokens"
    read token

    # Pass the skeleton labels to the derived package repo
    labels -c hyperSpec.skeleton.labels.json pkg_repo -t token


### 4. Figure out the build/make issue of hyperSpec on macOS

```R
# In R install the tinytex package
install_packages("tinytex")
```
It's a good idea to install the [full MacTex2020](http://www.tug.org/mactex/mactex-download.html) pkg as well.

    # In Terminal within the directory of hyperSpec run make
    make

Update the config file to reflect your user credentials

### #. PCA

<s>TODO: I should install the R development branch via subversion</s>
TODO: Read "An Introduction to PCA"
TODO: Read "Evaluating the Design of the R language"

---
# Report for Week of 5-11-20

### 1. Package skeleton
Create a package skeleton and associated Github repository that contains unit test and continuous integration.

#### 1.1 Creating a hyperSpec package skeleton
Because I will be creating a lot of R packages there should be a package pattern to ensure a consistent infrastructure style is present across the hyperSpec ecosystem. Every hyperSpec package should then include the following components:

  1. Github repository
  2. R project file
  3. unit test via `testthat`
  4. continuous integration (CI) via [Travis CI](https://travis-ci.com/) and [AppVeyor](https://www.appveyor.com/)
  5. code coverage via `covr` and [Codecov](https://codecov.io/)

##### 1.1.1 Create a Github repository
Make a new Github repository for the package to be. Clone the Github repository locally. Clone the [hyperSpec.skeleton repository](https://github.com/eoduniyi/hyperSpec.skeleton). commit/publish local repository.

##### 1.1.2 Create a R package via RStudio
It is best to develop all packages from within RStudio:

1. Create a new RStudio project from the existing local repository.
2. Configure the project's build tools so that they are set to "Package".
3. Check all of the Roxygen options.
4. Edit the DESCRIPTION file appropriately.
5. Use the function `devtools::load_all()`.
6. Clean and rebuild the package.
7. Install and restart

**Note:** Should have the `devtools`, `roxygen2`, `covr`, and `testthat` R packages installed.

##### 1.1.3 Set up `testthat` for unit testing
The hyperSpec.skeleton repository comes with the necessary infrastructure for unit testing via the `testthat` package. See the [link](https://projector-video-pdf-converter.datacamp.com/5067/chapter4.pdf) for a **review on unit testing** and the [link](https://cran.r-project.org/web/packages/testthat/testthat.pdf) for the **`testthat` manual**.

**Note:** Unit test are typically written within the same file as the function definition.

##### 1.1.4 Set up CI
All hyperSpec packages include CI via [Travis CI](https://travis-ci.com/) and [AppVeyor](https://www.appveyor.com/). The .yml files for both of these services are included in the package directory.

**Note:** You need to have a Travis CI and AppVeyor account. Make sure the Travis CI and AppVeyor apps are installed in the Github repository's settings.

##### 1.1.5 Set up code coverage
All hyperSpec packages report code coverage via [codecov.io](https://codecov.io/). The .yml file for this service is included in the package directory. For generating code coverage reports from within R, see the `covr` [github repository](https://github.com/r-lib/covr) and the [package manual](https://cran.r-project.org/web/packages/covr/covr.pdf).

**Note:** You need to have a codecov.io account. Make sure the Codecov app is installed in the Github repository's settings.

##### 1.1.6 Adding badges
Badges for the packages go in the READEME.md file. Badges for Travis CI, AppVeyor, Codecov, and [repo status](https://www.repostatus.org/#wip) can be found on the service's respective website.

---

### 2. Package building
Read up on git-lfs, CMAKE, win-builder, and r-hub

### 3. hyperSpec fileIO
<s>TODO: Submit an issue for mutate/transmute.R</s>
<s>TODO: Implement mutate.R, setLabels</s>

### 4. mutate.R and setLabels.R
Implemented mutate.R and setLabels.R

`mutate.R` takes care of issue #6 and issue #7
`setLabels.R` implements updating labels as discussed in #7

TODO: Generalizing mutate/transmute as discussed in issue #12

### 5. Templates
In general, a template is pattern for a repeatable format for a document or file. The primary benefit of such a structure is that the underlying structure does not have to be recreated from scratch. This ensures a level of consistency across projects. And so indeed, it makes sense to also have templates for repositories. And if it makes sense for repositories, perhaps it also makes sense for issues, pull request, and a range of collaborative structures.

#### 5.1 Template repository
A template repository can be made in Github by going to the settings of the repository and checking the template repository box. Then, you can generate new repositories by using the url-end point:`https://github.com/username/repoistory.name/generate`. This is equivalent to clicking the "Use this template" button in the repository's code tab. Once, the derived repository is created, it's a good idea to set the template repository as a remote via  `git remote add template [URL of the template repo]`. Now, changes made to the template can be propagated to the derived repo by fetching and pulling in the changes.

<s>TODO: Make hyperSpec package a template repository</s>

