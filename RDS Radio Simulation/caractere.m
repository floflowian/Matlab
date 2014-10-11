%Décodeur de caractère
%Transforme une suite de 8 bits en un caractère ASCII
%Entrée : Chaine de 8 bits
%Sortie : Caractère ASCII correspondant



function [ string_caractere ] = caractere( bits )
string_caractere=[];
if bits(1:4)==[0 0 1 0] %Les 4 premiers bits déterminent la colonne de la table de caractère

    if(bits==[0 0 1 0 0 0 0 0]) %Comparaison avec chaque caractère de la colonne
        string_caractere=' ';
    elseif(bits==[0 0 1 0 1 1 0 0]) 
        string_caractere='`';
    elseif(bits==[0 0 1 0 1 1 0 1]) 
        string_caractere='-';
    elseif(bits==[0 0 1 0 1 1 1 0]) 
        string_caractere='.';
    elseif(bits==[0 0 1 0 1 1 1 1]) 
        string_caractere='/';
    else    %Caractère non trouvé
    disp('Unknown Character');
    disp(bits)
    end
elseif bits(1:4)==[0 0 1 1]   
    
    if(bits==[0 0 1 1 0 0 0 0]) 
        string_caractere='0';
    elseif(bits==[0 0 1 1 0 0 0 1]) 
        string_caractere='1';
    elseif(bits==[0 0 1 1 0 0 1 0]) 
        string_caractere='2';
    elseif(bits==[0 0 1 1 0 0 1 1]) 
        string_caractere='3';
    elseif(bits==[0 0 1 1 0 1 0 0]) 
        string_caractere='4';
    elseif(bits==[0 0 1 1 0 1 0 1]) 
        string_caractere='5';
    elseif(bits==[0 0 1 1 0 1 1 0]) 
        string_caractere='6';
    elseif(bits==[0 0 1 1 0 1 1 1]) 
        string_caractere='7';
    elseif(bits==[0 0 1 1 1 0 0 0]) 
        string_caractere='8';
    elseif(bits==[0 0 1 1 1 0 0 1]) 
        string_caractere='9';
else
    disp('Unknown Character');
    disp(bits)
    end
elseif bits(1:4)==[0 1 0 0]
    
if(bits==[0 1 0 0 0 0 0 1]) 
        string_caractere='A';
    elseif(bits==[0 1 0 0 0 0 1 0]) 
        string_caractere='B';
    elseif(bits==[0 1 0 0 0 0 1 1]) 
        string_caractere='C';
    elseif(bits==[0 1 0 0 0 1 0 0]) 
        string_caractere='D';
    elseif(bits==[0 1 0 0 0 1 0 1]) 
        string_caractere='E';
    elseif(bits==[0 1 0 0 0 1 1 0]) 
        string_caractere='F';
    elseif(bits==[0 1 0 0 0 1 1 1]) 
        string_caractere='G';
    elseif(bits==[0 1 0 0 1 0 0 0]) 
        string_caractere='H';
    elseif(bits==[0 1 0 0 1 0 0 1]) 
        string_caractere='I';
    elseif(bits==[0 1 0 0 1 0 1 0]) 
        string_caractere='J';
    elseif(bits==[0 1 0 0 1 0 1 1]) 
        string_caractere='K';
    elseif(bits==[0 1 0 0 1 1 0 0]) 
        string_caractere='L';
    elseif(bits==[0 1 0 0 1 1 0 1]) 
        string_caractere='M';
    elseif(bits==[0 1 0 0 1 1 1 0]) 
        string_caractere='N';
    elseif(bits==[0 1 0 0 1 1 1 1]) 
        string_caractere='O';
else
    disp('Unknown Character');
    disp(bits)
    end
elseif bits(1:4)==[0 1 0 1]
    
        if(bits==[0 1 0 1 0 0 0 0]) 
        string_caractere='P';
        elseif(bits==[0 1 0 1 0 0 0 1]) 
        string_caractere='Q';
        elseif(bits==[0 1 0 1 0 0 1 0]) 
        string_caractere='R';
        elseif(bits==[0 1 0 1 0 0 1 1]) 
        string_caractere='S';
        elseif(bits==[0 1 0 1 0 1 0 0]) 
        string_caractere='T';
        elseif(bits==[0 1 0 1 0 1 0 1]) 
        string_caractere='U';
        elseif(bits==[0 1 0 1 0 1 1 0]) 
        string_caractere='V';
        elseif(bits==[0 1 0 1 0 1 1 1]) 
        string_caractere='W';
        elseif(bits==[0 1 0 1 1 0 0 0]) 
        string_caractere='X';
        elseif(bits==[0 1 0 1 1 0 0 1]) 
        string_caractere='Y';
        elseif(bits==[0 1 0 1 1 0 1 0]) 
        string_caractere='Z';
        else
    disp('Unknown Character');
    disp(bits)
    end
else
    disp('Unknown Character');
    disp(bits)
    end
        
end

