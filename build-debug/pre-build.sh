#!/usr/bin/env bash

cmake3 -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug  -DCMAKE_C_FLAGS_DEBUG="-g3 -gdwarf-2" -DCMAKE_CXX_FLAGS_DEBUG="-g3 -gdwarf-2" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..



