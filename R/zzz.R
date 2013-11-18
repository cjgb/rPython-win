#########################################################
# CGB, 20100716
#########################################################

.onLoad <- function( libname, pkgname ){

    library.dynam( "rPython", pkgname, libname )
    .C( "py_init", PACKAGE = "rPython" )
}

.onUnload <- function( libpath ){
    .C( "py_close", PACKAGE = "rPython" )
    library.dynam.unload( "rPython", libpath )
}
