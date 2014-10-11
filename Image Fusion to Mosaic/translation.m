%Translation
%Prend en entrée deux images et retourne les coordonnées en X et Y du
%vecteur translation qui les lie
%Entrées : Image 1, Image 2
%Sorties : Coords X/Y du vecteur translation


function [ x_final,y_final ] = translation( im1,im2 )


[height1 width1]=size(im1); %Extraction de la taille des images
[height2 width2]=size(im2);


fourier_im1=fft2(im1);             % transformées de fourier des deux images
fourier_im2=fft2(im2);

spectre_puissance_croise= (fourier_im2.*conj(fourier_im1))./abs(fourier_im2.*conj(fourier_im1)); %Création du spectre de puissance croisée
mesh(abs(spectre_puissance_croise));
trans_inverse_spectre=ifft2(spectre_puissance_croise); %Transformée de fourier inverse du spectre de puissance croisée


[maxz,y_max]=max(max(trans_inverse_spectre));  %Extraction des coordonnées du pic d'amplitude maxz
[y1 x_max]=max(trans_inverse_spectre(:,y_max)); 
%le spectre a une amplitude de 1 (module d'une exponentielle) sur l'ensemble de son espace de définition 

%Détermination de la position réelle du pic en fonction de sa position sur
%le cadran
if x_max>floor((height1)/2)                                                   
    if y_max>floor((width1)/2)                                             
        x_final=x_max-height1-1;                                                  
        y_final=y_max-width1-1;
    else                                                                    
        x_final=x_max-height1-1;
        y_final=y_max-1;
    end
else
    if y_max>floor((width1)/2)                                           
        x_final=x_max-1;
        y_final=y_max-width1-1;
    else                                                                    
        x_final=x_max-1;
        y_final=y_max-1;
    end
end

x_final=-x_final;
y_final=-y_final;

end

