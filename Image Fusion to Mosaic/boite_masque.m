%Boite_Masque
%Prend une image en entr�e et retourne la boite qui contient ses
%coordonn�es relatives minimum et maximum et un masque de meme taille
%qu'elle remplit de 1.

%Entr�e: Image
%Sortie : Boite, Masque

function [ boite,masque ] = boite_masque( image )
[height width]=size(image);
boite=[1 1 ; height width];
masque=ones(height,width);

end

