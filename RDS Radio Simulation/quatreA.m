function [ trame ] = quatreA( num_group )

PI=[1 1 1 1 0 0 1 0 0 0 0 0 0 0 1 0];

group1=[PI];
B0=[0];
TP=[0];
PTY=[0 0 1 1 1];
code_group_type=[0 1 0 0];

annee=num2str(year(today)); %Matlab fournit la date du jour
Y=str2num(annee(3:4));
M=month(today);
D=day(today);

if (M<=2) %Calcul du MJD avec les formules données dans la norme
    L=1;
else 
    L=0;
end
        
MJD =14956+D+floor((Y-L)*365.25)+floor((M+1+(L*12))*30.6001);
MJD_bin=dec2bin(MJD,17)-'0';

group=[code_group_type B0 TP PTY 0 0 0 MJD_bin(1) MJD_bin(2)];

group2=[group];
time=clock; %Matlab fournit l'heure
hour_utc=dec2bin(time(4)-1,5)-'0';
minute=dec2bin(time(5),6)-'0';
local_time_offset=[0 0 0 0 0 1]; %Décalage entre l'heure UTC et l'heure francaise

group=[MJD_bin(3:length(MJD_bin)) hour_utc(1)];
group3=[group];

group=[hour_utc(2:length(hour_utc)) minute local_time_offset];
group4=[group];

trame=[group1 group2 group3 group4];



end

