# Report for Week of 7-27-20
Worked on `hySpc.chondro` as my psychological weaknesses permitted.

---
# [Meeting notes for 8-3-20](/blog/meeting_notes.md)
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
 * Writing small unittestw
  * expect_silence
  * Still need to check expect_equivalence and expect_equal
* covr::report(covr::package_coverage("hyperSpec"))
* Claudia going for her last bullet point