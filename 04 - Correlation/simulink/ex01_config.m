%% TARGET
% Perform the cross-correlation between s[n] and x[n] using Simulink
% * x[n] = sin(2*pi*Fc*n*Ts);
% * w[n] is a Gaussian noise;
% * s[n] = x[n-n0] + w[n];
% 
% The parameters are:
% * Fs = 1 [MHz]
% * Fc = Fs/16
%
% *Suggestions*
% How to implement a Gaussian noise
%  Step 1. Select the 'Random Source' block from the DSP System Toolbox.
%  Step 2. Open the configuration panel of the block.
%  Step 3. 'Source Type' --> 'Gaussian'
%  Step 4. Mean = 0;  Variance=0.1
%

%% Clear everything
clc;        % 'clc' clears all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.


%% Parameters
Fs = 1e6;
Fc = Fs/16;
Ts = 1/Fs;
len = 16;

% Reference signal generation. I want to perform the cross-correlation by
% using a convolution
n = 0:len-1;
x = sin(2*pi*(Fc/Fs)*n);
x = flip(x);


