
%Offset words
A = [0 0 1 1 1 1 1 1 0 0];
B = [0 1 1 0 0 1 1 0 0 0];
C = [0 1 0 1 1 0 1 0 0 0];
D = [0 1 1 0 1 1 0 1 0 0];
NFFT=1024;
fe = 570000;
Te = 1/fe;
Db = 1187.5;
td = 1/Db;
Db = 1187.5; 
Td = 1/Db; 
fp = 57000; 
M = 2 ; 
n = log2(M); 
T = n*Td;
D = 1/T; 
N = T/Te; 
t = (-2*Td:Te:2*Td-Te);
f = (-fe/2:fe/NFFT:fe/2-fe/NFFT);
h = (2/Td*sinc(4/Td*(t-Td/8)))+(2/Td*sinc(4/Td*(t+Td/8)));