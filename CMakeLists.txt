
cmake_minimum_required(VERSION 3.5)
project(template-svce-cpp)


set(CMAKE_POSITION_INDEPENDENT_CODE ON)


set(eoepca_c_flags ${CMAKE_C_FLAGS})
set(eoepca_cxx_flags ${CMAKE_CXX_FLAGS})
set(eoepca_cxx_tests )


set(TEMPLATE-SVCE-CPP_SOURCE_DIR
        ${CMAKE_CURRENT_SOURCE_DIR}
        )




include_directories(src/includes)
add_subdirectory(src)

add_subdirectory(test)




