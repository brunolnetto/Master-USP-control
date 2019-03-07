close all;
clear all;
clc;

% Wheels
% -- Right --
syms th_r psi_r real;
syms thp_r psip_r real;
syms thpp_r psipp_r real;

syms m_r;
syms Ixx_r Iyy_r Izz_r real;

syms tau_r;

% -- Left --
syms th_l psi_l real;
syms thp_l psip_l real;
syms thpp_l psipp_l real;
syms m_l;
syms Ixx_l Iyy_l Izz_l real;

syms tau_l;

% Dimensional
syms D L;

% Right wheel
% -> Rotations
R_r_th = rot3d(th_r, [0; 0; 1]);
R_r_psi = rot3d(psi_r, [0; 1; 0]);

R_r_0_Wr = R_r_th*R_r_psi;
R_r_Wr_0 = R_r_0_Wr.';

% -> Angular and linear velocity
w_r_0 = omega(R_r_0_Wr, [th_r; psi_r], [thp_r; psip_r]);
vg_r_0 = [D*psip_r*cos(th_r)/2; D*psip_r*sin(th_r)/2; 0];

vg_r_Wr = simplify(R_r_Wr_0*vg_r_0);
w_r_Wr = simplify(R_r_Wr_0*w_r_0);

% -> Angular and linear accelerations
ag_r_0 = dvecdt(vg_r_0, [th_r; psi_r; thp_r; psip_r], ...
                        [thp_r; psip_r; thpp_r; psipp_r]);

wp_r_0 = dvecdt(w_r_0, [th_r; psi_r; thp_r; psip_r], ...
                       [thp_r; psip_r; thpp_r; psipp_r]);

ag_r_Wr = simplify(R_r_Wr_0*ag_r_0);
wp_r_Wr = simplify(R_r_Wr_0*wp_r_0);

% -> Kinematic coupling
p_r_circ = [vg_r_Wr; w_r_Wr];
dp_r_circ_dp_r_bullet = jacobian(p_r_circ, [thp_r; psip_r]);

Tau_r = [0; tau_r; 0];

I_r = diag([Ixx_r; Iyy_r; Izz_r]);
f_r = [-m_r*eye(3)*ag_r_Wr; ...
       Tau_r - I_r*wp_r_Wr + skew(w_r_Wr)*I_r*w_r_Wr];

W_r.eq = simplify(dp_r_circ_dp_r_bullet.'*f_r); 
W_r.H = simplify(-jacobian(W_r.eq, [thpp_r; psipp_r]));
W_r.Z = simplify(jacobian(W_r.eq, tau_r));
W_r.h = simplify(W_r.eq + W_r.H*[thpp_r; psipp_r] - W_r.Z*tau_r);

% Left wheel
% -> Rotations
R_l_th = rot3d(th_l, [0; 0; 1]);
R_l_psi = rot3d(psi_l, [0; -1; 0]);

R_l_0_Wl = R_l_th*R_l_psi;
R_l_Wl_0 = R_l_0_Wl.';

% -> Angular and linear velocities
w_l_0 = omega(R_l_0_Wl, [th_l; psi_l], [thp_l; psip_l]);
vg_l_0 = [D*psip_l*cos(th_l)/2; D*psip_l*sin(th_l)/2; 0];

vg_l_Wl = simplify(R_l_Wl_0*vg_l_0);
w_l_Wl = simplify(R_l_Wl_0*w_l_0);

% -> Angular and linear accelerations
ag_l_0 = dvecdt(vg_l_0, [th_l; psi_l; thp_l; psip_l], ...
                        [thp_l; psip_l; thpp_l; psipp_l]);

wp_l_0 = dvecdt(w_l_0, [th_l; psi_l; thp_l; psip_l], ...
                       [thp_l; psip_l; thpp_l; psipp_l]);

ag_l_Wl = simplify(R_l_Wl_0*ag_l_0);
wp_l_Wl = simplify(R_l_Wl_0*wp_l_0);

% -> Kinematic coupling
p_l_circ = [vg_l_Wl; w_l_Wl];
dp_l_circ_dp_l_bullet = jacobian(p_l_circ, [thp_l; psip_l]);

Tau_l = [0; -tau_l; 0];
I_l = diag([Ixx_l, Iyy_l, Izz_l]);

f_l = [-m_l*eye(3)*ag_l_Wl; ...
       Tau_l - I_l*wp_l_Wl + skew(w_l_Wl)*I_l*w_l_Wl];

W_l.eq = simplify(dp_l_circ_dp_l_bullet.'*f_l); 
W_l.H = simplify(-jacobian(W_l.eq, [thpp_l; psipp_l]));
W_l.Z = simplify(jacobian(W_l.eq, tau_l));
W_l.h = simplify(W_l.eq + W_l.H*[thpp_l; psipp_l] - W_l.Z*tau_l);
