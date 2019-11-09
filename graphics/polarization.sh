#! /usr/bin/gnuplot -p

#Gnuplot script Fresnel equation
set encoding utf8
set term postscript eps enhanced color lw 2 "Arial" 20
set title "Polarização"
#set title "Vidro para Ar"
#set name for file
set output "Grau de polarizacao.eps"
#Define refractive index middle 1
ni = 1.0 # ar-vidro
#ni = 3.0/2.0 #vidro-ar 
#Define refractive index middle 2
nt = 3.0/2.0 # ar-vidro
#nt =  1.0 # vidro-ar
#Define constant a 

#Define constant
k = ni/nt
q = nt/ni

#Frist middle
# ==================================================
#Define sqrt
sq(x) = sqrt( 1 - k**2 * sin(x)*sin(x) )
#R perpendicular
Ri(x) = ((ni*cos(x) - nt*sq(x)) / (ni*cos(x) + nt * sq(x)))**2
#R paralelo
Rii(x) = (- (nt*cos(x) - ni*sq(x)) / (ni*sq(x) + nt*cos(x)))**2
 
#Second middle
# ==================================================
#Define sqrt
rz(x) = sqrt( 1 - q**2 * sin(x)*sin(x) )
#R perpendicular
Fi(x) = ((ni*cos(x) - nt*rz(x)) / (ni*cos(x) + nt * rz(x)))**2
#R paralelo
Fii(x) = (- (nt*cos(x) - ni*rz(x)) / (ni*rz(x) + nt*cos(x)))**2

#function
P(x) = (Ri(x)-Rii(x))/(Ri(x)+Rii(x))
F(x) = -(Fi(x)-Fii(x))/(Fi(x)+Fii(x))

set xlabel "P({/Symbol q})"
set xlabel "Angulo de incidência [rad]"
set yrange [0:1.2]
set xrange [0:1.8]

plot P(x) w line lt rgb "black" title 'P({/Symbol q}_i) ar-vidro', \
F(x) w line lt rgb "red" title 'P({/Symbol q}_i) vidro-ar'
