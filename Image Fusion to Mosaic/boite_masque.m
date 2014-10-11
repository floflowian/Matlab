%Boite_Masque
%Prend une image en entrée et retourne la boite qui contient ses
%coordonnées relatives minimum et maximum et un masque de meme taille
%qu'elle remplit de 1.

%Entrée: Image
%Sortie : Boite, Masque

function [ boite,masque ] = boite_masque( image )
[height width]=size(image);
boite=[1 1 ; height width];
masque=ones(height,width);

end

