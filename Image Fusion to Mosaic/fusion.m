%Fusion
%Cette fonction retourne l'image résultant de la fusion des deux images
%passées en entrée
%Entrées : Image 1, Image 2, Boite 1, Boite 2, Masque 1, Masque 2
%Sorties: Image, Masque, Boite de sortie



function [ image_sortie,masque_sortie,boite_sortie ] = fusion( im1,im2,masque1,masque2,boite1,boite2 )

% 
% [boite1,masque1]=boite_masque(im1);
% [boite2,masque2]=boite_masque(im2);

[translation_y,translation_x]=translation(im1,im2); %Determination du vecteur translation qui lie les images

    
[height1 width1]=size(im1);%Détermination des tailles des images
[height2 width2]=size(im2);

boite2=translation_boite(boite2,translation_x,translation_y); %Translation de la boite de l'image 2 à partir de l'image 1
coord_min_1=boite1(1,:); %Coordonnées Min et Max de chaque image
coord_max_1=boite1(2,:);
coord_min_2=boite2(1,:);
coord_max_2=boite2(2,:);
boite_sortie=[coord_max_1;coord_max_2]; %Création de la boite englobante de sortie

if translation_y>0 %Définition de la taille totale de l'image de sortie en fonction des valeurs du vecteur translation
taille_totale_y=abs(coord_max_2(1)-coord_min_1(1)+1);
else
    taille_totale_y=abs(coord_max_1(1)-coord_min_2(1)+1);
end
if translation_x>0
taille_totale_x=abs(coord_max_2(2)-coord_min_1(2)+1);
else
    taille_totale_x=abs(coord_max_1(2)-coord_min_2(2)+1);
end

masque_sortie=zeros(taille_totale_y,taille_totale_x);%Création du masque de sortie
if translation_y>0 %Remplissage du masque de sortie avec les valeurs du masque de l'image 1 en fonction des coordonnées de la translation
    if translation_x>0
        masque_sortie(1:height1,1:width1)=masque1(1:height1,1:width1);
    else
        masque_sortie(1:height1,abs(translation_x):abs(translation_x)+width1-1)=masque1(1:height1,1:width1);
    end
else
    if translation_x>0
        masque_sortie(abs(translation_y):abs(translation_y)+height1-1,1:width1)=masque1(1:height1,1:width1);
    else
        masque_sortie(abs(translation_y):abs(translation_y)+height1-1,abs(translation_x):abs(translation_x)+width1-1)=masque1(1:height1,1:width1);
    end
end

if translation_y>0%Remplissage du masque de sortie avec les valeurs du masque de l'image 2 en fonction des coordonnées de la translation
    if translation_x>0
        masque_sortie(translation_y:translation_y+height2-1,translation_x:translation_x+width2-1)=masque_sortie(translation_y:translation_y+height2-1,translation_x:translation_x+width2-1)+masque2(1:height2,1:width2);
    else
        masque_sortie(translation_y:translation_y+height2-1,1:width2)=masque_sortie(translation_y:translation_y+height2-1,1:width2)+masque2(1:height2,1:width2);
    end
else
    if translation_x>0
        masque_sortie(1:height2,translation_x:translation_x+width2-1)=masque_sortie(1:height2,translation_x:translation_x+width2-1)+masque2(1:height2,1:width2);
    else
        masque_sortie(1:height2,1:width2)=masque_sortie(1:height2,1:width2)+masque2(1:height2,1:width2);
    end
end

%Détermination des surfaces communes entre les deux images selon les
%coordonnées du vecteur translation
if translation_y>0
    if translation_x>0
        surface_commune1=im1(translation_y:height1-1,translation_x:width1-1);
        surface_commune2=im2(1:height1-translation_y,1:width1-translation_x);

    else
        surface_commune1=im1(translation_y:height1-1,1:width1-abs(translation_x));
        surface_commune2=im2(1:height2-translation_y,abs(translation_x):width2-1);

    end
else
    if translation_x>0
        
        surface_commune1=im1(1:height1-abs(translation_y),translation_x:width1-1);
        surface_commune2=im2(abs(translation_y):height2-1,1:width2-abs(translation_x));

    else
        
        surface_commune1=im1(1:height1-abs(translation_y),1:width1-abs(translation_x));
        surface_commune2=im2(abs(translation_y):height2-1,abs(translation_x):width2-1);

    end

    
res=0.5*(double(surface_commune1)+double(surface_commune2));%Définition des valeurs que prendra l'image de sortie sur la zone de recouvrement
image_sortie=zeros(taille_totale_y,taille_totale_x); %Création de l'image de sortie avec la taille adaptée

%Définitions des valeurs de l'image de sortie en fonction du vecteur
%translation
if translation_y>0
    if translation_x>0
        image_sortie(1:height1,1:width1)=im1;
        image_sortie(translation_y:translation_y+height2-1,translation_x:translation_x+width2-1)=im2;
        image_sortie(translation_y:height1-1,translation_x:width1-1)=res;
    else
        image_sortie(1:height1,abs(translation_x):abs(translation_x)+width1-1)=im1;
        image_sortie(translation_y:translation_y+height2-1,1:width2)=im2;
         image_sortie(translation_y:height1-1,abs(translation_x):width2-1)=res;
    end
else
    if translation_x>0
        image_sortie(abs(translation_y):abs(translation_y)+height1-1,1:width1)=im1;
        image_sortie(1:height2,translation_x:translation_x+width2-1)=im2;
        image_sortie(abs(translation_y):height2-1,abs(translation_x):width1-1)=res;
    else
        image_sortie(abs(translation_y):abs(translation_y)+height1-1,abs(translation_x):abs(translation_x)+width1-1)=im1;
        image_sortie(1:height2,1:width2)=im2;
        image_sortie(abs(translation_y):height2-1,abs(translation_x):width2-1)=res;
    end
end


imshow(uint8(image_sortie))

end



