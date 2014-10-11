%Couche Physique
%Ensemble des fonctions qui réalisent la couche physique
%Entrées : Bits émis par l'émetteur MAC, SNR du canal AWGN
%Sorties : Bits estimés à destination du récepteur MAC, Erreurs


function [ bits_est,error ] = couche_physique (bits,SNR )

glob_var; %Chargement des variables utilisées dans tout le programme

bits_c = cod_cyclique( bits ); %Codeur cyclique

bits_cd = cod_diff ( bits_c ); % Codeur différentiel

nombre=length(bits_cd)/104;
erreur=0;

sortie=[];
for i=1:nombre
    bits_sortie=biphase_gen(bits_cd((i-1)*104+1:i*104),SNR); %Génération et décodage du signal par paquet de  104 paquets
    sortie=[sortie bits_sortie]; %Concaténation pour obtenir la suite complète
end

bits_cdr=sortie;

bits_cr = decod_diff( bits_cdr ); %Décodeur différentiel

[bits_est,error] = decod_cycl( bits_cr ); %Décodeur cyclique




end

