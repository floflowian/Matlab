%Décodeur Cyclique
%Détecte et corrige certaines erreurs dans les bits reçus
%Entrée : Bits à corriger
%Sortie : Bits corrigés


function [ bits_est,error ] = decod_cyclique ( bits_cr )
glob_var;

errorfound = 0;
messagenoerror = 'No error was found';
messageerror = 'Errors could not be corrected';
error=0;    
H1 = eye(10);
H2 = [1 0 1 1 0 1 1 1 0 0 ;0 1 0 1 1 0 1 1 1 0 ;0 0 1 0 1 1 0 1 1 1 ;1 0 1 0 0 0 0 1 1 1 ;1 1 1 0 0 1 1 1 1 1 ;1 1 0 0 0 1 0 0 1 1 ;1 1 0 1 0 1 0 1 0 1 ;1 1 0 1 1 1 0 1 1 0 ;0 1 1 0 1 1 1 0 1 1 ;1 0 0 0 0 0 0 0 0 1 ;1 1 1 1 0 1 1 1 0 0 ;0 1 1 1 1 0 1 1 1 0 ;0 0 1 1 1 1 0 1 1 1 ;1 0 1 0 1 0 0 1 1 1 ;1 1 1 0 0 0 1 1 1 1 ;1 1 0 0 0 1 1 0 1 1 ];
H = [H1;H2];
S = [];
E = [];
% création de deux matrices associatives E et S

for i = 1:26
   
    for j=1:10
        if i-1+j<=26
            e2=[zeros(1,i-1) ones(1,j) zeros(1,26-(j+i-1))];
            S=[S;mod(e2*H,2)];
            E=[E;e2];
        end
        
    end
    
end

for i=1:17
    e3=[zeros(1,i-1) ones(1, 10) zeros(1, 16-(i-1))];
    E=[E;e3];
    S=[S;mod(e3*H,2)];    
end

[m n] = size(S);

%Decodage
nb_group=length(bits_cr)/26;
number=0;
for k=1:nb_group
    num_offset = mod(number,4);
    if num_offset==0
        offset = A; 
    elseif num_offset==1
        offset = B;
    elseif num_offset==2
        offset = C;
    elseif num_offset==3
        offset = D;
    end
    number=number+1;
group = bits_cr( 1+(k-1)*26:26*k );    %Découpage en paquets de 26 bits
group(17:26) = xor( group(17:26), offset ); %Décodage du xor
S_code = mod(group*H, 2); %Calcul du syndrome correspondant
if S_code==zeros(1, 10) %Syndrome nul = pas d'erreur
    
    bits_est( 1+(k-1)*16:16*k ) = group(1:16);
else %Sinon, on cherche une correspondance dans la table de syndrome
    for i=1:m
        if S_code==S(i,:) %Une correspondance est trouvée, on cherche son équivalent dans la table d'erreurs
            matching_error = E(i,:);
            errorfound = 1;
        end
    end
    if errorfound==0 %Pas de correspondance
        error=error+1;
    else
        for i=1:26 %On corrige les bits
           if matching_error(i)==1
               decod(i) = mod(group(i)+1,2);
           else
               decod(i) = group(i);
           end
        end
        
        bits_est( 1+(k-1)*16:16*k ) = decod(1:16); %On extrait les 16 premiers bits
    end  
end
end
end
        


