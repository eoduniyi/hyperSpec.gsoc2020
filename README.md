# [Report for Week of 6-22-20](/blog/weekly_reports.md)

### `hySpc.read.Witec`
`hySpc.read.Witec` is a bridge package for managing all kinds of files produced by Witec instruments. The application of this package is the following:
```R
install.packages("hySpc.read.Witec")
library("hySpc.read.Witec")
hySpc.read.Witec("name/of/Witec/file.R")

---

 # [Meeting notes for 6-29-20](/blog/meeting_notes.md)

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