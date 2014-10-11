%Translation_Boite
%Prend en entr�e une boite et les coordonn�es d'un vecteur translation et
%modifie les valeurs de la boite selon la translation.
%Entr�es : Boite entr�e, Coordonn�e en X du vecteur translation,Coordonn�e en Y du vecteur translation
%Sortie : Boite sortie

function [ boite_sortie ] = translation_boite( boite_entree,translation_x,translation_y )
boite_sortie=[boite_entree(1,1)+translation_y-1 boite_entree(1,2)+translation_x-1; boite_entree(2,1)+translation_y boite_entree(2,2)+translation_x];

end

