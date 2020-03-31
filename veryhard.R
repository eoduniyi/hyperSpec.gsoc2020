##' Spectra plotting with ggplot2
##'
##' These functions are still experimental and may change substantially in future.
##' @title Spectra plotting with ggplot2
##' @param x hyperSpec object
##' @param wl.range wavelength ranges to plot
##' @param ... handed to \code{\link[ggplot2]{geom_line}}
##' @param mapping see  \code{\link[ggplot2]{geom_line}}
##' @param spc.nmax maximum number of spectra to plot
##' @param map.lineonly if \code{TRUE}, \code{mapping} will be handed to
##' \code{\link[ggplot2]{geom_line}} instead of \code{\link[ggplot2]{ggplot}}.
##' @param debuglevel if > 0, additional debug output is produced
##' @return a \code{\link[ggplot2]{ggplot}} object
##' @include unittest.R
##' @author Claudia Beleites
##' @export
##' @seealso \code{\link{plotspc}}
##'
##' \code{\link[ggplot2]{ggplot}}\code{\link[ggplot2]{geom_line}}
##' @examples
##'
##'   qplotspc (chondro)
##'
##'   qplotspc (paracetamol, c (2800 ~ max, min ~ 1800)) + scale_x_reverse (breaks = seq (0, 3200, 400))
##'
##'   qplotspc (aggregate (chondro, chondro$clusters, mean),
##'             mapping = aes (x = .wavelength, y = spc, colour = clusters)) +
##'     facet_grid (clusters ~ .)
##'
##'   qplotspc (aggregate (chondro, chondro$clusters, mean_pm_sd),
##'             mapping = aes (x = .wavelength, y = spc, colour = clusters, group = .rownames)) +
##'     facet_grid (clusters ~ .)
qplotspc <- function(x,
                     wl.range = TRUE, ...,
                     mapping = aes_string(x = ".wavelength", y = "spc", group = ".rownames"),
                     spc.nmax = hy.getOption("ggplot.spc.nmax"),
                     map.lineonly = FALSE,
                     debuglevel = hy.getOption("debuglevel")) {
  chk.hy(x)
  validObject(x)

  ## cut away everything that isn't asked for _before_ transforming to data.frame
  if (nrow(x) > spc.nmax) {
    if (debuglevel >= 1L) {
      message("Number of spectra exceeds spc.nmax. Only the first ", spc.nmax, " are plotted.")
    }
    x <- x [seq_len(spc.nmax)]
  }

  wl.range <- wl2i(x, wl.range, unlist = FALSE)

  x <- x [, , unlist(wl.range), wl.index = TRUE]

  df <- as.long.df(x, rownames = TRUE, na.rm = FALSE) # with na.rm trouble with wl.range

  ## ranges go into facets
  if (length(wl.range) > 1L) {
    tmp <- wl.range
    for (r in seq_along(tmp)) {
      tmp [[r]][TRUE] <- r
    }

    df$.wl.range <- rep(unlist(tmp), each = nrow(x))
  }


  df <- df [!is.na(df$spc), , drop = FALSE]
  if (map.lineonly) {
    p <- ggplot(df) +
      geom_line(mapping = mapping, ...)
  } else {
    p <- ggplot(df, mapping = mapping) +
      geom_line(...)
  }

  p <- p + xlab(labels(x, ".wavelength")) + ylab(labels(x, "spc"))

  if (!is.null(df$.wl.range)) {
    p <- p + facet_grid(. ~ .wl.range,
                        labeller = as_labeller(rep(NA, nlevels(df$.wl.range))),
                        scales = "free", space = "free"
    ) +
      theme(strip.text.x = element_text(size = 0))
  }

  p
}

# Begin unit testing (UT)
.test(qplotspc) <- function(){
  context("qplot")

  # UT1
  test_that("plot returns ggplot object", {
    p <- qplotspc(chondro)
    expect_is(p, "ggplot")
  })

  # UT2
  test_that("plot uses correct data", {
    p <- qplotspc(chondro)
    expect_equal(p$data$x, chondro@data$x)
    expect_equal(p$data$y, chondro@data$y)
  })

  # UTTODO: Create unit test for hyperSpec object nuances.

}
