%Codeur cyclique
%Ajoute à une chaine de bits un code sur 10 bits qui permettra par la suite
%de détecter et corriger les éventuelles erreurs
%Entrée : Chaine de bits
%Sortie : Chaine de bits + code correcteur


function [ bits_c ] = cod_cyclique( bits )

glob_var;

nb_group =length(bits)/16;
number = 0;

% Matrice génératrice
G1 = [ eye( 16 ) ];   
G2 = [0 0 0 1 1 1 0 1 1 1 ;1 0 1 1 1 0 0 1 1 1 ;1 1 1 0 1 0 1 1 1 1 ;1 1 0 0 0 0 1 0 1 1 ;1 1 0 1 0 1 1 0 0 1 ;1 1 0 1 1 1 0 0 0 0 ;0 1 1 0 1 1 1 0 0 0 ;0 0 1 1 0 1 1 1 0 0 ;0 0 0 1 1 0 1 1 1 0 ;0 0 0 0 1 1 0 1 1 1 ;1 0 1 1 0 0 0 1 1 1 ;1 1 1 0 1 1 1 1 1 1 ;1 1 0 0 0 0 0 0 1 1 ;1 1 0 1 0 1 1 1 0 1 ;1 1 0 1 1 1 0 0 1 0 ;0 1 1 0 1 1 1 0 0 1 ];
G = [G1 G2];

for i=1:nb_group 
    
    num_offset = mod(number,4);
    if num_offset==0 %Attribution du mot d'offset correspondant au rang du paquet 
        offset = A; 
    elseif num_offset==1
        offset = B;
    elseif num_offset==2
        offset = C;
    elseif num_offset==3
        offset = D;
    end
    group = bits( 1+(i-1)*16:16*i ); %Découpage en groupes de 16 bits
    res = group * G; 
    res = mod( res, 2 );
    bits_c(1+(i-1)*26:26*i) = [ group xor( res(17:26), offset ) ]; 
    number=number+1;
    
end

end

