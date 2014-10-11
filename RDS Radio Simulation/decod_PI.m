%Décodeur d'identification du programme
%Entrée : Chaine de bits de PI
%Sortie : Code Pays, Couverture, Référence

function [ country_code,coverage,reference ] = decod_PI( PI )
if PI(1:4)==[0 0 0 1]  %Décodage du pays de couverture
    country_code='GR';
elseif PI(1:4)==[1 1 1 1]
    country_code='FR';    
elseif PI(1:4)==[0 0 1 0]
    country_code='CY';
elseif PI(1:4)==[0 0 1 1]
    country_code='SM';
elseif PI(1:4)==[0 1 0 0]
    country_code='CH';
    
elseif PI(1:4)==[0 1 0 1]
    country_code='JO';
elseif PI(1:4)==[0 1 1 0]
    country_code='FI';    
elseif PI(1:4)==[0 1 1 1]
    country_code='LU';
elseif PI(1:4)==[1 0 0 0]
    country_code='BG';
elseif PI(1:4)==[1 0 0 1]
    country_code='DK';
elseif PI(1:4)==[1 0 1 0]
    country_code='GI';
elseif PI(1:4)==[1 0 1 1]
    country_code='IQ';
elseif PI(1:4)==[1 1 0 0]
    country_code='GB';
elseif PI(1:4)==[1 1 0 1]
    country_code='LY';
elseif PI(1:4)==[1 1 1 0]
    country_code='RO';    
end

if PI(5:8)==[0 0 0 0]  %Décodage de l'étendue du broadcasting
    coverage='L';
elseif PI(5:8)==[0 0 0 1]
    coverage='I';
elseif PI(5:8)==[0 0 1 0]
    coverage='N';
elseif PI(5:8)==[0 0 1 1]
    coverage='S';
end  

if PI(9:16)==[0 0 0 0 0 0 0 0]
    reference='Not Assigned';
else
    reference='';
end    
 
end

