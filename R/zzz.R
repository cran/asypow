

.First.lib <- function(lib, pkg) {
     library.dynam("asypow", pkg, lib) }

.noGenerics <- TRUE

.Last.lib <- function(libpath) {
    library.dynam.unload("asypow", libpath) }


