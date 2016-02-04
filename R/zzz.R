#########################################################
# CGB, 20100716
#########################################################

.onLoad <- function( libname, pkgname ){

    if (.Platform$OS.type == 'windows') {
        rpyopts <- getOption('rPython.paths')
        rarch <- .Platform$r_arch       # i386 or x64

        if (rarch %in% names(rpyopts)) {
            wrongarch <- setdiff(c('i386', 'x64'), rarch)[[1]]

            pyhome <- rpyopts[[rarch]]
            pypath <- file.path(pyhome, 'Lib')
            pyhomewin <- normalizePath(pyhome)
            pypathwin <- normalizePath(pypath)

            wrongpyhome <- rpyopts[[wrongarch]]
            wrongpyhomewin <- normalizePath(wrongpyhome)

            if (! nzchar(Sys.getenv("PYTHONHOME"))) {
              message("Manually setting PYTHONHOME: ", pyhome)
              Sys.setenv(PYTHONHOME = pyhomewin)
            }
            if (! nzchar(Sys.getenv("PYTHONPATH"))) {
              message("Manually setting PYTHONPATH: ", pypath)
              Sys.setenv(PYTHONPATH = pypathwin)
            }

            path <- strsplit(Sys.getenv("PATH"), ";")[[1]]
            idx <- tolower(wrongpyhomewin) ==
              tolower(substr(path, 1, nchar(wrongpyhomewin)))
            path[idx] <- paste(pyhomewin, substr(path[idx], 1 + nchar(wrongpyhomewin), 999), sep = "")
            Sys.setenv(PATH = paste(path, collapse = ";"))
        } else {
            # provide a warning to the user suggesting adding an option
            warning(paste("Did not find definitions of the paths to 32-bit and 64-bit python.",
                          "Suggestion: adding the following to your .Rprofile file:",
                          "options(rPython.paths = list(i386 = '/path/to/py32', x64 = '/path/to/py64'))",
                          collapse = "\n"))
        }
    }

    library.dynam( "rPython", pkgname, libname )
    .C( "py_init", PACKAGE = "rPython" )
}

.onUnload <- function( libpath ){
    .C( "py_close", PACKAGE = "rPython" )
    library.dynam.unload( "rPython", libpath )
}
