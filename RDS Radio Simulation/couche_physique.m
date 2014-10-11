%Couche Physique
%Ensemble des fonctions qui r�alisent la couche physique
%Entr�es : Bits �mis par l'�metteur MAC, SNR du canal AWGN
%Sorties : Bits estim�s � destination du r�cepteur MAC, Erreurs


function [ bits_est,error ] = couche_physique (bits,SNR )

glob_var; %Chargement des variables utilis�es dans tout le programme

bits_c = cod_cyclique( bits ); %Codeur cyclique

bits_cd = cod_diff ( bits_c ); % Codeur diff�rentiel

nombre=length(bits_cd)/104;
erreur=0;

sortie=[];
for i=1:nombre
    bits_sortie=biphase_gen(bits_cd((i-1)*104+1:i*104),SNR); %G�n�ration et d�codage du signal par paquet de  104 paquets
    sortie=[sortie bits_sortie]; %Concat�nation pour obtenir la suite compl�te
end

bits_cdr=sortie;

bits_cr = decod_diff( bits_cdr ); %D�codeur diff�rentiel

[bits_est,error] = decod_cycl( bits_cr ); %D�codeur cyclique




end

