cmake_minimum_required(VERSION 3.5)
project(template-svce-cpp)

set(CMAKE_CXX_STANDARD 17)
#set(CMAKE_MACOSX_RPATH OFF)


SET(APPLICATION
        includes/eoepca/application.h
        application.cpp
        )

SET(MAIN_TEMPLATE
        main.cpp
        )


add_library(application STATIC ${APPLICATION})

add_executable(eoepca ${MAIN_TEMPLATE})
TARGET_LINK_LIBRARIES(eoepca application)
