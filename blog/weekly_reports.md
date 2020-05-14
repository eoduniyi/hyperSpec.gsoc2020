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
TODO: I should install the R development branch via subversion
TODO: Sketch out fileIO design
TODO: Sketch out package splitting design (reference 2011 presentation by Claudia)
TODO: Read "An Introduction to PCA"
TODO: Read "Evaluating the Design of the R language"
