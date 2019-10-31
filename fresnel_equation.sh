#! /usr/bin/gnuplot -p

 #Gnuplot script Fresnel equation
 set term postscript eps enhanced color lw 2 "Arial" 20
 set title "Fresnel do ar para vidro"
#set name for file
 set output "fresnel.eps"
 #Define refractive index middle 1
 ni = 
 #Define refractive index middle 2
 nt =   
 #Define alpha a = u1*v1/u2*v2, if u1=u2, then a = nt/ni
 a = nt/ni
 #Define b = cos(t)/cos(i)
 b = cos(t) /cos(i)
#R perpendicular
ri = ( (1-ab)/(1 + ab) ) **2
#R paralelo
rii = ((b-a)/(a+b))**2
#Function
P(i) = (ri - rii) / (ri + rii)

 set ylabel ""

 set xlabel "Angulo de incidência"
 #ploting graph
 plot P(i)
  