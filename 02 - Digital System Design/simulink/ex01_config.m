%% TARGET
% Implement a 'Factor-of-2 interpolator' using Simulink:
% * Input  Signal: x[n] = cos(2*pi*F_N*n);
%
% The parameters are:
% * Fc  =  1 [kHz];
% * Fs  = 16 [kHz];
% * F_N =  Fc/Fs;
%
% *Suggestions*
% 1. The equation of the Factor-of-2 interpolator is: 
%      y[n] = x_u[n] + 0.5*(x_u[n+1] + x_u[n-1])
%    where x_u[n] is obtained by the oversampling of x
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
L = 2;

