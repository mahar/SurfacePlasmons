%%% SURFACE PLASMON POLARITON GRATING %%%%%%%
%%% 
%%% This piece of code calculates the lattice constants 
%%% of a 1D grating on a metal film needed for the the coupling 
%%% of surface plasmons to radiative modes. 



%%% Developed by: Charalampos P. Mavidis
%%% E-Mail: mavidis [at] iesl [dot] forth [dot] gr
%%% Date: October 10, 2014

%%% USAGE:
%%% ======
%%%  > INPUT
%%% 
%%%      - freq : List of freqencies in Hz. 
%%%               
%%% 
%%%      - eps_d : Dielectric constant of the dielectric
%%%      - fp : Plasma frequency (Hz) of the metal (for Drude model) 
%%%      - gm : Collision frequency (Hz) of the metal (for Drude model)

%%% > OUTPUT
%%% 
%%%      - kspp : Dispersion relation of surface plasmon.

c = 3.0e+8; % speed of light in vacuum in m/s

% DIELECTRIC CONSTANT OF DIELECTRIC
eps_d = 11.9;

% Drude Model Parameters for the metal
fp = 13.8e15/(2.0*pi);
gm = 0.0;

freq = linspace(200e12,950e12,500); % Hz

% DIELECTRIC FUNCTION OF METAL 
eps_m = 1.0 - fp^2./(freq.^2+1j*freq.*gm); 



figure();
plot(freq*1e-12,real(eps_m),'b-'); hold on;
plot(freq*1e-12,imag(eps_m),'r-'); hold on; 
xlim([200 950]); ylim([-100 30]); 
xlabel('Frequency (THz)');
ylabel('Dielectric function');
legend('Real','Imag');
title('Gold Dielectric Function')

% DISPERSION RELATION

t1 = eps_m*eps_d;
t2 = eps_m+eps_d;
%t2inv = 1./t2;
t12 = t1./t2;
kspp = (2.0*pi*freq/c).*sqrt(t12);

figure();
plot(real(kspp),freq*1e-12,'k-');
hold on;

fsp = fp*1e-12/sqrt(1+eps_d); 
plot(sqrt(eps_d)*2.0*pi*freq/c,freq*1e-12,'b--');
hold on; plot(2.0*pi*freq/c,freq*1e-12,'r--');
hold on;
plot(real(kspp),fsp*ones(size(kspp)),'g--'); 

xlim([0e6 7e8]); ylim([200 950]); 
xlabel('kx');
ylabel('Frequency (THz)');
legend('kspp','Si light line', 'Air light line','fspp');
title('Dispersion relation: Gold-Si interface')