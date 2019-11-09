#! /usr/bin/gnuplot -p

#Gnuplot script Fresnel equation
set encoding utf8
set term postscript eps enhanced color lw 2 "Arial" 20
set title "T x {/Symbol g}_{/Times-Italic i}"
#set title "Vidro para Ar"
#set name for file
set output "TxY.eps"
#Define refractive index middle 1
ni = 1.0 # ar-vidro
#ni = 3.0/2.0 #vidro-ar 
#Define refractive index middle 2
nt = sqrt(3.0) # ar-vidro
#nt =  1.0 # vidro-ar
#Define constant a 

#Define constant
k = ni/nt
#Define angles
w = 1.05 # Brewster angle, 1.05rad = 60º
y = 0.86 # iqual 49º
z = 1.45 # iqaul 83º

#1st angle
#==================================================
#Define sqrt
sq(w) = sqrt( 1 - k**2 * sin(w)*sin(w) )
#t perpendicular
Ti(w) = ( 2*ni* cos(w) ) / ( ni*cos(w) + nt*sq(w) )
#t paralelo
Tii(w) = (2*ni* cos(w) ) / ( ni*sq(w) + nt*cos(w) )
#Function
Tw(x) = Tii(w)*cos(x)*cos(x) + Ti(w)*sin(x)*sin(x)

#2nd
#==================================================
#Define sqrt
sq(y) = sqrt( 1 - k**2 * sin(y)*sin(y) )
#t perpendicular
Ti(y) = ( 2*ni* cos(y) ) / ( ni*cos(y) + nt*sq(y) )
#t paralelo
Tii(y) = (2*ni* cos(y) ) / ( ni*sq(y) + nt*cos(y) )
#Function
Ty(x) = Tii(y)*cos(x)*cos(x) + Ti(y)*sin(x)*sin(x)

#3rd
#==================================================
#Define sqrt
sq(z) = sqrt( 1 - k**2 * sin(z)*sin(z) )
#t perpendicular
Ti(z) = ( 2*ni* cos(z) ) / ( ni*cos(z) + nt*sq(z) )
#t paralelo
Tii(z) = (2*ni* cos(z) ) / ( ni*sq(z) + nt*cos(z) )
#Function
Tz(x) = Tii(z)*cos(x)*cos(x) + Ti(z)*sin(x)*sin(x)

set xlabel "T"
set xlabel "{/Symbol g}_{/Times-Italic i} [rad]"
set yrange [0:1]
set xrange [0:3.14]

plot Tw(x) with line title "{/Symbol q}_{/=9 B} = {/=15 60º}", \
Ty(x) w line title "{/Symbol q}_{/Times-Italic i} = {/=15 49º}", \
Tz(x) w line title "{/Symbol q}_{/Times-Italic i} = {/=15 83º}"
 