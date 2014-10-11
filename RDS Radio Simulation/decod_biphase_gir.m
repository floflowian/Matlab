%%decod_biphase.m
%
%Retour en bande de base et effectue une demodulation B-PSK
%
%Entrées :
%   y_r : Signal transposé en sortie de canal  
%   filtre : Filtre de mise en forme
%Sorties :
%   bits_cdr : Bits B-PSK décodés



function [bits_cdr,x_r] = decod_biphase(filtre, y_r)


%Initialisation

N=104; %nombre de bits par trame
M=2; %BPSK

td = 1/1187.5; %période entre chaque bit de la trame

fc=57*10^3; %fréquence porteuse donnée p9 1.7 de la norme RDS
fe=570*10^3; %fréquence d'échantillonage du signal (suffisamment grand
% pour s'approcher d'un signal continu).
Te= 1/fe; %période d'échantillonage

tfiltre = (0:length(y_r)-1)*Te;
phi=0; %pour un déphasage éventuel



%Retour en bande de base
x_r = 2*y_r.*cos(2*pi*fc*tfiltre);

%Filtrage du signal
used_filter = filtre;   % Filtre adapté
x_r =  conv2(x_r, used_filter, 'same');


% Diagramme de l'oeil du signal RDS reçu
% eyediagram(x_r(2*td/Te:end), td/Te, td/Te)
% title('eyediagram x_r')


bits_psk = zeros(1, N);

%Récupération des symboles
for i=0:N-1
    bits_psk(1,i+1) = real(x_r(1,floor(i*td/Te) + 1));
%      test(i+1) = x_r(1,floor(i*td/Te) + 1);
end

%  scatterplot(test);

bits_cdr = pskdemod(bits_psk, M, 0, 'gray'); % conversion symboles->bits

end







