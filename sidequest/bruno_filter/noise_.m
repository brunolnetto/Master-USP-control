% Adjust according on acquired data
w_n = 2*pi*60;

noise_amp = [127 2 2];
noise_freq = [w_n 5*w_n 7*w_n];

n_w = length(noise_freq); 

noises = struct('');
C_w = [1, 0];

[~, m] = size(B_obsv);

A_ww = [];
C_ww = [];

for i = 1:n_w
    A_w = [0, 1; -noise_freq(i)^2, 0]; 
    
    A_ww = blkdiag(A_ww, A_w);
    C_ww = blkdiag(C_ww, C_w);
    
    n = length(A_obsv);
    
    % Noise assuran-1ce
    noise_name = sprintf('w_%d', i);
    noises(1).(noise_name).A_w = A_w;
    noises(1).(noise_name).C_w = C_w;
    noises(1).(noise_name).w = noise_freq(i);
    noises(1).(noise_name).phi = rand();
    noises(1).(noise_name).A = noise_amp(i);

    A_obsv = [A_obsv, B_obsv*C_w; zeros(2, n), A_w];
    B_obsv = [B_obsv; zeros(2, m)];
    C_obsv = [C_obsv zeros(p, 2)];

    sys_name = [sys_name, ' + ', noise_name];
    is_ctrb_obsv(sys_name, A_obsv, B_obsv, C_obsv);
end
