cmake_minimum_required(VERSION 3.0)
project(integrate_parallel)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++2a")
set(CMAKE_CXX_FLAGS_DEBUG_INIT "-Wall")
set(CMAKE_CXX_FLAGS_RELEASE_INIT "-Wall")
set(CMAKE_CXX_FLAGS -pthread)

add_executable(integrate_parallel main.cpp integrals.h integrals.cpp)
