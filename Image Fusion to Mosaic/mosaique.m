function [ image_sortie,masque_sortie ] = mosaique( nombre_image,varargin )
tic

cell_image=cell(1,nombre_image); %Définitions de la taille des cellules à partir du nombre d'images passées en paramètre
cell_boite=cell(1,nombre_image);
cell_masque=cell(1,nombre_image);
cell_translation_x=cell(nombre_image,nombre_image);
cell_translation_y=cell(nombre_image,nombre_image);
cell_height=cell(1,nombre_image);
cell_width=cell(1,nombre_image);
cell_coord_max=cell(1,nombre_image);
for i=1:nombre_image
    
    cell_image{1,i}=varargin(i); %Affectation de chaque image passée en paramètre à une cellule
    [cell_boite{1,i} ~]=boite_masque(cell2mat(cell_image{1,i}));%Calcul et stockage des boites de chaque image
    
end
[image_x,image_y]=size(cell2mat(cell_image{1,1})); %Extraction de la taille des images (elles sont toutes de meme taille)
for i=2:nombre_image
    [cell_translation_x{1,i-1} cell_translation_y{1,i-1}]=translation(cell2mat(cell_image{1,i-1}),cell2mat(cell_image{1,i})); %Détermination des translations entre chaque image
end

xmin=1;xmax=1+image_x; %Coordonnées minimum et maximum de l'image 1
ymin=1;ymax=1+image_y;
vec_min_width=[1];
vec_max_width=[1+image_x];
vec_min_height=[1];
vec_max_height=[1+image_y];
for i=2:nombre_image %Pour chaque image, on stocke les coordonnées relatives correspondantes à sa translation dans un tableau
    vec_min_width=[vec_min_width vec_min_width(i-1)+cell_translation_x{1,i-1}];
    vec_max_width=[vec_max_width vec_max_width(i-1)+cell_translation_x{1,i-1}];
    vec_min_height=[vec_min_height vec_min_height(i-1)+cell_translation_y{1,i-1}];
    vec_max_height=[vec_max_height vec_max_height(i-1)+cell_translation_y{1,i-1}];
    
end
xmin=min(vec_min_width);      %On prend le min/max de chaque tableau pour déterminées les coordonnées max de l'image de sortie
xmax=max(vec_max_width);
ymin=min(vec_min_height);
ymax=max(vec_max_height);

taille_totale_y=ymax-ymin %Définition de la taille totale de l'image de sortie
taille_totale_x=xmax-xmin
for i=1:nombre_image
    cell_masque{1,i}=zeros(taille_totale_x,taille_totale_y); %On crée les masques de chaque image en les remplissant de zéros
    
end
image_sortie=double(zeros(taille_totale_x,taille_totale_y)); %On initialise l'image de sortie à zéro
masque_sortie=zeros(taille_totale_x,taille_totale_y);%On initialise le masque de sortie à zéro

%Traitement de la première image
translation_boite_1_x=1-xmin; %Valeur de la boite 1 Translatée par rapport à l'image totale
translation_boite_1_y=1-ymin;

cell_boite{1,1}=translation_boite(cell_boite{1,1},translation_boite_1_x,translation_boite_1_y); %Translation de la boite 1 par rapport à l'image totale
cell_masque{1,1}(translation_boite_1_x+1:image_x+translation_boite_1_x,translation_boite_1_y+1:image_y+translation_boite_1_y)=1;%Translation du masque 1 par rapport à l'image totale
image_sortie(translation_boite_1_x+1:image_x+translation_boite_1_x,translation_boite_1_y+1:image_y+translation_boite_1_y)=cell2mat(cell_image{1,1}); %Application de l'image 1 sur l'image de sortie
masque_sortie=masque_sortie+cell_masque{1,1};%Application du masque 1 sur le masque total
somme_vecteurs_x=1;
somme_vecteurs_y=1;


%Itération du traitement pour le reste des images
for i=2:nombre_image
    [cell_translation_x{1,i-1},cell_translation_y{1,i-1}]=translation(cell2mat(cell_image{1,i-1}),cell2mat(cell_image{1,i}));
    somme_vecteurs_x=somme_vecteurs_x+cell_translation_x{1,i-1};
    somme_vecteurs_y=somme_vecteurs_y+cell_translation_y{1,i-1};
    translation_boite_x=somme_vecteurs_x-xmin;
    translation_boite_y=somme_vecteurs_y-ymin;
    cell_boite{1,i}=translation_boite(cell_boite{1,i},translation_boite_x,translation_boite_y);
    cell_masque{1,i}(translation_boite_x+1:image_x+translation_boite_x,translation_boite_y+1:image_y+translation_boite_y)=1;
    masque_sortie=masque_sortie+cell_masque{1,i};
    im=double(cell2mat(cell_image{1,i}));
    image_sortie(translation_boite_x+1:image_x+translation_boite_x,translation_boite_y+1:image_y+translation_boite_y)=0.5.*( im+image_sortie(translation_boite_x+1:image_x+translation_boite_x,translation_boite_y+1:image_y+translation_boite_y));
    
end

imshow(uint8(image_sortie)); %Affichage de l'image

toc
end
