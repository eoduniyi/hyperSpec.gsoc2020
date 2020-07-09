# [Report for Week of 6-29-20](/blog/weekly_reports.md)

## `hypSpc.read.Witec`
This is the start of the file import output distillation process. Let the spectroscopy gods guide us.

```R
library(ini)
ini_file <- read.ini("/path/to/ini/file.txt")
ini_file$SpectrumData
ini_file$SpectrumMetaData

read.table(file = textConnection(unlist(ini_file))
names(ini_file)

# I need to cleanly extract the name-value pairs from the ini file, then format it in such a way that it can be used to create a hyperSpec object
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

### Developing `hySpc.read.Witec` for non-spc columns
Claudia, Roman, and I met on Wednesday to go over a lot of progress for the `hySpc.read.Witec` package. In particular, we helped each other make sure the package had the correct infrasturcutre (`pkgdown`, `hySpc.testthat`), fleshed out the functionality for reading in the Witec_TrueMatch format. The work that Claudia did to get from the Header information of the example file to a complete hyperSpec object was pretty brilliant to watch. And I think while I don't understand all of the details the current `hySpc.read.Witec::read_txt_Witec_TrueMatch()` function has a lot of guides for parsing the remainder of the header information.

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

use `which` to find out which of the names equals the spectrum header. Each of the spectrum has three list element (header, meta data, spectrum data). Then, loop over all of the spectrum and convert each of them to a.

## Completition of GSoC Coding Period 1

Last week was not as productive as I hoped. This week marks the end of the first coding period. So, I wanted to review the outlined deliverables in the proposal for:

 1. Distilled `hypSpec` package
 2. New specialized `hyperSpec` packages for file I/O
 3. New implemented import filters for new file formats

As far as _1)_ is concerned, the team has managed to remove the use of Makefiles, which we believed was a critical component in distilling the original hyperSpec package. With this removal came others: `chondro` data set, the use of git-lfs. Moreover, the documentation infrastructure has been further developed, so that the  documentation can be built online, separately (i.e., through browser).

Currently at the very beginning of _2)_. At the moment, four new packages have been created: `hySpc.dplyr`, `hySpc.testthat`, `hySpc.read.Witec`, `hySpc.skeleton`, and `hySpc.pkgs`.

 * `hySpc.dplyr`: Bridge and fortification package for the `tidyverse::dplyr` universe. Implements all of the standard data wrangling grammars (`rename`, `select`, `mutate/transmute`, `filter`, `between`, `slice`, etc.) for hyperSpec objects.

 * `hySpc.testthat`: Infrastructure package for attaching unittest to functions as is standard in the hyperSpec series (keeps unittest close to the functions - same file). This package is currently on CRAN.

 * `hySpc.read.Witec`: Distill package for managing files produced by Witec instruments.

 * `hySpc.pkgs`: "repository holding certain packages in the r-hyperspec series (in particular, data-rich packages that are too large to be distributed on CRAN)."

 So although there are still approximately the same number of .R files, there has been a considerable effort to develop a leaner contribution, documentation, testing infrastructure, so that more concentrated hyperSpec distillation can be performed reliably and more efficiently.

 And honestly, I'm not even sure what the difference between _3)_ and _2)_ is. Even still, we are making our way to completing deliverables on time.

---

# [Meeting notes for 7-6-20](/blog/meeting_notes.md)

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