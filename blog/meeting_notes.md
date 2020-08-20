# Meeting notes for 8-17-20
Absent

---
# Meeting notes for 8-10-20

**What was decided**

Continue to make progress according to the Trello board.

**What was discussed**
* Permissions on `hySpc.testthat`, `hySpc.read.Witec`
* Vil's changes:
 * Adding and removing full stops from documentation
 * Rename RStudio project name
 * Deprecated ggplot2 functions
* Deprecate functions from `hypSpc.read.Witec` and `hySpc.chondro`

---
# Meeting notes for 8-3-20
**What was decided:**
* Turn unittest on back on for the `hySpc.read.Witec`
* Avoid working with pca data and just use raw data
* Write unittest in the meantime
* Add expect_silent or TODO or FIXME labels
* Find solutions to issue #212

**What was discussed:**
* Turn `hySpc.read.Witec` into `hySpc.read.txt`
* Manufacturer specific file formats
* Catch up on moving everything from `hyperSpec` related to `chondro` and `hySpc.chondro` to a separate branch of `hyperSpec`.
* Automatically delete branches
* Writing unittest
 * Writing small unittest
  * expect_silence
  * Still need to check expect_equivalence and expect_equal
* covr::report(covr::package_coverage("hyperSpec"))
* Claudia going for her last bullet point

---
# Meeting notes for 7-27-20
Missed this meeting because I was sick. Notes have been archived on the trello board.

---
# Meeting notes for 7-20-20
**What was decided:**
* Chondro vignette with move to `hySpc.chondro` to `hySpc.pkgs`
* Get rid of vignette dependencies
* Different versions of `faux_cell`

**What was discussed:**
* Interpolated plotting
* Translating .pdf and .html files to vignettes
* `knitr`, `sweave`, and other document preparing engines.
* Removing `rgl` depedency
* How to get `plsr` to work with `hyperSpec`
* Unit testing:
    * General unittesting
     * Checking if functions work
    * Specific unittesting
    * test against averages not specific numerical result
    * testing the underlying functions

---
# Meeting notes for 7-15-20
**What was decided:**
* Add automated way to archive/past TODOs to past meetings list on Trello
 * Add meeting minutes: "What was discussed", "what was decided"
 * Add links to Trello board -> {github_issues, slack_conv}
* Add deploy on master branch for GA:
* Try and test different merge/manage/commit settings
* Make sure that all of the bridge tidyverse packages follow the tidyverse conventions
* Finishing up `hySpc.read.Witec`
    * Check code coverage
    * Check into skipped test
    * Check the difference between `hySpc.read.Witec` and `hySpc.skeleton`
 * Apply changes from `hySpc.read.Witec` to `hySpc.skeleton`.
    * Remove Witec files from `develop` branch of `hypSpec`
     * Add `hyperSpec::deprecation()` to `hyperSpec`
     * We should add::FIX_ME or TODO
      * Where did this file/pkg go?
      * Add documentation to refer to pkg_down site
* Check to see what the difference between template and derived
    * Is the skeleton repo settings the same as its derived pkg settings?

**What was discussed:**
* Generating master and develop .zip (Windows) and .tar.gz (MacOS) files
* What is the best way to keep track of the notes during video meetings?
* Experimenting with various CI/CD interfaces to figure out if we want to go with a specific
CI/CD framework.
* automated README.md for `hySpc.pkgs`
 * Update README.md based on the differnce between the different branches...
* `hySpc.pkgs` supporting the ability to choose between different branches
* Adding automated deletion for the hySpc repos
* Interconnecting `baseline` and `hyperSpec`
* Go through proper deprecation cycle
    * Using `hyperSpec::deprecated()` or `defunct` to interface to the other pkg names
* Having function-specific license: MIT or GPL3
* Don't add LICENSE file'
* Removing dependencies

---

# Meeting notes for 7-6-20
**Things to do:**
* Finish the todo list for the `hySpc.read.Witec` pkg
* Start implementation of the `hySpc.read.JCAMP-DX` pkg

**Things to look into:**
* `drat` and `piggyback` packages
 * `drat` is more of a strategy - repo with data in it
 * `piggyback` - ...
* Color palettes for spectroscopy analysis
* `usethis` strategy
* Strategy for skeleton
 * GitHub templates
 * Make a checklist of what files should be effected
   * patches
