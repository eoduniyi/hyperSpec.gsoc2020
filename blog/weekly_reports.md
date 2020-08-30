[A Short Introduction to Spectroscopy: Notes on Information, Energy, Matter, and Light](introduction.md)  

---
[Goals of GSoC2020](https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/RGSoC_2020_PROPOSAL-2.pdf)

---
[Days Before GSoC2020 - solutions of the entrance test](test.md)

---
# Report for Week of 5-4-20 (Week 1)

**Week-1-expected:**
Create a clear communication schedule for weekly meetings, protocols for check-ins, and a high-level road map for successful contribution to the `hyperSpec` project (e.g., forking, merging, pulling, etc.).

**Week-1-actual:**
Created a clear communication schedule for weekly meetings, protocols for check-ins, and a high-level road map for successful contribution to the `hyperSpec` project (e.g., forking, merging, pulling, etc.).

# 1. Infrastructure for Open-source Contribution
Before contributing or creating a repository, there must be an individual or team that manages  **contributions** and the people that make them: **contributors** - _A person, or organization responsible for making contributions to the repository_ (open-source projects don't write themselves, really). And so, we'll specify that contributions can come in the form of **coding contributions** (CCs) and **non-coding contributions** (NCCs):

* coding contributions - _contributions that consist of the addition or deletion of code_

* non-coding contributions - _contributions that support the project that are not CCs_

From the perspective of a team hosting their project on [Github](https://github.com/), this means managing code repositories and their associated _issues_, _pull request_ (PRs), _code_, _branches_, _contributor access_, and _code reviews_. For this first week (and at the beginning of any project) the `r-hyperspec` team focused on NCCs.

## 1.2. Social and Team Infrastructure (Project management)
For the `r-hyperspec` team, the infrastructure for CCs is Git/GitHub. Though, Github also provides infrastructure for NCCs (e.g., opening, commenting, and closing [issues](https://docs.github.com/en/enterprise/2.15/user/articles/creating-an-issue)). However, there are a number of tools that IMHO significantly aid with managing NCCs. Such tools help with the organization of knowledge, planning of contributions, implementation of contributions, and various other "behind the scene" task that not only aid the CCs but also the social dynamics between the contributors. The `r-hyperspec` GSoC2020 mentor _Roman Kiselev_ aided the team with developing and managing such team infrastructures:

### 1.2.1. Trello
Roman created a [Trello board](https://trello.com/en-US/guide) for the `r-hyperspec` team. Trello essentially hosts public and private **kanban boards** - _"an agile project management tool designed to help visualize work, limit work-in-progress, and maximize efficiency (or flow)"_.

### 1.2.2. Github
Throughout the summer Roman and the rest of the `r-hyperspec` team would attach GitHub issues and useful resources and to the board such as this: [Why you should not use (long-lived) feature branches](https://www.freecodecamp.org/news/why-you-should-not-use-feature-branches-a86950126124/). GitHub resources like that were super helpful as references for contributors that are familiar and unfamiliar with Github.

### 1.2.3. Trello + GitHub integration
Roman also showed the team how to integrate the [two](https://blog.trello.com/github-and-trello-integrate-your-commits). From my perspective, this feature was essentially training wheels for me as I was the most inexperienced with Git/Github and project management. In fact, if one looks at the use of this feature throughout the summer via the public trello board or GitHub, they would find that its use decreases slowly over time (as I am a slow learner). The `r-hyperspec` Trello board can be viewed [here](https://trello.com/b/L1SzTFfO/hyperspec-gsoc).

---
# Report for Week of 5-11-20 (Week 2)

**Week-2-expected:**
Finalize development tools and workflow for contributing to the project over the summer. Inquire  about helpful R programming and spectroscopy resources from mentors and digest them.

**Week-2-actual:** The `r-hyperspec` team discussed project licenses, our public trello board, contributors guidelines, Github workflows, template repositories, and general R package building. Aditionally, my [PR](https://github.com/cbeleites/hyperSpec/pull/117) from [the days before GSoC](test.md) were merged. That was a particularly large commit because of the nature of the changes. Finally, I opened an [issue](https://docs.github.com/en/enterprise/2.15/user/articles/creating-an-issue) about a problem that I found particularly challenging related to [`hySpc.dplyr`](https://github.com/r-hyperspec/hySpc.dplyr)([Generalizing transmute.R to other columns that contain matrices](https://github.com/r-hyperspec/hySpc.dplyr/issues/12)). In fact, this issue would not be resolved ("closed") until June 13, 2020.

### 1. Package skeleton (template repo)

#### 1.1 Templates
In general, a template is pattern for a repeatable format for a document or file. The primary benefit of such a structure is that the underlying structure does not have to be recreated from scratch. This ensures a level of consistency across projects. And so indeed, it makes sense to also have templates for repositories. And if it makes sense for repositories, perhaps it also makes sense for issues, pull request, and a range of collaborative structures.

#### 1.2 Template repository
A template repository can be made in Github by going to the settings of the repository and checking the template repository box. Then, you can generate new repositories by using the url-end point:

`https://github.com/username/repository.name/generate`

This is equivalent to clicking the "Use this template" button in the repository's code tab. Once, the derived repository is created, it's a good idea to set the template repository as a remote via:

```
git remote add template [URL of the template repo]
```

Now, changes made to the template can be propagated to the derived repo by fetching and pulling in the changes.

#### 1.3. Creating a `hyperSpec` package skeleton
Because I will be creating a lot of R packages there should be a package pattern to ensure a consistent infrastructure style is present across the `r-hyperspec` ecosystem. Every `hyperSpec` package should then include the following components:

  1. Github repository
  2. R project file
  3. unit test via `testthat`
  4. continuous integration (CI) via [Travis CI](https://travis-ci.com/) and [AppVeyor](https://www.appveyor.com/)
  5. code coverage via `covr` and [Codecov](https://codecov.io/)

##### 1.3.1. Create a Github repository
Make a new Github repository for the package to be. Clone the Github repository locally. Clone the [hyperSpec.skeleton repository](https://github.com/eoduniyi/hyperSpec.skeleton) (now the [`hySpc.skeleton`](https://github.com/r-hyperspec/hySpc.skeleton) package. Commit/publish local repository.

##### 1.3.2. Create a R package via RStudio
It is best to develop all packages from within RStudio:

1. Create a new RStudio project from the existing local repository.
2. Configure the project's build tools so that they are set to "Package".
3. Check all of the Roxygen options.
4. Edit the DESCRIPTION file appropriately.
5. Use the function `devtools::load_all()`.
6. Clean and rebuild the package.
7. Install and restart

**Note:** Should have the `devtools`, `roxygen2`, `covr`, and `testthat` R packages installed.

##### 1.3.3. Set up `testthat` for unit testing
The `hyperSpec.skeleton` repository comes with the necessary infrastructure for unit testing via the `testthat` package. See the [link](https://projector-video-pdf-converter.datacamp.com/5067/chapter4.pdf) for a **review on unit testing** and this [link](https://cran.r-project.org/web/packages/testthat/testthat.pdf) for the **`testthat` manual**.

**Note:** The `r-hyperspec` team has a standard of unit test written within the same file as the function definition.

##### 1.3.4. Set up CI
All `r-hyperspec` packages include CI via [Travis CI](https://travis-ci.com/) and [AppVeyor](https://www.appveyor.com/). The .yml files for both of these services are included in the package directory.

**Note:** You need to have a Travis CI and AppVeyor account. Make sure the Travis CI and AppVeyor apps are installed in the Github repository's settings.

##### 1.3.5. Set up code coverage
All `r-hyperspec` packages report code coverage via [codecov.io](https://codecov.io/). The .yml file for this service is included in the package directory. For generating code coverage reports from within R, see the `covr` [github repository](https://github.com/r-lib/covr) and the [package manual](https://cran.r-project.org/web/packages/covr/covr.pdf).

**Note:** You need to have a codecov.io account. Make sure the Codecov app is installed in the Github repository's settings.

##### 1.3.6. Adding badges
Badges for the packages go in the READEME.md file. Badges for Travis CI, AppVeyor, Codecov, and [repo status](https://www.repostatus.org/#wip) can be found on the service's respective website. Additionally, a comprehensive list of badges can be found at [Naereen/badges](https://github.com/Naereen/badges).

---
# Report for Week of 5-18-20 (Week 3)

**Week-3-expected:**
Finalize development tools and workflow for contributing to the project over the summer. Inquire about helpful R programming and spectroscopy resources from mentors and digest them.

**Week-3-actual:** The `r-hyperspec` team discussed project licenses, public trello board, contributors guideline, Github workflow, template repositories, and general R package building. Reviewed one [PRs](https://github.com/cbeleites/hyperSpec/pull/133) in the `hyperSpec` repository. Worked on the `hySpc.skeleton` framework where in theory a derived package, say [`hyperSpec.derivedpkg`](https://github.com/eoduniyi/hyperSpec.derivedpkg) or `hySpc.*` would collect the changes committed to the skeleton as specified in the last week. Then, I began working on generalizing [`mutate.R`](https://github.com/r-hyperspec/hySpc.dplyr/commits/develop/R/mutate.R). Finally, I did some research into `drat` and `pkgdown`, and worked on trying to get `hyperSpec` to build correctly.

**Helpful resources**:

 * Bryan A. Hanson's [blog](https://chemospec.org/)  

 * Bryan also pointed me to this gem - [Design of R language](https://storage.googleapis.com/root-proposal-1246/opensource/RGSoC2020/resources/Design%20of%20R%20Language.pdf)

### 1. Generalizing mutate.R and improving setLabels.R

#### 1.1. `mutate`
I need to update mutate.R so that it accounts for `hyperSpec` objects that have other data slot columns with matrices. At the moment, `mutate.R` only checks to see if the `spc` column is being mutated/transmuted. Then, if it is, it "manually" assigns the value to be:

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
      # Manipulate matrix column before passing it on to mutate/transmute
      } else if (args_names[i] %in% colnames(.data) && is.matrix(.data@data$[args_names[i]])) {
          if (grepl("spc", expr) && !"spc" %in% args_names[i]) {

              # Throw an error
              stop("$spc can only be mutated from itself")
          }
          tmp_hy@data[c(arg_names[i])] <- .data@data$[c(args_names[i])]

          # ensures operation on original column
          eval(parse(text = paste("tmp_hy@data[c(", arg_names[i], ")]<-", "tmp_hy@data$", expr)))
          cols2get <- c(cols2get, arg_names[i])
        }
      # Process non-matrix argument assignments
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
For an overview of `drat`, see this [link](https://github.com/eddelbuettel/drat)

### 3. Flesh hyperSpec.skeleton Github repository
Add template [labels](https://docs.github.com/en/github/building-a-strong-community/encouraging-helpful-contributions-to-your-project-with-labels) to `hyperSpec.skeleton` so that the `hyperSpec` ecosystem has a consistent set of labels.

#### 3.1 shell script for fetching template labels
Each derived repository should include a file (shell script) that retrieves the `hyperSpec.skeleton` Github repository configuration (i.e., labels, pull request templates, issue templates)


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

### 4. Figure out the build/make issue of `hyperSpec` on macOS

```R
# In R install the tinytex package
install_packages("tinytex")
```

It's a good idea to install the [full MacTex2020](http://www.tug.org/mactex/mactex-download.html) pkg as well.

    # In Terminal within the directory of hyperSpec run make
    make

Update the config file to reflect your user credentials.

---
# Report for Week of 5-25-20 (Week 4)

**Week-4-expected:**
Let the coding continue! Continue making progress on Goals 2 and 3. Compile a weekly report of progress made. Meet with mentors. (check-in with mentors as necessary)

**Week-4-actual:**
Started replacing the `chondro` dataset with the `faux_cell` dataset, worked on [mutate.R](https://github.com/r-hyperspec/hySpc.dplyr/blob/develop/R/mutate.R) and [setLabels.R](https://github.com/r-hyperspec/hySpc.dplyr/blob/develop/R/setLabels.R), and continued to look into `pkgdown` and `drat`.

## 1. Replacing `chondro`
I need to replace all of the references of the `chondro` data set with the `faux_cell` data set

From Roman:

    @Erick Maybe you can start removal of chondro by first deleting the file chondro.R and the chondro vignette (the whole folder).
    This will break everything. Then try to fix it by finding all occurrences of chondro in the code and replacing them with faux_cell.
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

**Note:** So, the first thing I am going to do is test the entire package (you can submit a package without passing all of the unittest?):

```R
test("./hyperSpec")
```

**Note:** Also, it might be a better idea to run test locally per file as opposed to at the directory level.

The first thing that needs to be done from the #145 branch is:

    make
    R CMD build hyperSpec --no-build-vignettes
    R CMD check hyperSpec_0.99-20200521.tar.gz --ignore-vignettes --as-cran

Then, one can open up RStudio and hit the `Load All` button under the `More` tab. To make sure everything is working properly:

```R
> faux_cell
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
As you can see from the above code snippet there are some differences between the `faux_cell` and `chondro` datasets (i.e., labels, name of data slots)...which could all potentially affect the replacement process.

At the end of the day I need to replace the `chondro` data set with the `faux_cell` data set because the former has such a large overhead. Great, that should be the easiest part of the job (replacement/substitution).

The real work starts after the replacement happens. Because even IF, the two data sets are similar, there are a number of things that could break during the replacement process. In particular, the attached test, @examples, vignettes, and scattered references to `chondro`.

**Note:** Examples exist within the [.R files](https://fileinfo.com/extension/r#:~:text=An%20R%20file%20is%20a,visualizations%20of%20the%20computed%20data.), [man pages](https://en.wikipedia.org/wiki/Man_page), and in the [vignettes](http://r-pkgs.had.co.nz/vignettes.html).

---
# Report for Week of 6-1-20 (Week 5)

**Week-5-expected:**
Let the coding begin! Start making progress on Goal 1. Stick to the development cycle for all weekly tasks (i.e., describe, design, implement, quality check, test, document, deliver, and iterate). Compile
a weekly report of progress made. Meet with mentors. (check-in with mentors as necessary)

**Week-5-actual:**
This was actually the start of the first coding period, but [A LOT](https://en.wikipedia.org/wiki/Killing_of_George_Floyd#:~:text=On%20May%2025%2C%202020%2C%20George,allegedly%20using%20a%20counterfeit%20bill.&text=The%20three%20other%20officers%20were,and%20abetting%20second%2Ddegree%20murder.) was going on locally, nationally, and globally, so I honestly took this week to mediate and organize. Pretty hard to be productive. Hopefully I can get back to it properly next week.

---
# Report for Week of 6-8-20 (Week 6)

**Week-6-expected:**
Let the coding continue! Continue making progress on Goal 1. Compile a weekly report of progress made. Meet with mentors. (check-in with mentors as necessary)

**Week-6-actual:**
* Reviewed a [PR related to a quosure bugfix](https://github.com/cbeleites/hyperSpec/pull/150)
* Implemented [mutate.R](https://github.com/r-hyperspec/hySpc.dplyr/blob/develop/R/mutate.R) and [setLabels.R](https://github.com/r-hyperspec/hySpc.dplyr/blob/develop/R/setLabels.R). Please take a look at the PR [here](https://github.com/r-hyperspec/hySpc.dplyr/pull/24)

    * `mutate` takes care of [issue #6](https://github.com/r-hyperspec/hySpc.dplyr/issues/6) and [issue #7](https://github.com/r-hyperspec/hySpc.dplyr/issues/7) of [hySpc.dplyr](https://github.com/r-hyperspec/hySpc.dplyr)  

    * `setLabels` implements updating labels as discussed in [#7](https://github.com/r-hyperspec/hySpc.dplyr/issues/7) of [hySpc.dplyr](https://github.com/r-hyperspec/hySpc.dplyr)

    * Worked on replacing `chondro` with `faux_cell` in `hyperSpec` and submitted a [PR](https://github.com/cbeleites/hyperSpec/pull/156)

## 1. The Return of `hyperSpec.mutate/transmute`
Still need to finish fleshing out the details of the `hyperSpec.mutate()` and `hyperSpec.transmute()` functions.

According to our Monday meeting, the generalized mutate/transmute allows and disallows the following:

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

Let's try and distill the update as pseudo-code:

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
    col_name <- trimws(gsub("[[:punct:]].*","", expr), "right") # "base" expr

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

Well, according to [dplyr 1.0.0](https://www.tidyverse.org/blog/2020/06/dplyr-1-0-0/). `mutate` and `transmute` now support operations on columns with matrices. So, this basically means the above work is unnecessary, _el o el_:

`mutate.R` for `hyperSpec` object:

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

## 2. Replace `chondro` with `faux_cell`
Now that I have had a moment to collect my thoughts, I realize that it's actually not that difficult of a task.

## 3. Updating .R files
I used a [script](https://gist.github.com/eoduniyi/2e40e1ffc2f22d6872fa16dd2caf01d0) to update the majority of the files and then did an inspection of each file to make sure that they weren't referencing anything that `faux_cell` did not have in its data slot.

## 4. Updating test
For each file I needed to make sure that the test could pass with `faux_cell`. To do this, I ran the following function in the RStudio console:
```R
with_reporter(reporter = SummaryReporter$new(), start_end_reporter = TRUE, get.test(.nameoffunction)())
```
Additionally, I performed the `make` -> `build` -> `check` after each updated file to ensure that everything was cool.

## 5. Keep track of updates
Now that I have completed replacing `chondro` with `faux_cell` in the files that reference `chondro`. Before committing I made sure the test and examples passed with the update. If it did not, I just skipped. Though, the only file that occurred in was `spc.fit.poly.R`

The files that have a reference to `chondro`, but I did not touch are:
`chondro.R`
`read.txt.Reinshaw.R`

## 6. What else?
The vignettes still make use of examples that reference `chondro`, so at some point that also needs to be updated.

---
# Report for Week of 6-22-20 (Week 7)

**Week-7-expected:** Let the coding continue! Wrap up progress on Goal 1. Compile a weekly report of progress made. Meet with mentors. (check-in with mentors as necessary)

**Week-7-actual:**
Started implementing the [`hySpc.read.Witec`](https://github.com/eoduniyi/hySpc.read.Witec) package (this package would later come to be known as `hySpc.read.txt`).

## `hySpc.read.Witec`
`hySpc.read.Witec` is a bridge package for managing all kinds of files produced by [Witec instruments](https://www.witec.de/products/?gclid=CjwKCAjwnK36BRBVEiwAsMT8WA5ReYiZQJOexlBJun1zxRQ4wif0XUwKY_ElMT20t5LFLIE_Txi6QhoCz6MQAvD_BwE). The application of this package is the following:
```R
install.packages("hySpc.read.Witec")
library("hySpc.read.Witec")
hySpc.read.Witec("name/of/Witec/file.R")
```

---
# Report for Week of 6-15-20 (Week 8)

**Week-8-expected:**
Let the coding continue! Continue making progress on Goal 1. Compile a weekly report of progress made. Meet with mentors. (check-in with mentors as necessary)

**Week-8-actual:**

* Worked on developing the `hySpc.skeleton` package.

    * [Please see my contributions to this package here](https://github.com/r-hyperspec/hySpc.skeleton/commits?author=eoduniyi).

* Finally, the [PR](https://github.com/r-hyperspec/hySpc.dplyr/pull/24) relating to the generalization of `mutate()` was merged.

## 1. The Return of `hyperSpec.skeleton` (`hySpc.skeleton`)
According to [naming conventions](https://github.com/cbeleites/hyperSpec/issues/140), the `hyperSpec.skeleton` package has changed from `hyperSpec.skeleton` to `hySpc.skeleton`. Much of the work on this package was done with the gracious help of the rest of the [`r-hyperspec` team](https://github.com/orgs/r-hyperspec/people)

The [`hySpc.skeleton`](https://github.com/r-hyperspec/hySpc.skeleton) package includes the following folders `/` and files:

    /R
    /github-helpers
    /pkgdown
    /tests
    .travis.yml
    CONTRIBUTING.md
    DESCRIPTION
    LICENSE
    NEWS.md
    README.md
    _pkgdown.yml
    appveyor.yml
    codecov.yml
    project.Rproj

----
# Report for Week of 6-29-20 (Week 9)

**Week-9-expected:** This period will be used to write a detailed report on the work done in Coding Period 1. All work
completed will be uploaded and documented.

**June 29 - July 3: Phase 1 Evaluations**

_Deliverables_:

* Distilled `hyperSpec` package  

* New specialized `hyperSpec` packages for file I/O  

* New implemented import filters for new file formats

**Week-9-actual:**

* Got more clarification about the [`hySpc.testthat`](https://github.com/r-hyperspec/hySpc.testthat/issues/3) package.

## 1. `hypSpc.read.Witec`
This is the start of the file import output distillation process. Let the spectroscopy gods guide us.  

* [Please see my contributions to this package here](https://github.com/r-hyperspec/hySpc.read.txt/commits?author=eoduniyi)


### 1.1. Reading in ini files
```R
library(ini)
ini_file <- read.ini("/path/to/ini/file.txt")
ini_file$SpectrumData
ini_file$SpectrumMetaData

read.table(file = textConnection(unlist(ini_file))
names(ini_file)

# I need to cleanly extract the name-value pairs from the ini file, then format it in such a way that it can be used to create a `hyperSpec` object
```

To get the spectrum data from the header information:
```R
for (s in seq_along(i_spectra)) {
  data <- unlist(file[[i_spectra[s] + 2]])
  data <- scan(text = data, quiet = TRUE)
  data <- matrix(data, nrow = nwl, ncol = 2L, byrow = TRUE)

  #
  if (s == 1)
    wl <- data[, 1]
  else
    if (!all(wl == data[,1]))
      stop("Spectrum ", s, " has different wavelength axis.")

  spc[s,] <- data[, 2]
}
```

### 1.2. Developing `hySpc.read.Witec` for non-spc columns
Claudia, Roman, and I met on Wednesday to go over a lot of progress for the `hySpc.read.Witec` package. In particular, we helped each other make sure the package had the correct infrasturcutre (`pkgdown`, `hySpc.testthat`), fleshed out the functionality for reading in the `Witec` format. The work that Claudia did to get from the Header information of the example file to a complete `hyperSpec` object was pretty brilliant to watch. And I think while I don't understand all of the details the current `hySpc.read.Witec::read_txt_Witec_TrueMatch()` function has a lot of guides for parsing the remainder of the header information.

In fact, let's following the guidance left for us:
```R
read_txt_Witec_TrueMatch <- function(file) {

  # Set the filename variable to the file that was passed in as a parameter
  filename <- file

  # Use the ini::read_ini function to read in the ini-like file
  file <- read_ini(file)

  # Get header information
  # Note: A Witec_TrueMatch file could contain more than 1 spectra
  # Each spectra has the following headers: SpectrumHeader, SpectrumMetaData, SpectrumData
  i_spectra <- which(names(file) == "SpectrumHeader")

  # Using the index obtained from the i_spectra variable
  # Index the Witec_TrueMatch file for the header information and extract the SpectrumSize
  nwl <- sapply(file[i_spectra], function(hdr) hdr$SpectrumSize)
```

The next step is to get the remainder of the SpectrumHeader data from Witec_TrueMatch file:
```R
spc@data$header_variable <- value
sapply
```

## 2. Completition of GSoC Coding Period 1
Last week was not as productive as I hoped. This week marks the end of the first coding period. So, I wanted to review the outlined deliverables in the proposal for:

 1. Distilled `hypSpec` package
 2. New specialized `hyperSpec` packages for file I/O
 3. New implemented import filters for new file formats

As far as _1)_ is concerned, the team has managed to remove the use of Makefiles, which we believed was a critical component in distilling the original `hyperSpec` package. With this removal came others: `chondro` data set, the use of git-lfs. Moreover, the documentation infrastructure has been further developed, so that the  documentation can be built online, separately (i.e., through browser).

Currently at the very beginning of _2)_. At the moment, four new packages have been created: `hySpc.dplyr`, `hySpc.testthat`, `hySpc.read.Witec`, `hySpc.skeleton`, and `hySpc.pkgs`.

* `hySpc.dplyr`: Bridge and fortification package for the `tidyverse::dplyr` universe. Implements all of the standard data wrangling grammars (`rename`, `select`, `mutate/transmute`, `filter`, `between`, `slice`, etc.) for `hyperSpec` objects.

* `hySpc.testthat`: Infrastructure package for attaching unittest to functions as is standard in the `r-hyperspec` series (keeps unittest close to the functions - same file). This package is currently on CRAN.

* `hySpc.read.Witec`: Distill package for managing files produced by Witec instruments.

* `hySpc.pkgs`: "repository holding certain packages in the `r-hyperspec` series (in particular, data-rich packages that are too large to be distributed on CRAN)."

So although there are still approximately the same number of .R files, there has been a considerable effort to develop a leaner contribution, documentation, testing infrastructure, so that more concentrated `hyperSpec` distillation can be performed reliably and more efficiently. Though, I need some more clarification of the difference between _3)_ and _2)_ is. Even still, we are making our way to completing deliverables on time.

---
# Report for Week of 7-6-20 (Week 10)

**Week-10-expected:** Let the coding continue! Start making progress on Goals 2 and 3. Stick to the development cycle
for all weekly tasks. Compile a weekly report of progress made. Meet with mentors. (check-in with
mentors as necessary)

**Week-10-actual:**
* Continued to flesh out the `hySpc.read.Witec` package and worked on drat strategy for automated resource moving.

    * [Please see my contributions to this package here](https://github.com/r-hyperspec/hySpc.read.txt/commits?author=eoduniyi)


* Submitted a [PR](https://github.com/r-hyperspec/hySpc.read.txt/pull/3) for the [`read_txt_WitecTrueMatch.R`](https://github.com/r-hyperspec/hySpc.read.txt/blob/develop/R/read_txt_Witec_TrueMatch.R)

## 1. Github Actions and `pkgdown`
To be honest, the whole [DevOps](https://en.wikipedia.org/wiki/DevOps) side of the project (and software development in general) has been lost of me. I don't really understand what [Github Actions](https://github.com/features/actions) or [Github workflows](https://docs.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow) are or why they're useful. I also don't really understand how to use `pkgdown`. So, today we must do research into the nature of both of these systems.

### 1.1. Github Actions
Well, to get started with Github Actions (GA) - _A way to trigger task (workflow) when one or more events (pull request, issue, merging) have occurred within a repo_. one needs a Github repo. Additionally Within that repo a .yml file is specified (workflow.yml):

```
name: hyperSpec CI

on:
 event:
     branches: [develop]

jobs:
 test_pull_request:
 runs-on: ubuntu-latest
 steps:
     - uses: actions/
     - uses: actions/
         with:
         ...
     - run: ..
     - run: ..
```

There are a [number](https://github.com/learn/devops?utm_source=google&utm_medium=ppc&utm_campaign=devops_campaign_q1_IDCreport_ggl&utm_content=version1&gclid=CjwKCAjwnK36BRBVEiwAsMT8WIQtciCdDbJNTJ9Yq7H3cbMA7IeqVoYyKN4p18xJM_y3nXgPBayqjRoCIYEQAvD_BwE#idcreport) of open-source .yml solutions, as well as, configurations one can specify.

### 1.2. Let me tell you a secret
So, what is the difference between ["personal access tokens"](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token), ["Github secrets"](https://docs.github.com/en/rest/reference/actions#secrets), "keys", etc.

* Personal Access Tokens - _Personal access tokens (PATs) are an alternative to using passwords for authentication to GitHub when using the GitHub API or the command line._

* Secrets - _Secrets allow the storing of sensitive information_

### 1.3. `pkgdown`
According to the main website for `pkgdown`
> pkgdown is designed to make it quick and easy to build a website for your package.

### 1.4. `drat`
According to the maintainers, "Drat is an R package which makes it really easy to provide R packages via a repository, and also makes it easy to use such repositories for package installation and upgrades." via:
> Drat tries to help here and supports two principal modes:
>
> * GitHub by leveraging gh-pages
> * Other repos by using other storage where you can write and provide html access

### 1.5. Issue #2: Use Github Actions to Move .tar.gz over to hySpc.pkgs
According to Bryan, the team will be using `drat` and `hySpc.pkgs` to, "[hold] certain packages in the `r-hyperspec` series (in particular, data-rich packages that are too large to be distributed on CRAN)." The purpose of this is to avoid using git-lfs, and `make` and so that users can just install these large than life pkgs directly: `install_github(hySpc.pkgs)`. With that being said, we will still need CI/CD via GA. So, to test this out we're going to move `hySpc.read.Witec` to `hySpc.pkgs`

#### 1.6. Issue #2: Chef Hanson, Chef Oduniyi -- Serving up some actions
Over the weekend Bryan and I worked on fleshing out our drat formula, which basically looks like this, but in GA/.yml speak:

```R
if (package.size > CRAN.size) {

# put package on GH
}
else {

# put package on CRAN
}
```

A lot of these `hySpc.pkgs` will be data packages.

## 2. `hySpc.read.Witec`
Still working on the `hySpc.read.Witec` function. Most of the parsing of the Witec_TrueMatch file has been done. Additionally, a number of unittest have been implemented. The next couple task are to:

+ [x] find out better name
+ [x] provide axis labels
+ [x] x-axis units are in `$SpectrumHeader$XDataKind`
+ [x] allow users to specify extra data to keep
+ [x] unit testing
+ [ ] documentation


Instead of moving on to preparing the appropriate x-axis labels, I'm going to work on allowing the users to specify extra data columns, which I believe can be accomplished by having an argument in the `read_txt_Witec_TrueMatch` function:

```R
read_txt_Witec_TrueMatch <- function(file, keys.2header) {
    .
    .
    .
}
```

The `keys.2header` argument is taken from `hyperSpec::read.ENVI.R`, but I don't really understand how it's implemented. Instead, I'm going to take the `dplyr::mutate` approach, where the argument `.keep` can be set to either `c("all", "used", "unused", "none")`.

```R
read_txt_Witec_TrueMatch <- function(file, keys.2header = c("all", "none")) {
 .
 .
 .
 keys.2header <- arg_match(keys.2header)
 if (keys.2header == "all") {

     # Basically do what I've been doing
 } else if (keys.2header == "none") {

     # Only retain `spc`
 } else if (keys.2header != "all" && != "none") {

     # collect those columns + spc from the generated hyperSpec object
 } else {
     # Default to do what I've been doing
 }
 .
 .
 .
}
```

---
# Report for Week of 7-13-20 (Week 11)

**Week-11-expected:** Let the coding continue! Continue making progress on Goals 2 and 3. Compile a weekly report of
progress made. Meet with mentors. (check-in with mentors as necessary)

**Week-11-actual:**

* Reviewed Bryan's [PR](https://github.com/r-hyperspec/hySpc.read.txt/pull/4) for the deploy-pkg branch of `hySpc.read.txt`.

    * Learned how to update labels for a repo using the [GitHub Label Manager](http://www.dorukdestan.com/github-label-manager/)

    * All the labels for the `r-hyperspec` ecosystem are now "synced".


* Made some small [commits](https://github.com/r-hyperspec/hySpc.pkgs/commits?author=eoduniyi) to the [`hySpc.pkgs`](https://github.com/r-hyperspec/hySpc.pkgs) package

* Made some small [commits](https://github.com/r-hyperspec/hySpc.read.txt/commits?author=eoduniyi) to `hySpc.read.txt`

## 1. Labels
Okay, for whatever reason I have been letting a couple of things on the Trello "In Progress" list for a little too long. So, I want to try and go ahead and clean up some of these task if not finish this week:

**In Progress**
 * Check performance of different ways to import the text data

 * Attach labels to hySpc.testthat and hySpc.dplyr

 * Update hySpc.skeleton documentation to `hyperSpec` repo quality

 * `hySpc.read.Witec`

 * `hySpc.JCAMP-DX`

 * skeleton package and usethis strategy

 * Start making sure test coverage is at least 60% for `hyperSpec`

---
# Report for Week of 7-20-20 (Week 12)

**Week-12-expected:** Let the coding continue! Continue making progress on Goals 2 and 3. Compile a weekly report of progress made. Meet with mentors. (check-in with mentors as necessary)

**Week-12-actual:**
Not much progress this week because of personal issues/medical reasons:

---
# Report for Week of 8-27-20 (Week 13)

**Week-13-expected:** Let the coding continue! Start making progress on Goal 3. Stick to the development cycle for all
weekly tasks. Compile a weekly report of progress made. Meet with mentors. (check-in with mentors as necessary)

**July 27 - July 31: Phase 2 Evaluations**

_Deliverables_:

* Shielded `hyperSpec` and associated `hyperSpec` packages

* Fortified `hyperSpec` for `tidyverse`

**Week-13-actual:**
Not much progress this week because of personal issues/medical reasons.
* Worked on the [`hySpc.chondro`](https://github.com/r-hyperspec/hySpc.chondro) package.

    * [Please see my contributions to this package here](https://github.com/r-hyperspec/hySpc.chondro/commits?author=eoduniyi)

---
# Report for week of 8-3-20 (Week 14)

**Week-14-expected:** Let the coding continue! Continue making progress on Goal 3. Compile a weekly report of progress made. Meet with mentors. (check-in with mentors as necessary)

**Week-14-actual:**

* Closed a few of issues:

    * [Create separate data package (hySpc.chondro) for chondro](https://github.com/r-hyperspec/hySpc.chondro/issues/1) in `hySpc.chondro`

    * [Error with pandoc-citeproc ](https://github.com/r-hyperspec/hySpc.chondro/issues/13) in `hySpc.chondro`

    * [Renaming `hySpc.read.Witec` to `hySpc.read.txt`](https://github.com/r-hyperspec/hySpc.read.txt/issues/11) in `hySpc.read.txt`

* Opened an issue in `hyperSpec`:

    * [Formality of vignettes](https://github.com/cbeleites/hyperSpec/issues/266) in `hyperSpec`


* Completed small PRs related to `hySpc.chondro`

    * [Update DESCRIPTION](https://github.com/r-hyperspec/hySpc.chondro/pull/2)

    * [Chondro related functions](https://github.com/r-hyperspec/hySpc.chondro/pull/3)

    * [Added basic chondro documentation](https://github.com/r-hyperspec/hySpc.chondro/pull/4)

* Deleted a PR related to `hySpc.chondro`

    * [Documentation ](https://github.com/r-hyperspec/hySpc.chondro/pull/12)

---
# Report for week of 8-10-20 (Week 15)

**Week-15-expected:** Let the coding continue! Continue making progress on Goal 3. Compile a weekly report of progress made. Meet with mentors. (check-in with mentors as necessary)

**Week-15-actual:**
Test cases for the remaining styles of `Witec`...these test were taken from the original `hyperSpec` repo:

```R
# Throw the kitchen sink at it!
read.txt.Witec("fileio/txt.Witec/Witec-Map_full.txt",  type = "map", hdr.label = TRUE, hdr.units = TRUE)
read.txt.Witec("fileio/txt.Witec/Witec-Map_label.txt", type = "map", hdr.label = TRUE, hdr.units = FALSE)
read.txt.Witec("fileio/txt.Witec/Witec-Map_unit.txt",  type = "map", hdr.label = FALSE, hdr.units = TRUE)
read.txt.Witec("fileio/txt.Witec/Witec-Map_no.txt", type = "map", hdr.label = FALSE, hdr.units = FALSE)
read.txt.Witec("fileio/txt.Witec/Witec-Map_unit.txt",
               type = "map", hdr.label = FALSE, hdr.units = TRUE,
               points.per.line = 5
)
read.txt.Witec("fileio/txt.Witec/Witec-Map_no.txt",
               type = "map", hdr.label = FALSE, hdr.units = FALSE,
               lines.per.image = 5
)
read.txt.Witec("fileio/txt.Witec/Witec-Map_no.txt",
               type = "map", hdr.label = FALSE, hdr.units = FALSE,
               points.per.line = 5, lines.per.image = 5
)
```

---
# Report for week of 8-17-20 (Week 16)

**Week-16-expected:** Let the coding continue! Continue making progress on Goal 3. Compile a weekly report of progress made. Meet with mentors. (check-in with mentors as necessary)

**Week-16-actual:**

* Reviewed PRs related to `hyperSpec`

    * [Update DESCRIPTION](https://github.com/r-hyperspec/hySpc.chondro/pull/2)

    * [Chondro related functions](https://github.com/r-hyperspec/hySpc.chondro/pull/3)

    * [Added basic chondro documentation](https://github.com/r-hyperspec/hySpc.chondro/pull/4)

* Completed small PRs related to `hyperSpec`

    * [Change "I" to "We" to make it sound like a team project](https://github.com/cbeleites/hyperSpec/pull/265)

    * [Feature/vign edits](https://github.com/cbeleites/hyperSpec/pull/269)

* Completed PRs related to `hySpc.read.txt`

    * [Feature/io compare](https://github.com/r-hyperspec/hySpc.read.txt/pull/20)

    * [Issue/12 rename.2](https://github.com/r-hyperspec/hySpc.read.txt/pull/23)

    * [Issue/22 move copy](https://github.com/r-hyperspec/hySpc.read.txt/pull/24)

    * [Update count_lines.R, read_asc_Andor, & Perkin from `hyperSpec`](https://github.com/r-hyperspec/hySpc.read.txt/pull/26)

    * [Feature/vign edits](https://github.com/r-hyperspec/hySpc.read.txt/pull/28)

## Moving functions from `hyperSpec` to `hySpc.read.txt`
Moving the remaining functions related to `read.txt` out of `hyperSpec` into `read.txt`: This will require that the functions in `hyperSpec` will become deprecated. I'm going to need the `Deprecated.R` and `deprecation-messages.R` and copy the following functions:

+ [x] read.txt.Horiba.R
    - [x] `read.txt.Horiba`
    - [x] `read.txt.Horiba.xy`
    - [x] `read.txt.Horiba.t`
+ [x] read.txt.long.R
    - [x] `read.txt.long`
+ [x] read.txt.Renishaw.R
    - [x] `read.txt.Renishaw`
    - [x] `read.zip.Renishaw`
+ [x] read.txt.Shimadzu.R
    - [x] `read.txt.Shimadzu`
+ [x] read.txt.wide.R
    - [x] `read.txt.wide`
+ [x] read.txt.Witec.R
    - [x] `read.txt.Witec`
    - [x] `read.dat.Witec`
    - [x] `read.txt.Witec.Graph`
+  ~~wc.R~~
    - ~~`wc`~~
+ [x] count_lines.R
    - [x] `count_lines`
+ [x] read.asc.Andor.R
    - [x] `read.asc.Andor`
+ [x] read.asc.PerkinElmer.R
    - [x] `read.asc.PerkinElmer`

---
# Report for week of 8-24-20 (Week 17)

**Week-17-expected:** Let the coding continue! Wrap up progress on Goal 3. Compile a weekly report of progress made.
Meet with mentors. (check-in with mentors as necessary)

**Week-17-actual:**
With the guidance of the [`r-hyperspec` team](https://github.com/orgs/r-hyperspec/people) I worked on my final GSoC2020 report. I did my best to follow the guidelines as stated [here]().

---
# September 8: Final Results
All documentation, code modules (files, packages, etc.), and their associated tests have been uploaded. Excluding the three deliverables promised at the end of the third coding period:

* Fortified `hyperSpec` for `baseline` with bridge packages

* Fortified `hyperSpec` for `EMSC` with bridge packages

* Fortified `hyperSpec` for `matrixStats` with bridge packages.

And so, with the support of the `r-hyperspec` team all other deliverables promised for R GSoC 2020 have been...delivered. Furthermore, I plan on continuing to work with the `r-hyperspec` team for the foreseeable future. That is, the remaining deliverables, issues, features, and their associated documentation will continue to be worked on by me and the `r-hyperspec` team as time permits.

---
# Final Notes
"_There is no such thing as perfect and no plan is ever problem-free. Life does not wait for coding projects or internships to finish. So, if there is a decline in health or other personal and family issues arise, [you] should take a deep breath and let [your] mentors know what is going on without TMI. If [you] foresee a setback in development, make sure to communicate [your] difficulties and get suggestions on how to pivot from mentors so that milestones and deliverables can still be met in a timely manner._" - E. Oduniyi
