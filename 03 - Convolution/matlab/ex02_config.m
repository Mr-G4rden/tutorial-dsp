%% TARGET
% Clean the signal distorted by the noise designing two Simulink systems:
%
% *System 1*
%   $$y[n]=\frac{1}{M} \sum_{k=0}^{M-1}x[n-k]$$
% 
% *System 2*
%   $$y[n] = y[n-1] + \frac{x[n]}{M} -  \frac{x[n-M]}{M} $$
% 
% The parameters are
% * M=32
% * Load the file ex01_data.mat to extract the sampling frequency and the
%   signal

%% Clear
clc;		% 'clc' cleras all the text from the Command Window
clear;		% 'clear' removes all variables from the current workspace
close all;	% 'close all' deletes all figures whose handles are not hidden.

%% Parameters
% Load the parameters from the mat file
load ex01_data.mat

Ts = 1/Fs;
M = 32;
h = ones(1,M);
