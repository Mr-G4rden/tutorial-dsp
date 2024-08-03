%% TARGET
% Use Simulink to generate 1 continuous sine wave affected by random noise
% and create an ADC to sample it. The sine wave is:
% * Sine Wave 0: x_0(t)=sin(2*pi*Fc_0*t + phi_0);
% 
% The parameters are:
% * Fc_0  = 0.5 [kHz];
% * phi_0 = pi/4;
% * Fs    = 4   [kHz];

%% Clear everything
clc;        % 'clc' clears all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
Fs = 4e3;
Ts = 1/Fs;

Fc_0    = 0.5 * 1e3;
phi_0   = 0;
omega_0 = 2*pi*Fc_0;

