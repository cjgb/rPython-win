\name{python.load}
\alias{python.load}
\title{ python.load }
\description{
  Executes Python code. 
}
\usage{
  python.load( file, get.exception = TRUE )
}
\arguments{
  \item{ file }{ a file containing python code to be executed }
  \item{ get.exception }{ logical value indicating whether to check or not for exceptions in Python }
}
\details{
    This function runs Python code contained in a file.
    Typically, this file would contain functions to be called via \code{\link{python.call}} or other functions in this package.

    The \code{get.exception} option allows the user to disregard Python exceptions in cases where safe calls to avoid the overhead of checking for them.
}
\value{
    None.
    If the code produces some output, it is up to the caller to go and fetch if from Python using function \code{\link{python.get}}.
}

\examples{

a <- 1:4
b <- 5:8

# this file contains the definition of function concat
python.load( system.file( "concat.py", package = "rPython" ) )
python.call( "concat", a, b)

}

\keyword{ manip }

