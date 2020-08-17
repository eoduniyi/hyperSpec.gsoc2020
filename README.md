# Report for week of 8-16-20
# Report for week of 8-11-20
```R

# Throw the Kitchen Sink at it
# read.txt.Witec("fileio/txt.Witec/Witec-Map_full.txt",  type = "map", hdr.label = TRUE, hdr.units = TRUE)
#
# read.txt.Witec("fileio/txt.Witec/Witec-Map_label.txt", type = "map", hdr.label = TRUE, hdr.units = FALSE)
#
# read.txt.Witec("fileio/txt.Witec/Witec-Map_unit.txt",  type = "map", hdr.label = FALSE, hdr.units = TRUE)
#
# read.txt.Witec("fileio/txt.Witec/Witec-Map_unit.txt",
#                type = "map", hdr.label = FALSE, hdr.units = TRUE,
#                points.per.line = 5
# )
#
# read.txt.Witec("fileio/txt.Witec/Witec-Map_no.txt", type = "map", hdr.label = FALSE, hdr.units = FALSE)
#
# read.txt.Witec("fileio/txt.Witec/Witec-Map_no.txt",
#                type = "map", hdr.label = FALSE, hdr.units = FALSE,
#                lines.per.image = 5
# )
#
# read.txt.Witec("fileio/txt.Witec/Witec-Map_no.txt",
#                type = "map", hdr.label = FALSE, hdr.units = FALSE,
#                points.per.line = 5, lines.per.image = 5
# )

# Release data
```

---
# [Meeting notes for 8-3-20](/blog/meeting_notes.md)
# [Meeting notes for 8-17-20](/blog/meeting_notes.md)
# [Meeting notes for 8-10-20](/blog/meeting_notes.md)
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