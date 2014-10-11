%Codeur différentiel
%Améliore la correction des erreurs de transmission grace au codage
%différentiel
%Entrée : Bits 
%Sortie : Bits codés avec codage différentiel


function [ bits_cd ] = cod_diff ( bits_c )

n = size( bits_c, 2 );
bits_cd = zeros(1,n); %Initialisation de la suite de bits

bits_cd(1,1) = bits_c(1,1); %Initialisation du premier bit de bits_cd au premier bit de la suite de bits recue en entrée

for i=2:n
    bits_cd(1,i) = xor( bits_c(1,i), bits_cd(1,i-1) ); %Opération pour trouver chaque bit
end

end

