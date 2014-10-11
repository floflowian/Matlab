function [ y_r ] = AWGN( y_t )

fe = 570000;
Db = 1187.5;
td = 1/Db;
t = [-td/2:1/fe:td/2];
h = 2/td * ( sinc( 4*t/td + 1/2 ) + sinc( 4*t/td - 1/2 ) );
M=2;
Eg=sum(conv(h,1).^2);
Es=Eg/2;
Eb=Es/log(M);
EbsurN0=50; %SNR
N0=Eb.*10^(-EbsurN0/10);

var=sqrt(N0/2);
noise=var*randn(1,length(y_t));

y_r=y_t+noise
figure(12),plot(y_r)
end

