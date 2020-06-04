# Report for Week of 5-18-20

### 1. Generalizing mutate.R and improving setLabels.R

### 2. `pkgdown` and `drat`

### 3. Flesh hyperSpec.skeleton Github repository
Add template labels to hyperSpec.skeleton so that the hyperSpec ecosystem has a consistent set of labels.

### 4. Figure out the build/make issue of hyperSpec

### #. PCA

<s>TODO: I should install the R development branch via subversion</s>
TODO: Read "An Introduction to PCA"
TODO: Read "Evaluating the Design of the R language"

---
# Meeting notes for 5-18-20

## Outstanding bug fixes
There are still a couple of "bugs" that need to be taken care of before further features should be implemented.

* <b>Building issues on macOS</b>
    * Claudia sent a her local hyperSpec git repo
        * Navigating to the Rproj file within hyperSpec seems to builds fine
        * What are the difference between the hyperSpec package in Claudia zip and my current clone of hyperSpec (perhaps the building error exist somewhere there...)

**Note:** bug fixes (bugfix/) should always come before features (feature/)
**Note:** In RStudio, the CI build processes can be run using `ctrl shift E`

## Generalizing mutate.R
At the moment, mutate.R is implemented using an approach that is mostly based on checking for the language (checking against hardcoded strings). `mutate.R` should be robust enough to handle any additional column that has matrices in the column (row).

**Note:** Make sure all the .R files follow the tidtverse styling conventions as well as the convention of keep blank lines before comments and control structures.

### Set up development R
TODO: Install the development version of R (4.1)
TODO: Install subversion (svn)

### Unit testing: `tinytest` vs `testthat`
The hyperSpec team will continue to use `testthat` are the unit testing package and continue to append the unit test to the function definitions.

### Synthetic data
There are a number of real world examples in the hyperSpec data. In fact, each of these data sets attempt to capture some practical aspect of spectroscopy:

- **chondro** - map
- **flu** - concentration depedency
- **laser** - time series
- **paracetamol** - roman spectrum with uneevn spacing ofthe wavelength (overlap)
- **barbiturates** - list of hyperSpec objects that have different wavelength axis (mass spectroscopy)

Unfortunately, these data sets are large and also have to be shipped with the package. Also, it means that contributors must be using `git lfs` if they would like to propose and implement features. Also, `git lfs` has some sort of quota on the number of uploads and downloads...so having a smaller data examples (that maintain the same structure of the original data examples) or having data sets that can be downloaded when the user needs it. So, Bryan is working on a synthetic data set that will hopefully take care of this issue.

### Outaded hypSpec objects
hyperSpec objects that have the `@log` will fail the `validObject` check, so their should be some way for users to update their hyperSpec (or know that they should update) object.

### `pkgdown` and `drat`
Apparently `pkgdown` and `drat` could help with documentation and current data issues.

TODO: Do some research on `pkgdown` and `drat`

