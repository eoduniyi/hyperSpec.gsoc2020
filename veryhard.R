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

  # UT1: testing parts 1, 3, 4, & 5
  test_that("spc.nmax and debuglevel arguments are correctly applied", {
    hy.setOptions(ggplot.spc.nmax = 5, debuglevel = 1L)
    tmp <- flu
    tmp <- tmp[seq_len(hy.getOption("ggplot.spc.nmax"))]
    wl.range <- wl2i(tmp, TRUE, unlist = FALSE)
    tmp <- tmp[, , unlist(wl.range), wl.index = TRUE]
    df <- as.long.df(tmp, rownames = TRUE, na.rm = FALSE)
    df <- df[!is.na(df$spc), , drop = FALSE]
    expect_identical(ggplot_build(qplotspc(flu))$plot$data, df)
    expect_message(ggplot_build(qplotspc(flu))$plot$data)
  })
  test_that("wl.range argument is correctly applied", {
    hy.setOptions(ggplot.spc.nmax = 10)
    tmp <- flu
    wl.range <- wl2i(tmp, 405:410, unlist = FALSE)
    tmp <- tmp[, , unlist(wl.range), wl.index = TRUE]
    df <- as.long.df(tmp, rownames = TRUE, na.rm = FALSE)
    df <- df[!is.na(df$spc), , drop = FALSE]
    expect_identical(ggplot_build(qplotspc(flu, 405:410))$plot$data, df)
  })
  test_that("mapping and map.lineonly arguments are correctly applied", {
    hy.setOptions(ggplot.spc.nmax = 10)
    tmp <- flu
    wl.range <- wl2i(tmp, TRUE, unlist = FALSE)
    tmp <- tmp[, , unlist(wl.range), wl.index = TRUE]
    df <- as.long.df(tmp, rownames = TRUE, na.rm = FALSE)
    df <- df[!is.na(df$spc), , drop = FALSE]
    p <- ggplot(df, mapping = aes_string(x = ".wavelength", y = "spc", group = ".rownames")) + geom_line()
    expect_equal(qplotspc(flu, map.lineonly = FALSE)$mapping, p$mapping)
    p <- ggplot(df) + geom_line(mapping = aes_string(x = ".wavelength", y = "spc", group = ".rownames"))
    expect_identical(qplotspc(flu, map.lineonly = TRUE)$mapping, p$mapping)
  })

  # UT2: testing part 2
  test_that("non hyperSpec objects are rejected", {
    tmp <- flu$spc
    df <- data.frame(a = NA, b = NA)
    expect_error(qplotspc(tmp))
    expect_error(qplotspc(df))
  })

  # UT3: testing part 6
  test_that("facets and labels correctly applied", {
    hy.setOptions(ggplot.spc.nmax = 10)
    tmp <- flu
    wl.range <- wl2i(tmp, TRUE, unlist = FALSE)
    tmp <- tmp[, , unlist(wl.range), wl.index = TRUE]
    df <- as.long.df(tmp, rownames = TRUE, na.rm = FALSE)
    df <- df[!is.na(df$spc), , drop = FALSE]
    p <- ggplot(df, mapping = aes_string(x = ".wavelength", y = "spc", group = ".rownames")) + geom_line()
    p <- p + xlab(labels(tmp, ".wavelength")) + ylab(labels(tmp, "spc"))
    # p <- p + facet_grid(. ~ .wl.range,
    #                     labeller = as_labeller(rep(NA, nlevels(df$.wl.range))),
    #                     scales = "free", space = "free") +
    #   theme(strip.text.x = element_text(size = 0))
    expect_equal(qplotspc(flu)$facet, p$facet)
    expect_equal(qplotspc(flu)$labels, p$labels)
    expect_equal(qplotspc(flu)$layers, p$layers)
    expect_equal(qplotspc(flu)$scales, p$scales)

  })

  # UT4
  test_that("a ggplot is returned", {
    p <- qplotspc(chondro)
    expect_is(p, "ggplot")
  })

}
