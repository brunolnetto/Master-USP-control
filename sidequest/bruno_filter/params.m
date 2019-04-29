% Nominal plant

% Motor voltage
Vcc = 40;

% Harmonic noise 
n_w = 7;
w_n = 2*pi*60;

% Computing time time steps
n_d = 1;

% Filter indutance [H]
L = 10e-3;

% Circuit resistance [ohm]
R = 0.1;

% Filter capacitor [F]
C = 25e-6;

% Sample time [Hz]
% RLC U(s)/U_C(s) = (1/LC)/(s^2 + (R/L)s + (1/LC)) 
% w_n = 1/sqrt(LC)
% 2*w_n*zeta = (R/L) ==> zeta = (R/L)/(2*(1/sqrt(LC)))

% fa >> 1/t_s, t_s: RLC settling time 
% Second order settling time (precision p): t_s = -ln(p)/(zeta*w_n)

% RLC frequence and damping factor
w_n = 1/sqrt(L*C);
zeta = (R/L)/(2*w_n);

% Settling time precision [%]
p = 5/100;

% Settling time [s]
t_s = -log(p)/(zeta*w_n);

% Sampling time scaler []
ta_scaler = 100;

Ta = ta_scaler*t_s;
fa = 1/Ta;