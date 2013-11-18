#########################################################
# CGB, 20100707, created
#########################################################

python.assign <- function( var.name, value ){

    #value <- toJSON( value )
    value <- toJSON( value, collapse = "" )

    # Creating the call

    python.command <- c( 
        paste( var.name , "='", value, "'",  sep = " " ),
        paste( var.name , "= json.loads(", var.name, ")", sep = "" ),
        paste( "if len(",  var.name , ") == 1:", sep = "" ),
        paste( "    ", var.name, "=", var.name, "[0]" ) 
    )

    python.command <- paste( python.command, collapse = "\n" )

    python.exec( python.command )
    invisible( NULL )
}

