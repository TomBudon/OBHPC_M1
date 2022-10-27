set term png size 1900,1000 enhanced font "Terminal,10" background rgbcolor "#1c2841"

# Yankees blue "#1c2841"

# Midnight green "#004953"

# Blueprint blue background "#191970"

set grid

set datafile separator ";"

set auto x

set key right top

set xlabel "Memory level" textcolor "white"
set ylabel "GiB/s" textcolor "white"

set style data histogram
set style fill solid border -1
set boxwidth 0.5

set border linecolor "white"

set key textcolor "white"

set yrange [0:100]

set xtic rotate by -45 scale 0 

set multiplot layout 6,2 rowsfirst title "Dotprod: d += a[i] * b[i]" textcolor "white"

set title "V2" textcolor "white"
plot "v2.dat" u  9:xtic(1) t "SSE movupd" lc "white"

set title "V3"
plot "v3.dat" u  9:xtic(1) t "SSE movapd" lc "white"

set title "V4"
plot "v4.dat" u  9:xtic(1) t "AVX vmovupd" lc "white"

set title "V5"
plot "v5.dat" u  9:xtic(1) t "AVX vmovapd" lc "white"

set title "V6"
plot "v6.dat" u  9:xtic(1) t "AVX intrin" lc "white"

set title "V7"
plot "v7.dat" u  9:xtic(1) t "AVX intrin u4" lc "white"

set title "V8"
plot "v8.dat" u  9:xtic(1) t "AVX vmovapd u8" lc "white"

set title "V9"
plot "v9.dat" u  9:xtic(1) t "AVX vmovupd u8" lc "white"

set title "V10"
plot "v10.dat" u  9:xtic(1) t "AVX vmovupd/haddpd" lc "white"

set title "V11"
plot "v11.dat" u  9:xtic(1) t "AVX vmovupd/addpd" lc "white"

set title "V1" 
plot "v1.dat" u  9:xtic(1) t "V1 C" lc "white"

# set origin 0,0
# set size 1.0, 0.25
# set title "All runs"
# plot "v1.dat" u  9:xtic(1) t "V1 C",			\
#      "v2.dat" u  9:xtic(1) t "SSE movupd)", 		\
#      "v3.dat" u  9:xtic(1) t "SSE movapd", 		\
#      "v4.dat" u  9:xtic(1) t "AVX vmovupd", 		\
#      "v5.dat" u  9:xtic(1) t "AVX vmovapd", 		\
#      "v6.dat" u  9:xtic(1) t "AVX intrin", 		\
#      "v7.dat" u  9:xtic(1) t "AVX intrin u4", 		\
#      "v8.dat" u  9:xtic(1) t "AVX movupd u8", 		\
#      "v9.dat" u  9:xtic(1) t "AVX movapd u8", 		\
#      "v10.dat" u  9:xtic(1) t "AVX movapd/hadd"
     
unset multiplot