#########################################################
# CGB, 20100716, created
#########################################################

python.get <- function( var.name ){

    python.command <- paste( "_r_return = json.dumps( [", var.name, "] )", sep = "" )
    python.exec( python.command, get.exception = FALSE )

    ret <- .C( "py_get_var", "_r_return", not.found.var = integer(1), resultado = character(1), PACKAGE = "rPython" )

    if( ret$not.found.var )
        stop( "Variable not found" )
        
    ret <- fromJSON( ret$resultado )
    if( length( ret ) == 1 ) ret <- ret[[1]]
    ret
}

