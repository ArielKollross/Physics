#! /usr/bin/gnuplot -p

 #Gnuplot script for Maxwell-Boltzman distribution
 #There is 1 mln particles of oxygen in three temperatures (T1,T2,T3)
 #output set to EPS file with color, line weight: 2 font: Arial, font size: 20
 set term postscript eps enhanced color lw 2 "Arial" 20
 set title "Distribuição de Maxwell-Boltzmann"
#set name for file
 set output "Maxwell-Boltzmann_distribution_1.eps"
 #Boltzmann constatn [J/K]
 k=1.380658E-23 
 #Avogadro number [1/mol]
 Na=6.02214199E+23 
 #Mole mass of oxygen (kg/mol)
 M=0.032
 #conversion factor
 C=273.15
 #temperature [K]
 T1=-100+273.15
 T2=20+273.15
 T3=600+273.15
 #mass of particle
 m=M/Na
 #number of particles
 N=1000000
 #range 0 to 1500 m/s
 set xrange [0:1500]
 #number of particles 
 set ylabel "n (numero de partículas)"
 #speed of particles
 set xlabel "velocidade [m/s]"
 #ploting graph (x^2 -> x**2)
 plot 4*pi*(m/(2*pi*k*T1))**(1.5)*x**2*exp(-(m*x**2)/(2*k*T1))*N title "T1=-100ºC", 4*pi*(m/(2*pi*k*T2))**(1.5)*x**2*exp(-(m*x**2)/(2*k*T2))*N title "T2=20ºC",4*pi*(m/(2*pi*k*T3))**(1.5)*x**2*exp(-(m*x**2)/(2*k*T3))*N title "T3=600ºC"