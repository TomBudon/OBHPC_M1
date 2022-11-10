set term png size 2000,1250
set output "perf1.png"

set grid

set datafile separator ";"

set auto x

set key right top

set xlabel "Compiler"
set ylabel "MiB/s" 

set style data histogram
set style fill solid border -1
set boxwidth 0.5

# set yrange [0:150]

set xtic rotate by -45 scale 0 

set multiplot layout 3,3 rowsfirst title "Dotprod (size 10000)" 

set title "BASE"
plot "data/BASE.dat" u 2:xtic(1) t "-O1" lc "blue", "" u 3:xtic(1) t "-O2" lc "orange", "" u 4:xtic(1) t "-O3" lc "red"

set title "UNROLL4"
plot "data/UNROLL4.dat" u 2:xtic(1) t "-O1" lc "blue", "" u 3:xtic(1) t "-O2" lc "orange", "" u 4:xtic(1) t "-O3" lc "red"

set title "UNROLL8"
plot "data/UNROLL8.dat" u 2:xtic(1) t "-O1" lc "blue", "" u 3:xtic(1) t "-O2" lc "orange", "" u 4:xtic(1) t "-O3" lc "red"

set title "UNROLL16"
plot "data/UNROLL16.dat" u 2:xtic(1) t "-O1" lc "blue", "" u 3:xtic(1) t "-O2" lc "orange", "" u 4:xtic(1) t "-O3" lc "red"

set title "CBLAS"
plot "data/CBLAS.dat" u 2:xtic(1) t "-O1" lc "blue", "" u 3:xtic(1) t "-O2" lc "orange", "" u 4:xtic(1) t "-O3" lc "red"

unset multiplot


set term png size 2000,1250
set output "perf2.png"

set grid

set datafile separator ";"

set auto x

set key right top

set xlabel ""
set ylabel "MiB/s" 

set style data histogram
set style fill solid border -1
set boxwidth 0.5

# set yrange [0:150]

set xtic rotate by -45 scale 0 

set multiplot layout 2,2 rowsfirst title "Dotprod (size 10000)" 

set title "GCC (-O3)"
plot "data/gcc.dat" u 2:xtic(1) t "" lc "blue"

set title "Clang (-O3)"
plot "data/clang-14.dat" u 2:xtic(1) t "" lc "blue"

set title "ICC (-O3)"
plot "data/icc.dat" u 2:xtic(1) t "" lc "blue"

set title "ICX (-O3)"
plot "data/icx.dat" u 2:xtic(1) t "" lc "blue"

unset multiplot