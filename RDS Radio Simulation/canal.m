%Canal AWGN
%Bruite un signal re�u en entr�e selon une loi gaussienne
%Entr�es : Signal modul� �mis, RSB du canal
%Sortie : Signal bruit� � destination du d�codeur biphase


function [ y_r ] = canal( y_t,RSB )

fe = 570000;
Db = 1187.5;
td = 1/Db;
t = [ -td/2:1/fe:td/2 ];
h = 2/td * ( sinc( 4*t/td + 1/2 ) + sinc( 4*t/td - 1/2 ) );
M = 2;
Eg = sum(conv(h,1).^2);
Es = Eg / 2;
Eb = Es / log(M);
%RSB = 50; %EbsurN0
N0 = Eb.*10^(-RSB/10);

var = sqrt( N0 / 2 );
noise = var * randn( 1, length( y_t ) );

y_r = y_t + noise;
%figure(12),plot(y_r)

y_r;
longueur_y_r=length(y_r);

end