* Github Actions and pkgdown
* Claudia's hyperSpec lecture

---

# Meeting notes for 6-29-20

**Things to do:**
* `hySpc.skeleton` should be built on CI
* Testing documentation to be used under version control
* Splitting file import package by manufactures
* Get smaller Witec files
* Change the naming convention from "." to "_"
* Use package `ini`

**Things to look into:**
* `drat` and `piggyback` packages
 * `drat` is more of a strategy - repo with data in it
 * `piggyback` -
* Color palettes for spectroscopy analysis
* `usethis` strategy
* Strategy for skeleton
 * GitHub templates
 * Make a checklist of what files should be effected
   * patches

---

# Meeting notes for 6-22-20

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

---

# Meeting notes for 6-15-20

**Things to do:**
 * Cleaning up `hySpc.dplyr`
 * Update unit test to work with `hySpc.testthat`

**Things to apply:**
 * Make sure version numbering system follows `tidyverse`

**Things to consider:**
 * update fauxCell so that is can parameterized
 * Operations with hyperSpec objects

**Things to look into:**
 * `gtools::keywords()`
 * negative factorization
 * principle component analysis (pca)

---

# Meeting notes for 6-8-20
**Things to do:**
 * Cleaning up `hySpc.dplyr`
 * Update unit test to work with `hySpc.testthat`
 * Move `hyperSpec.tidyverse` to `hySpc.dplyr`
 * Travis has been activated for r-hyperSpec organization

**Things to check:**
 * R hyperSpec project has been created (r-hyperSpec)

**Things to apply:**
 * Make sure version numbering system follows `tidyverse`

**Things to consider:**
 * update `fauxCell` so that is can parameterized
 * Operations with hyperSpec objects
 * plotting
  * `base` plots create graphs really quickly (pen and paper)
  * `lattice` provides the ability to add facets, and aesthetics
  * `ggplot2` is more powerful and aesthetically pleasing (pencil and paper)
  * `plotly` is interactive

**Things to look into:**
 * Vilmantis has created a `hySpc.ggplot2`
  * We would like to separate `ggplot2` and general plotting for `hyperSpec`.
  * Consider only keeping general plotting (`base` and `lattice`) in hyperSpec.
 * negative factorization
 * principle component analysis (pca)

---

# Meeting notes for 6-1-20
**Things to do:**
 * When replacing `chondro` make sure to:`make -> build -> check`

**Things to apply:**
 * Convention for writing unit test
    * ``.test(.name_of_function)``
    * There are some files without unit test
    * There are some files where anonymous functions are used

**Things to consider:**
 * Ecosystem and satellite packages

---

# Meeting notes for 5-25-20

**Things to do:**
 * Get a structure without make and latex
 * Get online documentation!
 * Check apply method

**Things to look into:**
 * CRAN Submission process
 * `Winbuilder`
 * `pkgdown`

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

---
# Meeting notes for 5-11-20

### License
Contributing under hyperSpec should be free

---


### Trello
Will be using Trello as a way to organize high-level task, quick links, resources, agendas, and todos

---

### hyperSpec's contributors guideline
Roman will be working on a draft. I can help by adding weekly meeting notes and weekly reports

---

### Github workflow
In general, the workflow for contributing to the the hyperSpec ecosystem is the following:
  1. Create an issue proposing a feature, specifying a bugfix or something more vanilla (i.e., documentation, styling, etc.)
  2. Discuss issue and design with contributors
  3. Create a new branch that will contain the issue implementation
  4. Commit and push until issue is implemented
  5. Submit a pull request from the newly created issue branch
  6. Code review
  7. Make necessary changes
  8. Merge branch into master/development

---

### Package skeleton
TODO: Create a package skeleton and associated github repo that contains unittest and contious integration.

---

### Package building
TODO: Read up on git-lfs, CMAKE, win-builder, and r-hub

**Note:** I should install the R development branch via subversion

---

### Development Trajectory
In terms of contributing, there are a number of entry points I can start on:
* going on with hyperspec.tidyverse
* integration with ggplot2
* tackling issue of taking out file import filters and putting them in their own package

**Note:** Different instrument manufactures have unique local import and export formats
