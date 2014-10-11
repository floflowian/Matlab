%Codeur de groupe 2A
%Renvoie un groupe 2A contenant les infos nécessaires selon son numéro de
%groupe

function [ trame ] = deuxA( num_group)
PI=[1 1 1 1 0 0 1 0 0 0 0 0 0 0 1 0];
group1=[PI];
B0=[0];
TP=[0];
PTY=[0 0 1 1 1];
code_group_type=[0 0 1 0];
if num_group==0 %Selon la position du paquet lu, on écrit les caractères correspondant
    flag=1;
    code=[0 0 0 0];
    text1=[dec2bin('L',8)-'0' dec2bin('E',8)-'0'];
    text2=[dec2bin(' ',8)-'0' dec2bin('S',8)-'0'];
    
elseif num_group==1
    flag=0;
    code=[0 0 0 1];
    text1=[dec2bin('A',8)-'0' dec2bin('V',8)-'0'];
    text2=[dec2bin('I',8)-'0' dec2bin('E',8)-'0'];
    
elseif num_group==2
    flag=0;
    code=[0 0 1 0];
    text1=[dec2bin('Z',8)-'0' dec2bin('-',8)-'0'];
    text2=[dec2bin('V',8)-'0' dec2bin('O',8)-'0'];
    
elseif num_group==3
    flag=0;
    code=[0 0 1 1];
    text1=[dec2bin('U',8)-'0' dec2bin('S',8)-'0'];
    text2=[dec2bin('0',8)-'0' dec2bin('D',8)-'0'];    
end

group=[code_group_type B0 TP PTY flag code];
group2=[group];
group3=[text1];
group4=[text2];

trame=[group1 group2 group3 group4]; %On concatene toutes les informations
end

