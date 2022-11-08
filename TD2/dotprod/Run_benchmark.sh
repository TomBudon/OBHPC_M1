#!/bin/bash
 


versions=("BASE" "UNROLL4" "UNROLL8" "UNROLL16" "CBLAS")

compilers=("gcc" "clang-14" "icc" "icx")

make clean

rm data/*


for compiler in ${compilers[*]}; do

     make CC="$compiler" OFLAGS="-O1"

     taskset -c 2 ./dotprod 10000 20 > data/temp.dat

     for version in ${versions[*]}; do
          echo -n "$compiler; `cat data/temp.dat | grep $version | cut -d';' -f11`;" >> data/$version.dat
     done

     rm data/temp.dat

     make clean



     make CC="$compiler" OFLAGS="-O2"

     taskset -c 2 ./dotprod 10000 20 > data/temp.dat

     for version in ${versions[*]}; do
          echo -n "`cat data/temp.dat | grep $version | cut -d';' -f11`;" >> data/$version.dat
     done

     rm data/temp.dat

     make clean



     make CC="$compiler" OFLAGS="-O3"

     taskset -c 2 ./dotprod 10000 20 > data/temp.dat

     for version in ${versions[*]}; do
          echo "`cat data/temp.dat | grep $version | cut -d';' -f11`;" >> data/$version.dat
          echo "$version; `cat data/temp.dat | grep $version | cut -d';' -f11`;" >> data/$compiler.dat
     done

     rm data/temp.dat

     make clean

done
