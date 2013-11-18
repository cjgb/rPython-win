# rPython-win

This is rPython for Windows. If you are on Linux/Mac, you can [install it from CRAN](http://cran.r-project.org/web/packages/rPython/index.html).

## Installation

* Install [Rtools](http://cran.r-project.org/bin/windows/Rtools/)
* Install [devtools](http://cran.r-project.org/web/packages/devtools/index.html) by running 
```
install.packages("devtools")
library(devtools)
```
* Download the package as a zip file (see "Download Zip" button to the right of this page).
* Unzip the package and rename the directory as `rPython` (not `rPython-win`).
* If needed, edit the `configure.win` file inside the directory. By default, it contains the lines

```
echo 'PKG_LIBS=-LC:/python27/libs -lpython27'  > src/makevars.win
echo 'PKG_CFLAGS=-I"C:/Python27/include"'     >> src/makevars.win
``` 

and you should edit them to point to the path where you installed Python. In the default configuration it is assumed that the Python version is 2.7 and that it is installed in `C:/Python27`. Change it according to your Python installation.
* Install the package running `install("path/to/rPython")`. For instance, I run
```
install("C:/Users/carlos/Downloads/rPython")
```

## Issues

rPython on Windows is mostly experimental and has only been tested on one Windows box. Please, contact the maintainer (me) if you find any issues on your platform.
