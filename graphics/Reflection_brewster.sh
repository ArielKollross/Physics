#! /usr/bin/gnuplot -p

#Gnuplot script Fresnel equation
set encoding utf8
set term postscript eps enhanced color lw 2 "Arial" 20
set title "R x {/Symbol g}_{/Times-Italic i}"
#set title "Vidro para Ar"
#set name for file
set output "RxY.eps"
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

#Frist angle
# ==================================================
#Define sqrt
sq(w) = sqrt( 1 - k**2 * sin(w)*sin(w) )
#R perpendicular
Ri(w) = ((ni*cos(w) - nt*sq(w)) / (ni*cos(w) + nt * sq(w)))**2
#R paralelo
Rii(w) = (- (nt*cos(w) - ni*sq(w)) / (ni*sq(w) + nt*cos(w)))**2
#Funciton
Rw(x) = Rii(w)*cos(x)*cos(x) + Ri(w)*sin(x)*sin(x)

#Second angle
# ==================================================
#Define sqrt
sq(y) = sqrt( 1 - k**2 * sin(y)*sin(y) )
#R perpendicular
Ri(y) = ((ni*cos(y) - nt*sq(y)) / (ni*cos(y) + nt * sq(y)))**2
#R paralelo
Rii(y) = (- (nt*cos(y) - ni*sq(y)) / (ni*sq(y) + nt*cos(y)))**2
#Funciton
Ry(x) = Rii(y)*cos(x)*cos(x) + Ri(y)*sin(x)*sin(x)

#3th angle
# ===================================================
#Define sqrt
sq(z) = sqrt( 1 - k**2 * sin(z)*sin(z) )
#R perpendicular
Ri(z) = ((ni*cos(z) - nt*sq(z)) / (ni*cos(z) + nt * sq(z)))**2
#R paralelo
Rii(z) = (- (nt*cos(z) - ni*sq(z)) / (ni*sq(z) + nt*cos(z)))**2
#Funciton
Rz(x) = Rii(z)*cos(x)*cos(x) + Ri(z)*sin(x)*sin(x)


set xlabel "R "
set xlabel "{/Symbol g}_{/Times-Italic i} [rad]"
set yrange [0:1]
set xrange [0:3.14]

plot Rw(x) with line title "{/Symbol q}_{/=9 B} = {/=15 60º}", \
Ry(x) w line title "{/Symbol q}_{/Times-Italic i} = {/=15 49º}", \
Rz(x) w line title "{/Symbol q}_{/Times-Italic i} = {/=15 83º}"
 