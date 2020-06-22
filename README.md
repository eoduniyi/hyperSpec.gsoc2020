# [Report for Week of 6-15-20](/blog/weekly_reports.md)
#### Return of hyperSpec.skeleton (hySpc.skeleton)
According to naming conventions, the hyperSpec skeleton package has changed from
`hyperSpec.skeleton` to `hySpc.skeleton`

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