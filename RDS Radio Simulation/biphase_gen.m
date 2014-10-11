%Générateur/Décodeur Biphase
%Prend en entrée une suite de bits, réalise une modulation BPSK, une
%modulation par porteuse, un bruitage gaussien et un décodage
%Entrées : Bits en sortie du codeur différentiel, SNR du canal AWGN
%Sorties : Chaine de bits estimée



function [bits_est] = biphase_gen(bits,SNR)

glob_var;
Nb = length(bits);
Ns = Nb/n ;

%Génération des Symboles
symb_bpsk = -pskmod(bits',M);

%Sur-échantillonage des symboles
symboles = upsample(symb_bpsk,N);
symboles_surech = symboles;
for i=1:N:length(symboles)
    symboles_surech(i+N/2)=-symboles(i);
end

%Filtre de Mise en forme

filtre_norme = h/(sum((h)));
H = fftshift(fft(h,length(f)));

%Signal RDS émis en bande de base
signal_emis_bdb = real(conv(symboles_surech,h));
t2 = (0:Te:(length(signal_emis_bdb)-1)*Te);
fft_signal_emis_bdb = fftshift(abs(fft(signal_emis_bdb,NFFT)));

porteuse = cos(2*pi*fp*t2);
%Signal RDS modulé émis
signal_emis_mod = signal_emis_bdb'.*porteuse;


% Canal AWGN
signal_recu = canal(signal_emis_mod,SNR );
%eyediagram(signal_recu(2*N:end-2*N),2*N);

%Retour en bande de base
t3=-(2*Td+(length(symboles_surech)-1)*Te):Te:2*Td-Te;
signal_recu_bdb = signal_recu.* exp(-2*pi*1i*fp*t3);
% Filtrage adapté
filtre_adapte = conv(filtre_norme,signal_recu_bdb); 
%eyediagram(real(filtre_adapte(2*N:end-2*N)),2*N);

period = length(filtre_norme)-1;

% Sous-échantillonage
symb2 = (0.5*real(filtre_adapte(period:N:period+N*(Ns-1))-filtre_adapte(period+N/2:N:period+N*(Ns-1)+N/2))); 
%Demodulation
%  scatterplot(real(symb2))
%  
symb_est = pskdemod(symb2,M,pi,'gray');
bits_est = transpose(de2bi(symb_est,'left-msb'));


end
