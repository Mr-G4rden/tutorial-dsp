%% TARGET
% Perform the cross-correlation between s[n] and x[n] using Simulink
% * x[n] = sin(2*pi*Fc*n*Ts);
% * w[n] = 0.1*randn(...);
% * s[n] = x[n-n0] + w[n];
% 
% The parameters are:
% * Fs = 1 [MHz]
% * Fc = Fs/16
%
% *Suggestions*
% Simulink Block to implement a gaussian noise
%  Step 1. Select the 'Random Source' block.
%  Step 2. Open the configuration panel of the block.
%  Step 3. 'Source Type' --> 'Gaussian '
%  Step 4. Mean = 0;  Variance=0.25
%
% TARGET: implement the cross-correlation between s[n] and x[n] using Simulink
% s[n] = x[n-n0] + w[n];
% Fs = 1 [MHz]; Fc = Fs/16; 
% w[n] = 0.5*randn(1,length(x));
% x[n] = sin(2*pi*Fc*n*Ts);
%

%% Clear everything
clc;        % 'clc' cleras all the text from the Command Window
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


