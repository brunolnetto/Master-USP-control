% @Author: 
% Bruno Peixoto
% Lucas Koleff

close all
clear all
clc

run('params');

if(fa > 20000)
   error('20000 Hz is not enough for LC VSI'); 
   
else
    msg = '20000 Hz is enough! Sample time must be higher than %d Hz';
    msg = sprintf(msg, fa);
    disp(msg);
    
    run('load_sys');
    run('build_ctrb');
    run('build_obsv');
    run('run_plot');
end

