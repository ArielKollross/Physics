#! /usr/bin/gnuplot -p

#Gnuplot script Fresnel equation
set encoding utf8
set term postscript eps enhanced color lw 2 "Arial" 20
set title "Ar para Vidro"
#set title "Vidro para Ar"
#set name for file
set output "fresnel.eps"
#Define refractive index middle 1
ni = 1.0 # ar-vidro
#ni = 3.0/2.0 #vidro-ar

#Define refractive index middle 2
nt = 3.0/2.0 # ar-vidro
#nt =  1.0 # vidro-ar

#Define constant
k = ni/nt
#Define sqrt
sq(x) = sqrt( 1 - k**2 * sin(x)*sin(x) )
#R perpendicular
ri(x) = (ni*cos(x) - nt*sq(x)) / (ni*cos(x) + nt * sq(x))
#R paralelo
rii(x) = - (nt*cos(x) - ni*sq(x)) / (ni*sq(x) + nt*cos(x))
#t perpendicular
ti(x) = ( 2*ni* cos(x) ) / ( ni*cos(x) + nt*sq(x) )
#t paralelo
tii(x) = (2*ni* cos(x) ) / ( ni*sq(x) + nt*cos(x) )

#Function
p(x) = ( ri(x)*ri(x) - rii(x)*rii(x) ) / ( ri(x)*ri(x) + rii(x)*rii(x))

set xlabel "Angulo de incidência"
set yrange [-1.1:2.5]
set xrange [0:1]

#For condition ni = 1
set arrow from 1.571, graph 0 to 1.571, graph 1 nohead
#For condition ni = 1.5
#set arrow from 0.729, graph 0 to 0.729, graph 1 nohead 

#ploting graph
plot ri(x) with line title 'r {/=10{/Symbol \136}}', \
rii(x) w line title 'r {/=10{/Symbol \174\174}}', \
ti(x) w line title 't {/=10{/Symbol \136}}', \
tii(x) w line title 't {/=10{/Symbol \174\174}}'

