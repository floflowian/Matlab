function [ trame ] = zeroA( num_group )
PI=[1 1 1 1 0 0 1 0 0 0 0 0 0 0 1 0];

group1=[PI];
B0=[0];
TP=[0];
PTY=[0 0 1 1 1];
AF1=[0 1 1 0 0 1 0 1]; AF2=[0 0 0 1 1 0 1 1];AF3=[0 1 0 1 0 0 0 0];AF4=[0 1 0 1 1 1 1 0];AF5=[0 1 1 0 1 1 0 1];AF6=[0 1 0 0 0 1 1 1];AF7=[0 1 1 0 1 0 0 0];    
    code_group_type=[0 0 0 0];
    TA=[0];
    MS=[1];
    
    D0=1;D1=0;D2=0;D3=0;
    if num_group==0 %Selon le numéro du paquet, on code les AF et les caractères correspondants
    DI=[D3 0 0];
    num_AF=[1 1 1 0 0 1 1 1]; %231 pour 7 AF
    group=[code_group_type B0 TP PTY TA MS DI];
    
    group2=[group];
    
    group=[num_AF AF1];
    
    group3=[group];
    
    group=[dec2bin('C',8)-'0' dec2bin('U',8)-'0'];
   
    group4=[group];
    
    
    elseif num_group==1
    DI=[D2 0 1];
    group=[code_group_type B0 TP PTY TA MS DI];
  
    group2=[group];
    
    group=[AF2 AF3];
 
    group3=[group];
    
    group=[dec2bin('L',8)-'0' dec2bin('T',8)-'0'];
 
    group4=[group];
    elseif num_group==2
        DI=[D1 1 0];
    group=[code_group_type B0 TP PTY TA MS DI];
   
    group2=[group];
    
    group=[AF4 AF5];
    
    group3=[group];
    
    group=[dec2bin('U',8)-'0' dec2bin('R',8)-'0'];
  
    group4=[group];
    
    elseif num_group==3
        DI=[D0 1 1];
    group=[code_group_type B0 TP PTY TA MS DI];

    group2=[group];
    
    group=[AF6 AF7];

    group3=[group];
    
    group=[dec2bin('E',8)-'0' dec2bin(' ',8)-'0'];

    group4=[group];
    end
    
    trame=[group1 group2 group3 group4];
    


end

