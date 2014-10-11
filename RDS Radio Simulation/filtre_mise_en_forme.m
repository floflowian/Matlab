
fe=570*10^3;
Db=1187.5;
td=1/Db
f=[-2/td:1:2/td]
t=[-td/2:1/fe:td/2]
H=cos(pi*f*td/4);
h=2/td*(sinc(1/2+4*t/td)+sinc(-1/2+4*t/td));
%h2=2/td*(sin(pi/2+4*pi*t/td)+sinc(-pi/2+4*pi*t/td));
figure(1), plot(f,H)
figure(2),plot(t,h)