#!/bin/bash
 


versions=("BASE" "UNROLL4" "UNROLL8" "UNROLL16" "CBLAS")

compilers=("gcc" "clang-14" "icc" "icx")

make clean

rm data/*


for compiler in ${compilers[*]}; do

     make CC="$compiler" OFLAGS="-O1"

     taskset -c 2 ./dotprod 100 50 > data/$compiler-O1.dat

     for version in ${versions[*]}; do
          echo -n "$compiler; `cat data/$compiler-O1.dat | grep $version | cut -d';' -f12`;" >> data/$version.dat
     done

     # rm data/$compiler-O2.dat

     make clean



     make CC="$compiler" OFLAGS="-O2"

     taskset -c 2 ./dotprod 100 50 > data/$compiler-O2.dat

     for version in ${versions[*]}; do
          echo -n "`cat data/$compiler-O2.dat | grep $version | cut -d';' -f12`;" >> data/$version.dat
     done

     # rm data/$compiler-O2.dat

     make clean



     make CC="$compiler" OFLAGS="-O3"

     taskset -c 2 ./dotprod 100 50 > data/$compiler-O3.dat

     for version in ${versions[*]}; do
          echo "`cat data/$compiler-O3.dat | grep $version | cut -d';' -f12`;" >> data/$version.dat
          echo "$version; `cat data/$compiler-O3.dat | grep $version | cut -d';' -f12`;" >> data/$compiler.dat
     done

     # rm data/$compiler-O3.dat

     make clean

done
