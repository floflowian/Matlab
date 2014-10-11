%Décodeur des groupes 2A
%Entrées : Radiotext , bits à décoder
%Sorties : flag, address_code permettant de situer le paquet dans la trame, radiotext 

function [ flag,address_code,radiotext ] = decod_deuxA_beta( bits_mac,radiotext )

flag=bits_mac(28); 
address_code=bin2dec(num2str(bits_mac(29:32)));

radiotext(4*address_code+1)=caractere(bits_mac(33:40)); %Décodage des caractères
radiotext(4*address_code+2)=caractere(bits_mac(41:48));


if(caractere(bits_mac(49:56))~='0' && caractere(bits_mac(57:64))~='D') %%Indique la fin de la chaine de caractères
radiotext(4*address_code+3)=caractere(bits_mac(49:56));
radiotext(4*address_code+4)=caractere(bits_mac(57:64));
end


end

