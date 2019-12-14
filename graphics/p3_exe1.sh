#! /usr/bin/gnuplot -p
set encoding utf8
set term postscript eps enhanced color lw 2 "Arial" 20
set output "p3exe1.eps"

#Define constants
c = 3e8
u = (4e-7 )*pi
j = 1e-2/1.7

A = (c*u*(j)**2 )/ 23*pi**2
#function
f(x) = A *( (cos(2*pi*cos(x))-1 ) / sin(x) )**2
g(x) = (A/1.78 ) *( (cos(2*pi*cos(x))-1 ) / sin(x) )**2

set grid
set xlabel "Potência"
set xlabel "{/Symbol q} [rad]"
#set yrange [0:1]
set xrange [0:3.5]


plot f(x) with line lt rgb "#000000" title 'Solução Exata', \
g(x) with line lt rgb "red" title 'Solução Aproximada'
