#########################################################
# CGB, 20120801
#########################################################

python.load <- function( file, get.exception = TRUE ){
    code <- readLines( file )
    python.exec( code, get.exception )
}



