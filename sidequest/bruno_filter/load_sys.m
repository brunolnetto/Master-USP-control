fa = 5000;
Ta = 1/fa;

% Discrete time Z variable
z = tf('z',Ta);

% Estados: i_f, v_c
% Entrada: v
A = [-R/L -1/L; 1/C 0];
B = [Vcc/L; 0];
C = [1 0];

n = length(A); 
[~, m] = size(B); 
[p, ~] = size(C); 

sys_name = 'Original system';

is_ctrb_obsv(sys_name, A, B, C)

