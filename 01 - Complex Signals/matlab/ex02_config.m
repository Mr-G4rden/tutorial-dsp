%% TARGET
% Use Simulink to generate the signal y[n]:
% * Output Signal: y[n] = a1*x[n] + a2*x[n-1] + a3*x[n-2] + a4*x[n-3]
% * Input  Signal: x[n] = exp(1i*2*pi*Fc_0*Ts*n) + exp(1i*2*pi*Fc_1*Ts*n);
%
% The parameters are:
% * a1 = 0.5
% * a2 = -1
% * a3 = 0.5
% * a4 = -1
% * Fc_0 =  1 [kHz];
% * Fc_1 =  4 [kHz];
% * Fs   = 16 [kHz];
%
% *Simulink Configuration - Solver*
% Modeling tab --> Model Settings --> Solver section (on the left)
%  (a) Change the 'type' from 'Variable-Step' to 'Fixed-Step'.
%  (b) Change the 'solver' from 'auto' to 'discrete'.

%% Clear everything
clc;        % 'clc' cleras all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
% System parameters
a1 = 0.5;
a2 = -1;
a3 = 0.5;
a4 = -1;

% Complex wave frequencies
Fc_0 =  1e3;
Fc_1 =  4e3;

% Sampling frequency and period
Fs = 16e3;
Ts = 1/Fs;

