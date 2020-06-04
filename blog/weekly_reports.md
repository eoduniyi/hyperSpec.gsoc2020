# Report for Week of 6-1-20

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

What's the difference between data$colname and data["colname"]?
```

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

