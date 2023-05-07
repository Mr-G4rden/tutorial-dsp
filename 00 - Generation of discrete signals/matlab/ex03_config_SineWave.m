%% TARGET
% Generate 2 discrete sine waves using Simulink. The sine waves are:
% * Sine Wave 0: x_0(t)=sin(2*pi*Fc_0*t + phi_0);
% * Sine Wave 1: x_1(t)=sin(2*pi*Fc_1*t + phi_1);
% 
% The parameters are:
% * Fc_0  = 0.5 [kHz];
% * Fc_1  = 1   [kHz];
% * phi_0 = pi/4;
% * phi_1 = pi/4;
% * Fs    = 10  [kHz];

%% Clear everything
clc;        % 'clc' cleras all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
% You can declare variables in Matlab and use them in Simulink
Fs = 10e3;
Ts = 1/Fs;

Fc_0 = 0.5e3;
Fc_1 =   1e3;
phi_0 = pi/4;
phi_1 = pi/4;

