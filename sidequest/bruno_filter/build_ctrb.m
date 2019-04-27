A_ctrb = A;
B_ctrb = B;
C_ctrb = C;

[Phi_ctrb, Gamma_ctrb] = c2d(A_ctrb, B_ctrb, Ta);

%run('delays_ctrb');
% 
% n_ctrb = length(Phi_ctrb);
% [~, m_ctrb] = size(Gamma_ctrb);
% [p_ctrb, ~] = size(C_ctrb);
% 
% % Reference tracking
% Chat = C_ctrb;
% 
% [p_ref, ~] = size(Chat);
% 
% Phi_ctrb = [Phi_ctrb, zeros(n_ctrb, p_ref);
%             -Chat, eye(p_ref)];
% Gamma_ctrb = [Gamma_ctrb; zeros(p_ref, m_ctrb)];
% C_ctrb = [C_ctrb, zeros(p_ctrb, p_ref)];

n_ctrb = length(Phi_ctrb);
[~, m_ctrb] = size(Gamma_ctrb);
[~, p_ctrb] = size(C_ctrb);

% LQR control
Q = zeros(n_ctrb);
Q(1, 1) = 1/(1)^2;
Q(2, 2) = 1/(20)^2;

R = 1/1^2;

Kp = dlqr(Phi_ctrb, Gamma_ctrb, Q, R);
