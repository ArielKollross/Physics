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
# a = ni/nt
# a2 = nt/ni 
#Define sqrt
# sq(x)  = sqrt( 1 - (a**2)  * sin(x)*sin(x) )
# sq2(x) = sqrt( 1 - (a2**2) * sin(x)*sin(x) )
# #Define b
# b(x)  = sq(x) /cos(x)
# b2(x) = sq2(x)/cos(x)
# #R perpendicular
# Ri(x)  = (1-a*b(x))  / (1+a*b(x)) 
# Ri2(x) = (1-a2*b2(x))/ (1+a2*b2(x))
# #R parallel
# Rp(x)  = (b(x)-a)  /(b(x)+a) 
# Rp2(x) = (b2(x)-a2)/(b2(x)+a2)
# #Function
# p(x) = ( abs(Ri(x))  - abs(Rp(x)) ) / ( abs(Ri(x)) + abs(Rp(x))  )
# f(x) = ( abs(Ri2(x)) - abs(Rp2(x))) / ( abs(Ri2(x)) + abs(Rp2(x)))

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

set xlabel "Angulo de incidência"
set yrange [0:1.2]
set xrange [0:1.8]

plot P(x) w line title 'P({/Symbol q}_i) ar-vidro', \
F(x) w line title 'P({/Symbol q}_i) vidro-ar'
