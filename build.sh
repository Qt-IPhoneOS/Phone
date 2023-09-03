#!/bin/bash
rm -rf build
mkdir build
cd build
~/Qt/6.4.2/gcc_64/bin/qmake6 ../
make
./Phone

#thaivd
