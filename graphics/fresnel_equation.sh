#! /usr/bin/gnuplot -p

#Gnuplot script Fresnel equation
set term postscript eps enhanced color lw 2 "Arial" 20
set title "Fresnel do ar para vidro"
#set name for file
set output "fresnel.eps"
#Define refractive index middle 1
ni = 1
#Define refractive index middle 2
nt =  3/2
#Define constatn
k = ni/nt
#Define conversion
TRAD = pi/180.0
#define cos, sin conversion
sind(x) = sin(x*TRAD)
cosd(x) = cos(x*TRAD)
#Define sqrt
sq(x) = sqrt( 1 - k**2 * sind(x)*sind(x) )
sqd(x) = sq(x*TRAD)
#R perpendicular
ri(x) = (ni*cosd(x) - nt*sqd(x)) / (ni*cosd(x) + nt * sqd(x))
#R paralelo
rii(x) = - (nt*cosd(x) - ni*sqd(x)) / (ni*sqd(x) + nt*cosd(x))
#Function
p(x) = (ri(x) - rii(x)) / (ri(x) + rii(x))

set ylabel "ress"
set xlabel "Angulo de incidencia"
set yrange [-1:2.5]
set autoscale x
#ploting graph
plot p(x), ri(x) with line, rii(x) w line
