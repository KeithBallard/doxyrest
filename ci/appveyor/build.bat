::..............................................................................
::
::  This file is part of the Doxyrest toolkit.
::
::  Doxyrest is distributed under the MIT license.
::  For details see accompanying license.txt file,
::  the public copy of which is also available at:
::  http://tibbo.com/downloads/archive/doxyrest/license.txt
::
::..............................................................................

set THIS_DIR=%CD%
set THIS_DIR_CMAKE=%THIS_DIR:\=/%

mkdir %DOWNLOAD_DIR%\expat\build
cd %DOWNLOAD_DIR%\expat\build
cmake .. %CMAKE_CONFIGURE_FLAGS% %EXPAT_CMAKE_FLAGS%
cmake --build . %CMAKE_BUILD_FLAGS%

cd %THIS_DIR%
echo set (EXPAT_INC_DIR %DOWNLOAD_DIR_CMAKE%/expat/lib) >> paths.cmake
echo set (EXPAT_LIB_DIR %DOWNLOAD_DIR_CMAKE%/expat/build/%CONFIGURATION%) >> paths.cmake

mkdir axl\build
cd axl\build
cmake .. %CMAKE_CONFIGURE_FLAGS%
cmake --build . %CMAKE_BUILD_FLAGS%

cd %THIS_DIR%
echo set (AXL_CMAKE_DIR %THIS_DIR_CMAKE%/axl/cmake %THIS_DIR_CMAKE%/axl/build/cmake) >> paths.cmake

mkdir build
cd build
cmake .. %CMAKE_CONFIGURE_FLAGS%
cmake --build . %CMAKE_BUILD_FLAGS%
goto :eof
