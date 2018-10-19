

K_p = 18;
T_i = 0.42;
T_d = 0.05;

K = K_p*T_d;
b = 1/T_d;
c = 1/(T_i*T_d);

Ts = 0.01;

sigma = 0.01;

PID = K*tf([1, b, c], [1 0]);

Gz = backward(PID, Ts);


