function [info_RDS  ] = mac_reception( bits_est )

nombre_groupes = length(bits_est)/64;
duree_paquet=nombre_groupes*64*1/1187.5; 
nombre_0A=0;nombre_2A=0;nombre_4A=0;nombre_10A=0;    
program_service_name=[];
radiotext=[];
program_type_name='';
AF=[];
info_rds=cell(1,20);
for i=1:nombre_groupes
        
bits_mac = bits_est((i-1)*64+1:i*64); %Découpage en paquets de 64 bits
        
       
PI=bits_mac(1:16);
group_type_code=bits_mac(17:20);
B0_bit=bits_mac(21);
TP=bits_mac(22);
PTY=bits_mac(23:27);
if B0_bit==0 %Version
    version='A';
else
    version='B';
end


[country_code,coverage,reference] = decod_PI( PI ); %Program Identification

program_type=decod_PTY(PTY); %Program Type

if group_type_code==[0 0 0 0] %Selon le type de groupe, on lance la fonction de décodage appropriée
    [ TA,MS,DI,AF,program_service_name ]=decod_zeroA(bits_mac,AF,program_service_name);
    program_service_name=char(program_service_name);
    nombre_0A=nombre_0A+1;
    

elseif group_type_code==[0 0 1 0]
    [ flag,address_code,radiotext] =decod_deuxA(bits_mac,radiotext);
   radiotext=char(radiotext);
    nombre_2A=nombre_2A+1;


elseif group_type_code==[0 1 0 0]
    [ Y,M,D,hour,minute] =decod_quatreA(bits_mac);
    nombre_4A=nombre_4A+1;
    
elseif group_type_code==[1 0 1 0]
    [ flag,address_code,program_type_name] =decod_dixA(bits_mac,program_type_name);
    program_type_name=char(program_type_name);
    nombre_10A=nombre_10A+1;
    
end
end

pourcentage_0A=nombre_0A/nombre_groupes; %Calcul des pourcentages par type de groupe
pourcentage_2A=nombre_2A/nombre_groupes;
pourcentage_4A=nombre_4A/nombre_groupes;
pourcentage_10A=nombre_10A/nombre_groupes;

info_RDS={program_type,TP,TA,AF,program_service_name,radiotext,Y,M,D,hour,minute, program_type_name,pourcentage_0A,pourcentage_2A,pourcentage_4A,pourcentage_10A,duree_paquet,version,MS,PTY};

end

