library(hyperSpec)
# Take a look at the flu object
flu
# Take a look at the flu object data
head(flu@data, 3)
# Plot flu
qplotspc(flu, spc.nmax = 3)
# Collect the indices of the specified wavelength
wl2i(flu, 405:407)
wl2i(flu, 405~407)

flu
flu[, , wl2i(flu, 405~407), wl.index = TRUE]

# flu
# head(flu@data)
# mat <- matrix(1:9, nrow = 3, ncol = 3)
# mat
# spc <- matrix (rnorm (12), ncol = 4)
# colnames (spc) <- 600:603
# spc
# flu@data$spc[2,3]

wl.range <- wl2i(flu, c(405:407, 408:409), unlist = TRUE)

length(wl.range)
tmp <- wl.range
tmp
seq_along(tmp)
tmp[[1]][TRUE] <- 1
tmp
tmp[[2]][TRUE] <- 2
tmp
unlist(tmp)
1:length(c(1,3,4,2))
qplotspc(flu, spc.nmax = 3)
