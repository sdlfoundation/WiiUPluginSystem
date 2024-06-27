cmake_minimum_required(VERSION 3.29.6)

project(wups VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/libraries/libwups")
set(INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/include")

file(GLOB_RECURSE SOURCES ${SOURCE_DIR}/*.cpp)

add_library(wups STATIC ${SOURCES})

set_target_properties(wups PROPERTIES
    VERSION ${PROJECT_VERSION}
    OUTPUT_NAME "wups"
)

target_include_directories(wups PUBLIC ${INCLUDE_DIR})
