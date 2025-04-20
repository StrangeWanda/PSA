% A three phase 110 kV, 50 Hz transmission line is feeding power of 30 MVA to a remote
% unit 200 km away. The load is having a lagging power factor of 0.8. The conductors are
% equilaterally spaced at a distance of 4 metres. The diameter of the phase conductor is 2
% cm and the resistance of the phase conductor is 0.08 Ω / km. Find the ABCD parameters
% of the medium transmission line using nominal π model. Also find the sending end
% voltage, % voltage regulation and efficiency of the transmission line. Repeat the same for
% unity power factor and 0.8 leading power factor condition. Comment on the voltage
% regulation and efficiency in each case.

Vr =110*10^3 / sqrt(3)
f=50
w=2*pi*f
Sr_mag=30*10^6
length = 200*10^3
pfr = 0.8                    
Sr=Sr_mag*exp(j*acos(pfr))   %leading (- for lagging)
D=4
dia = 2*10^-2
rad = exp(-0.25)*dia/2
l = 2*10^-7*log(D/rad)
r=0.08/10^3
z=r+j*w*l
Z=z*length
c_lig=3*10^8
mu=4*pi*10^-7
eps = 1/(mu*c_lig^2)
c = 2*pi*eps/(log(D/(rad*exp(0.25))))
C=c*length
Y=(j*w*C)

Ir=Sr/(3*Vr)

A=(1+(Z*Y)/2)
D=A
B=Z
C=(1+(Z*Y)/4)*Y
Tr = [A B;C D]
temp = Tr*[Vr;Ir]
Vs=temp(1)
Is=temp(2)

Ss = 3*Vs*conj(Is)
eff = real(Sr)/real(Ss)*100
Vol_reg = (abs(Vs/A)-(Vr))/Vr*100