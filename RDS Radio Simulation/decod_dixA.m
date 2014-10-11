%D�codeur des groupes 10A
%Entr�es : Program_type_name, bits � d�coder
%Sorties : flag, address_code permettant de situer le paquet dans la trame,
%program_type_name
function [ flag,address_code,program_type_name ] = decod_dixA_beta( bits_mac,program_type_name )

flag=bits_mac(28);
address_code=bin2dec(num2str(bits_mac(32)));
program_type_name(4*address_code+1)=caractere(bits_mac(33:40)); %D�codage des caract�res
program_type_name(4*address_code+2)=caractere(bits_mac(41:48));
program_type_name(4*address_code+3)=caractere(bits_mac(49:56));
program_type_name(4*address_code+4)=caractere(bits_mac(57:64));



end

