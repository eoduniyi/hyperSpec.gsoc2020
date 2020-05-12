# Report for Week of 5-11-20

### 1. Package skeleton
Create a package skeleton and associated github repo that contains unittest and continuous integration.

#### 1.1 Creating a hyperSpec package skeleton
Because I will be creating a lot of R packages there should be a package pattern to ensure a consistent infrastructure style is present across the hyperSpec ecosystem. Every hyperSpec package should then include the following components:

  1. Github repository
  2. R project file
  3. unit test via `testthat`
  4. continuous integration (CI) via [travis]() and [appveyor]()
  5. code coverage via `covr` and [codecov.io]()

##### 1.1.1 Create a Github repository

##### 1.1.2 Create a R package via RStudio

##### 1.1.3 Set up testthat for unit testing

##### 1.1.4 Set up CI for travis and appveyor

##### 1.1.5 Set up code coverage

##### 1.1.6 Adding badges
---

### 2. Package building
Read up on git-lfs, CMAKE, win-builder, and r-hub

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
TODO: Read up on git-lfs, cMAKE, win-builder, and r-hub

**Note:** I should install the R development branch via subversion

---

### Development Trajectory
In terms of contributing, there are a number of entry points I can start on:
* going on with hyperspec.tidyverse
* integration with ggplot2
* tackling issue of taking out file import filters and putting them in their own package

**Note:** Different instrument manufactures have unique local import and export formats
