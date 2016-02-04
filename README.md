# rPython-win

This is rPython for Windows. If you are on Linux/Mac, you can [install it from CRAN](http://cran.r-project.org/web/packages/rPython/index.html).

## Installation

* Install [Rtools](http://cran.r-project.org/bin/windows/Rtools/)
* Download the package as a zip file (see "Download Zip" button to the right of this page).
* (Previous versions of this package contained `configure.*` files; these are not longer necessary and have been removed.)
* As needed, edit the `src/makevars.win` file to identify the python path(s). The default assumes that 32-bit python is installed within `C:\Python27\i386`, and the 64-bit python is installed within `C:\Python27\x64`, with relatively identical sub-directory hierarchies.

* Add the following to your `$HOME/.Rprofile` file:

    ```r
    options(rPython.paths = list(i386 = "/Python27/i386", x64 = "/Python27/x64"))  
    ```

    This option is required to properly distinguish between 32-bit and 64-bit pythons (both for compilation and every time you load rPython). These instructions have not been tested on a system with only one version of python available ...

* The package must be compiled on the command-line (`devtools` will not currently work). `R CMD INSTALL /path/to/rPython` (or `R CMD INSTALL .` if in the current directory). You may use `R CMD INSTALL --build .` if you want to create a binary package for storage or distribution.

## Issues

rPython on Windows is mostly experimental and has only been tested on one Windows box. Please, contact the maintainer (me) if you find any issues on your platform.
