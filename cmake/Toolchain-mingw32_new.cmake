# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)

# which compilers to use for C and C++
SET(CMAKE_C_COMPILER /opt/mingw32/bin/i586-pc-mingw32-gcc)
SET(CMAKE_CXX_COMPILER /opt/mingw32/bin/i586-pc-mingw32-g++)

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search 
# programs in the host environment
# SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
# SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET( CMAKE_VERBOSE_MAKEFILE ON )
link_directories( /opt/mingw32/lib )
INCLUDE_DIRECTORIES(/opt/mingw32/include  )

SET( PKG_CONFIG_EXECUTABLE /opt/mingw32/bin/pkg-config )


