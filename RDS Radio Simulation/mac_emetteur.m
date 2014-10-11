function [ trame_mac ] = mac_emetteur(  )
messageerror='Unknown group type';
trame_mac=[];

trame=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 2 2 4 4 4 4 4 4 4 4 4 4 10 10 10 10 10 10 10 10 10 10]; %Trame donnant la suite des types de groupe à émettre
longueur=length(trame);
for i=1:longueur
    
if trame(i)==0   
    k=i-1;
        trame_mac=[trame_mac zeroA(mod(k,4))]; %On concatene la trame courante avec un nouveau paquet 
    
elseif trame(i)==2
    k=i-17;
        trame_mac=[trame_mac deuxA(mod(k,4))];
elseif trame(i)==4
        trame_mac=[trame_mac quatreA(i)];
elseif trame(i)==10
    k=i-31;
        trame_mac=[trame_mac dixA(mod(k,2))];
else
    disp(messageerror)
end

end
end

