# Copyright (C) 2022 The Qt Company Ltd.
# SPDX-License-Identifier: BSD-3-Clause

# Attempts to find xkbcommon-11 and sets the following variables:
# XKB_COMMON_X11_FOUND - True if the library was found
# XKB_COMMON_X11_LIBRARIES - Libraries to link
# XKB_COMMON_X11_LIBRARY_DIRS - Location of libraries
# XKB_COMMON_X11_INCLUDE_DIRS - Include directories
#
# Additionally, if found, the target XKB::XKB_COMMON_X11 is created.
# with the corresponding properties set from the above variables.

# Use pkg-config to get the directories and then use these values
# in the FIND_PATH() and FIND_LIBRARY() calls. This can still
# work if pkg-config is disabled.
find_package(PkgConfig QUIET)
pkg_check_modules(XKB_COMMON_X11 QUIET "xkbcommon-x11>=0.4.1")

find_path(XKB_COMMON_X11_INCLUDE_DIR
    NAMES xkbcommon/xkbcommon-x11.h
    HINTS ${PC_XKB_COMMON_X11_INCLUDE_DIR} ${PC_XKB_COMMON_X11_INCLUDE_DIRS}
)

find_library(XKB_COMMON_X11_LIBRARY
    NAMES xkbcommon-x11
    HINTS ${PC_XKB_COMMON_X11_LIBRARY} ${PC_XKB_COMMON_X11_LIBRARY_DIRS}
)

set(XKB_COMMON_X11_LIBRARIES ${XKB_COMMON_X11_LIBRARY})
set(XKB_COMMON_X11_LIBRARY_DIRS ${XKB_COMMON_X11_LIBRARY_DIRS})
set(XKB_COMMON_X11_INCLUDE_DIRS ${XKB_COMMON_X11_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(XKB_COMMON_X11 DEFAULT_MSG
    XKB_COMMON_X11_LIBRARY
    XKB_COMMON_X11_INCLUDE_DIR
)

if(XKB_COMMON_X11_FOUND AND NOT TARGET XKB::XKB_COMMON_X11)
    add_library(XKB::XKB_COMMON_X11 UNKNOWN IMPORTED)
    set_target_properties(XKB::XKB_COMMON_X11 PROPERTIES
        IMPORTED_LOCATION "${XKB_COMMON_X11_LIBRARY}"
        INTERFACE_COMPILE_OPTIONS "${XKB_COMMON_X11_DEFINITIONS}"
        INTERFACE_INCLUDE_DIRECTORIES "${XKB_COMMON_X11_INCLUDE_DIR}"
    )
endif()
