%Décodeur des groupes 0A
%Entrées : Bits à décoder, Fréquences alternatives, program_service name
%Sorties :  TA,MS,DI,AF,program_service_name

function [ TA,MS,DI,AF,program_service_name ] = decod_zeroA_beta( bits_mac,AF,program_service_name )

TA=bits_mac(28);
MS=bits_mac(29);
DI=bin2dec(num2str(bits_mac(31:32)));

if DI==0 %Selon la position du paquet lu, on place les caractères reçus
    program_service_name(1)=caractere(bits_mac(49:56)); 
    program_service_name(2)=caractere(bits_mac(57:64));    
    AF(1)=bin2dec(num2str(bits_mac(33:40)))-224; %Le nombre de fréquences est codé entre 225 (1 AF) et 249 (25 AFs)
    AF(2)=87.6+0.1*(bin2dec(num2str(bits_mac(41:48)))); % Les AFs sont codées entre 1 (87.6 MHz) and 204 (107.9 MHz)
elseif DI==1
    program_service_name(3)=caractere(bits_mac(49:56));
    program_service_name(4)=caractere(bits_mac(57:64)); 
    AF(3)=87.6+0.1*(bin2dec(num2str(bits_mac(33:40))));
    AF(4)=87.6+0.1*(bin2dec(num2str(bits_mac(41:48))));
elseif DI==2
    
    program_service_name(5)=caractere(bits_mac(49:56));
    program_service_name(6)=caractere(bits_mac(57:64)); 
    AF(5)=87.6+0.1*(bin2dec(num2str(bits_mac(33:40))));
    AF(6)=87.6+0.1*(bin2dec(num2str(bits_mac(41:48))));
elseif DI==3
    program_service_name(7)=caractere(bits_mac(49:56));
    program_service_name(8)=caractere(bits_mac(57:64)); 
    AF(7)=87.6+0.1*(bin2dec(num2str(bits_mac(33:40))));
    AF(8)=87.6+0.1*(bin2dec(num2str(bits_mac(41:48))));
end    



end

