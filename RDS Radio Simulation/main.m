function [ info_RDS,error ] = main( SNR )

% BER=[];
% for RSB=1:7
%     nombre_erreur=0;
% nb_bits_emis=0;
% while nombre_erreur<100

error=0;
try
bits_mac=mac_emetteur(); %Cr�ation de la chaine de bits � coder
% nb_bits_emis=nb_bits_emis+length(bits_mac);
[bits_est,error]=couche_physique(bits_mac,SNR); %Passage par la couche physique
 info_RDS=cell(1,20);
 info_RDS=mac_reception(bits_est); %R�ception et d�codage
catch %si une erreur est d�tect�e
    error=1;
    info_RDS={};
end

end

