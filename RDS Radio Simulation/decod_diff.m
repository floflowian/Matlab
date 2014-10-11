%D�codeur diff�rentiel
%Entr�e : Bits en sortie du d�codeur biphase
%Sortie : Bits d�cod�s � destination du d�codeur cyclique

function [ bits_cr ] = decod_diff ( bits_cdr )

n = size( bits_cdr, 2 );
bits_cr = zeros(1,n);

% Initialisation
bits_cr(1,1) = bits_cdr(1,1);

for i=2:n
    bits_cr(i) = xor( bits_cdr(i-1), bits_cdr(i) ); %D�codage XOR
end

bits_cr;

end

