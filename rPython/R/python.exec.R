#########################################################
# CGB, 20100716
#########################################################

python.exec <- function( python.code, get.exception = TRUE ){

    if( ! get.exception ){
        exit.status <- .C( "py_exec_code", python.code, exit.status = integer(1), PACKAGE = "rPython" )$exit.status
        return( exit.status )
    }

    # removel the previous exception in python, if any
    .C( "py_exec_code", "try:del _r_error\nexcept Exception:pass", exit.status = integer(1), PACKAGE = "rPython" )

    # Creating the call; the call is embeded into a try-catch expression in order to capture possible exceptions
    if( length( python.code ) == 1 )
        python.code <- strsplit(python.code, "\n|\r\n" ) 

    python.code <- as.character( sapply( python.code, function( x ) paste( "\t", x, sep = "" ) ) )
    python.code <- paste( "try:", paste( python.code, collapse = "\n" ), "except Exception as e:_r_error = e.__str__()\n", sep = "\n" )

    exit.status <- .C( "py_exec_code", python.code, exit.status = integer(1), PACKAGE = "rPython" )$exit.status          # Exit status always good as any exception is captured

    ret <- .C( "py_get_var", "_r_error", no.error = integer(1), error.desc = character(1), PACKAGE = "rPython" )
    if( ! ret$no.error )
        stop( ret$error.desc )

    invisible( NULL )
}



