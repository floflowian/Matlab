BER=[];
for SNR=1:10
    nombre_erreur=0;
nb_bits_emis=0;
while nombre_erreur<100
bits=mac_emetteur();
bits_c = cod_cyclique( bits );

nb_bits_emis=nb_bits_emis+length(bits_c);

bits_cd = cod_diff ( bits_c );

nombre=length(bits_cd)/104;
erreur=0;

sortie=[];
for i=1:nombre
    bits_sortie=biphase_gen_tony(bits_cd((i-1)*104+1:i*104),SNR);
    sortie=[sortie bits_sortie];
end
diff=bits_cd-sortie;
for k=1:length(diff)
    if (diff(k)==1 || diff(k)==-1)
        
        erreur=erreur+1;
    end
end
bits_cdr=sortie;

bits_cr = decod_diff( bits_cdr );
nombre_erreur=nombre_erreur+sum(abs(bits_cdr-bits_cd));
end
 BER=[BER nombre_erreur/nb_bits_emis]
end

