

.First.lib <- function(lib, pkg) {
     library.dynam("asypow", pkg, lib) }

.noGenerics <- TRUE

.onUnload <- function(libpath)
    library.dynam.unload("asypow", libpath)


