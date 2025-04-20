% %A 3-phase 50 Hz transmission line has conductors of cross-section 90 mm2 and diameter
% of 1 cm. They are placed at the vertices of an equilateral triangle of side 1m. The line is
% 20 km long and delivers a load of 10 MW at 33 kV and p.f. 0.8. Neglect capacitance and
% assume temperature of 20°C. Resistance of the conductor is 3.83 ohms. Determine the
% efficiency and regulation of the line.
clc
clear all
format long
f=50
cross=90*((10^-3)^2)
dia = 1*10^-2
D=1
length=20*10^3
Pr = 10*10^6
Vr = 33*10^3/sqrt(3)
pfr = 0.8
R = 3.83
L = -2*10^-7*log(0.7788*(dia/2)/(D))*length
Ir = Pr/(3*Vr*pfr)*(pfr-1i*sin(acos(pfr)))
Z=R+1i*(2*pi*f*L)
A=1
B=Z
C=0
D=1
Tr = [A B;C D]
temp=((Tr*[Vr;Ir]))
Vs=temp(1)
Is=temp(2)
Ss = 3*Vs*conj(Is)
Effic = abs((Pr)/real(Ss)*100)
Vol_reg = (abs(Vs)-Vr)/(Vr)*100