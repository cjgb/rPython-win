\name{python.call}
\alias{python.call}
\alias{python.method.call}
\title{ python.call }
\description{
  Calls Python functions and methods from R 
}
\usage{
  python.call( py.foo, ..., simplify = TRUE, as.is = FALSE )
  python.method.call( py.object, py.method, ... )
}
\arguments{
  \item{py.foo}{ rame of a Python function }
  \item{py.object}{ name of a Python object }
  \item{py.method}{ name of a method of such object }
  \item{...}{ R objects to pass as arguments to the Python function or method }
  \item{simplify}{logical value indicating whether simplification of output should be simplified}
  \item{as.is}{logical value indicating whether length 1 vectors in R should be passed as atomic variables in Python as opposed to length 1 vectors. Note that, e.g., strings such as "hello" in R are vectors of length 1 in R, i.e., \code{"hello"} is the same as \code{c("hello")}. But Python functions operating on arrays will want to receive the array \code{["hello"]} rather than the literal string \code{"hello"}. 
  
  This argument provides little granularity: it affects either all or none of the arguments of the function. Finer control can be obtained using the \code{I()} function as shown in the examples section below.}
}
\details{
    This function runs a Python function taking as arguments R objects and returning an R object.
    Some limitations exist as to the nature of the objects that can be passed between R and Python.
    As of this writing, atomic arguments and vectors are supported. 

    The user has to be careful to indicate named parameters as required according to Python conventions.
}
\value{
    An R representation of the object returned by the call to the Python function. 
}
\examples{
python.call( "len", 1:3 )
a <- 1:4
b <- 5:8
python.exec( "def concat(a,b): return a+b" )
python.call( "concat", a, b)

python.assign( "a",  "hola hola" )
python.method.call( "a", "split", " " )

## simplification of arguments
a <- 1
b <- 5:8

\dontrun{
python.call("concat", a, b)}

# using function I()
python.call("concat", I(a), b)

# setting as.is = TRUE
python.call("concat", a, b, as.is = TRUE)

}
\keyword{ manip }

