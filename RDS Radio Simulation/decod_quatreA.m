%Décodeur des groupes 4A
%Entrées : Bits à décoder
%Sorties : Année,Mois,Jour,Heure,Minute

function [ Y,M,D,hour,minute ] = decod_quatreA(bits_mac )
MJD_bin=bits_mac(31:47); %MJD,Heure,Minutres,décalage sous forme binaire
hour_bin=bits_mac(48:52); 
minute_bin=bits_mac(53:58);
time_offset_bin=bits_mac(59:64);

MJD=bin2dec(num2str(bits_mac(31:47))); %Conversion vers le système décimal
time_offset=bin2dec(num2str(bits_mac(59:64)));
hour=bin2dec(num2str(bits_mac(48:52)))+time_offset;
minute=bin2dec(num2str(bits_mac(53:58)));

Yprime=floor((MJD-15078.2)/365.25); %Calcul des valeurs réelles à partir des formules données dans la norme
Mprime=floor((MJD-14956.1-floor(Yprime*365.25))/30.6001);
D=MJD-14956-floor(Yprime*365.25)-floor(Mprime*30.6001);
if (Mprime==14 || Mprime==15)
    K=1;
else
    K=0;
end
Y=Yprime+K;
M=Mprime-1-K*12;


end

