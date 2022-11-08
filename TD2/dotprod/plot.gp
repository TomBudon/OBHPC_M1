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

set yrange [0:100]

set xtic rotate by -45 scale 0 

set multiplot layout 3,3 rowsfirst title "Dotprod (size 100)" 

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
