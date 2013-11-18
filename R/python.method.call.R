#########################################################
# CGB, 20100718
#########################################################

python.method.call <- function( py.object, py.method, ... ){
    python.call( paste( py.object, py.method, sep = "." ) )
}

