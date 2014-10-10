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
%%%               Separate the values with space. 
%%% 
%%%      - eps_d : Dielectric constant of the dielectric
%%%      - fp : Plasma frequency (Hz) of the metal (for Drude model) 
%%%      - gm : Collision frequency (Hz) of the metal (for Drude model)

%%% > OUTPUT
%%% 
%%%      - Lattice constants d

% Pick frequencies (Hz)

freq = [400e12 450e12 470e12 500e12 550e12];
% DIELECTRIC CONSTANT OF DIELECTRIC
eps_d = 11.9;

% Drude Model Parameters for the metal
fp = 13.8e15/(2.0*pi);
gm = 0.0;

%%%%%%%% DONT EDIT BELOW %%%%%%%%%%%%%%%%%%%%%%%%%%%%

c = 3.0e+8; % speed of light in vacuum in m/s


% DIELECTRIC FUNCTION OF METAL 
eps_m = 1.0 - fp^2./(freq.^2+1j*freq.*gm); 

t1 = eps_m.*eps_d;
t2 = eps_m+eps_d;
t12 = t1./t2;
kspp = (2.0*pi.*freq/c).*sqrt(t12);

% 
angle = pi/2.0; 
mm = -1.0;

mG = sqrt(eps_d)*2.0*pi*freq*sin(angle)/c - kspp; 

G = mG/mm;
d = 2.0*1e9*pi./G; % nm


listD = [freq'*1e-12 d']; 

disp('Freq (THz) / Lattice constant (nm)');
disp(listD);
