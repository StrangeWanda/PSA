% A three phase, 60 Hz, 500 kV transmission line is 300 km long. The line inductance is 0.97
% mH / km per phase and its capacitance is 0.0115 μF / km per phase. Assume a lossless line.
% a) Determine the line constant β, the surge impedance Zc, velocity of propagation, v
% and line wavelength λ.
% b) The receiving end rated load is 800 MW, 0.8 p.f. lagging at 500 kV. Determine the
% sending end quantities and the voltage regulation.
% c) Calculate the receiving end voltage when line is terminated in an open circuit and is
% energized with 500 kV at the sending end.
% d) Determine the reactance and the MVAR rating of a 3 phase shunt reactor to be
% installed at the receiving end to keep the no load receiving end voltage at the rated
% value.
clc
clear all
f=60
w=2*pi*f
Vr=500*10^3/sqrt(3)
length=300
l=0.97e-3
c=0.0115e-6

z=j*w*l
y=j*w*c
Zc = sqrt(z/y)
beta = sqrt(z*y)

A=cosh(beta*length)
D=A
B=Zc*sinh(beta*length)
C=sinh(beta*length)/Zc
Tr = [A B;C D]

Pr = 800e6
pfr = 0.8
Sr = Pr/pfr * exp(j*acos(pfr))
Ir = conj(Sr/(3*Vr))
temp = Tr*[Vr;Ir]
Vs=temp(1)
Is=temp(2)

Vol_reg = abs((abs(Vs/A)-Vr)/(Vr))*100

Vs/A

X = 1/(y*length)

rating = 3*Vr^2/X