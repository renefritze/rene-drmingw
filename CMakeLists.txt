PROJECT(drmingw)

#set minimum cmake version
cmake_minimum_required(VERSION 2.6)
SET(CMAKE_COLOR_MAKEFILE ON)

# Add Definitions, Compiler-Switches, etc.: -Wall -O2 -g3 ...
# MSVC compiler (cl.exe) does not accept the same switches as gcc, although preprocessor definitions in the -D form will work for both
IF(NOT MSVC)
	ADD_DEFINITIONS(-Wall -Wno-strict-aliasing -Wextra)
ENDIF(NOT MSVC)
IF(MSVC)
	ADD_DEFINITIONS(-D_RC_MSVC)
ENDIF(MSVC)

#----------------------------------------------------------------------------------------------------
# General Settings
#----------------------------------------------------------------------------------------------------
SET( CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS true )
SET(CMAKE_FIND_LIBRARY_SUFFIXES ".so" ".lib" ".a")

#----------------------------------------------------------------------------------------------------
# Load needed Modules
#----------------------------------------------------------------------------------------------------
INCLUDE(${drmingw_SOURCE_DIR}/cmake/sources.list)
# PKG-Config
FIND_PACKAGE( PkgConfig )

#----------------------------------------------------------------------------------------------------
# Build target defintions
#----------------------------------------------------------------------------------------------------

# Here we define the executable drmingw ( or on Windows drmingw.exe )

#auto-remove whitespaces before/after lib paths
cmake_policy(SET CMP0004 OLD)
#ignore warnings about macosx app bundle output dir
cmake_policy(SET CMP0006 OLD)

set( CMAKE_EXE_LINKER_FLAGS  "-L/opt/mingw32/lib" )
add_library(drmingw STATIC ${drmingwSrc} )
add_executable( drmingw-bin main.c ${drmingwSrc}  )

IF(MINGW)
	TARGET_LINK_LIBRARIES( drmingw bfd iberty intl )
	TARGET_LINK_LIBRARIES( drmingw-bin bfd iberty intl )
ENDIF(MINGW)

install(TARGETS drmingw-bin RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin )
install(TARGETS drmingw ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib )
install(FILES ${drmingw_header} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/drmingw )
install(DIRECTORY include DESTINATION ${CMAKE_INSTALL_PREFIX}/include/drmingw/ )