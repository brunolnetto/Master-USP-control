% Adjust according on acquired data
w_n = 2*pi*60;

noises_name = {'w_1', 'w_5', 'w_7'};
noises_amp = [127 2 2];
noises_freq = [w_n 5*w_n 7*w_n];

n_w = length(noises_freq); 

noises = struct('');
C_w = [1, 0];

[~, m] = size(B_obsv);

A_ww = [];
C_ww = [];
T_ww = [];

for i = 1:n_w
    A_w = [0, 1; -noises_freq(i)^2, 0]; 
    T_w = diag([1/noises_amp(i), 1/noises_amp(i)]);
    
    A_w = T_w\A_w*T_w;
    C_w = C_w*T_w;
    
    T_ww = blkdiag(T_ww, T_w);
    
    A_ww = blkdiag(A_ww, A_w);
    C_ww = blkdiag(C_ww, C_w);
    
    n = length(A_obsv);
    
    % Noise assurance
    noise_name = noises_name{i};
    noises(1).(noise_name).A_w = A_w;
    noises(1).(noise_name).C_w = C_w;
    noises(1).(noise_name).w = noises_freq(i);
    noises(1).(noise_name).phi = rand();
    noises(1).(noise_name).A = noises_amp(i);

    A_obsv = [A_obsv, B_obsv*C_w; zeros(2, n), A_w];
    B_obsv = [B_obsv; zeros(2, m)];
    C_obsv = [C_obsv zeros(p, 2)];

    sys_name = [sys_name, ' + ', noise_name];
    is_ctrb_obsv(sys_name, A_obsv, B_obsv, C_obsv);
end
