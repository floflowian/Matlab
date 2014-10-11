%Décodeur de type de programme
%Entrée : Chaine de bits de PTY
%Sortie : Type de programme

function [ program_type ] = decod_PTY( PTY )

if PTY==[0 0 0 0 0] %Décodage du type de programme
    program_type='Undefined';
elseif PTY==[0 0 0 0 1]
    program_type='News';
elseif PTY==[0 0 0 1 0]
    program_type='Current Affairs';
elseif PTY==[0 0 0 1 1]
    program_type='Information';
elseif PTY==[0 0 1 0 0]
    program_type='Sport';
elseif PTY==[0 0 1 0 1]
    program_type='Education';
elseif PTY==[0 0 1 1 0]
    program_type='Drama';
elseif PTY==[0 0 1 1 1]
    program_type='Culture';
elseif PTY==[0 1 0 0 0]
    program_type='Science';
elseif PTY==[0 1 0 0 1]
    program_type='Varied';
end
%Etc
    
    
    
    
    
    
    

end

