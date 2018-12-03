clear all; 
close all; 
clc;

t0 = tic;

% Closed chain
mechanism = load_mechanism('num');

% Implicit attributes for 
mechanism.eqdyn = orsino_eqdyn(mechanism);

toc(t0)

