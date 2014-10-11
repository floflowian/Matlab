function [ trame ] = dixA( num_group )

PI=[1 1 1 1 0 0 1 0 0 0 0 0 0 0 1 0];

group1=[PI ];
B0=[0];
TP=[0];
PTY=[0 0 1 1 1];
code_group_type=[1 0 1 0];
flag=[0];

if num_group==0 %Selon le numéro du paquet on place les caractères
    c0=0;
    text1=[dec2bin('S',8)-'0' dec2bin('C',8)-'0'];
    text2=[dec2bin('I',8)-'0' dec2bin('E',8)-'0'];
elseif num_group==1
    c0=1;
    text1=[dec2bin('N',8)-'0' dec2bin('C',8)-'0'];
    text2=[dec2bin('E',8)-'0' dec2bin('S',8)-'0'];
end

group=[code_group_type B0 0 PTY flag 0 0 0 c0];

group2=[group ];

group3=[text1 ];

group4=[text2];

trame=[group1 group2 group3 group4]; %On concatène toutes les informations

end
