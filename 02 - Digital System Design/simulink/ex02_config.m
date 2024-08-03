%% TARGET
% Implement a 'Factor-of-3 interpolator' using Simulink:
% * Input  Signal: 
%     x[n] = cos(2*pi*F_N*n);
% * Output Signal: 
%     y[n] = x_u[n] + 1/3 * (x_u[n-2]+x_u[n+2]) + 2/3 * (x_u[n-1]+x_u[n+1])
%
% The parameters are:
% * Fc  =  1 [kHz];
% * Fs  = 16 [kHz];
% * F_N =  Fc/Fs;
%
% *Simulink Configuration - Solver*
% Modeling tab --> Model Settings --> Solver section (on the left)
%  (a) Change the 'type' from 'Variable-Step' to 'Fixed-Step'.
%  (b) Change the 'solver' from 'auto' to 'discrete'.

%% Clear everything
clc;        % 'clc' clears all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
% Frequency of the sine wave
Fc = 1e3;

% Sampling frequency and period
Fs = 16e3;
Ts = 1/Fs;

% Interpolation Factor
L = 3;

