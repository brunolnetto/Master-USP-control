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

% -- Front --
syms th_f psi_f real;
syms thp_f psip_f real;
syms thpp_f psipp_f real;
syms m_f;
syms Ixx_f Iyy_f Izz_f real;

% Dimensional
syms D_r D_l D_f L;

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
W_r.H = -simplify(jacobian(W_r.eq, [thpp_r; psipp_r]));
W_r.Z = simplify(jacobian(W_r.eq, tau_r));
W_r.h = -simplify(W_r.eq + W_r.H*[thpp_r; psipp_r] - W_r.Z*tau_r);

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

Wheel_l.eq = simplify(dp_l_circ_dp_l_bullet.'*f_l); 
Wheel_l.H = -simplify(jacobian(W_l.eq, [thpp_l; psipp_l]));
Wheel_l.Z = simplify(jacobian(W_l.eq, tau_l));
Wheel_l.h = -simplify(W_l.eq + W_l.H*[thpp_l; psipp_l] - W_l.Z*tau_l);

% Front wheel
% -> Rotations
R_f_th = rot3d(th_l, [0; 0; 1]);
R_f_psi = rot3d(psi_l, [0; -1; 0]);

R_f_0_Wl = R_f_th*R_f_psi;
R_f_Wl_0 = R_f_0_Wf.';

% -> Angular and linear velocities
w_f_0 = omega(R_f_0_Wf, [th_f; psi_f], [thp_f; psip_f]);
vg_f_0 = [D*psip_f*cos(th_f)/2; D*psip_f*sin(th_f)/2; 0];

vg_f_Wf = simplify(R_l_Wl_0*vg_l_0);
w_f_Wf = simplify(R_f_Wf_0*w_f_0);

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

Wheel_l.eq = simplify(dp_l_circ_dp_l_bullet.'*f_l); 
Wheel_l.H = -simplify(jacobian(W_l.eq, [thpp_l; psipp_l]));
Wheel_l.Z = simplify(jacobian(W_l.eq, tau_l));
Wheel_l.h = -simplify(W_l.eq + W_l.H*[thpp_l; psipp_l] - W_l.Z*tau_l);

% Chassi
syms m_c real;
syms x y gamma delta real;
syms xp yp gammap  real;
syms xpp ypp gammapp real;

I_c = sym('I_%d%d', [3, 3]);

vg_c_0 = [xp; yp; 0];
ag_c_0 = [xpp; ypp; 0];

R_c = simplify(rot3d(gamma, [0; 0; 1])*rot3d(delta, [0; 1; 0]));

w_c_0 = omega(R_c, gamma, gammap);
wp_c_0 = dvecdt(w_c, [gamma; gammap], [gammap; gammapp]);

f_c = [-m_c*ag_c_0; -I_c*wp_c - skew(w_c)*I_c*w_c];
dp_c_circ_dp_c_bullet = jacobian([vg_c_0; w_c_0], [xp; yp; gammap]);

Chassi.eq = dp_c_circ_dp_c_bullet.'*f_c;
Chassi.H = -simplify(jacobian(Chassi.eq, [xpp; ypp; gammapp]));
Chassi.h = -simplify(Chassi.eq + Chassi.H*[xpp; ypp; gammapp]);
Chassi.Z = zeros(3, 1);


