%% Target
%
% Design a decimator and use it to filter a signal.
% 
% The parameters are:
%
% * x[n] = cos(2*pi*Fc*n*Ts) + w[n];
% * w[n] is the noise
% * Fc = 62.5 [kHz]
% * Fs =  1   [MHz]
% * M  =  4   % Decimator Factor
% 
% *Suggestions*
% 
% FIR coefficients
%   fir_ord = 64;
%   [fir_num] = fir1(fir_ord, Wn, hann(fir_ord+1));
% 
% Filtering
%   y = filter(num,den,x);
%     * x   - input signal
%     * y   - output signal
%     * num - numerator   coefficients
%     * den - denominator coefficients
%


%% Clear
clc;            % Clear the text from the Command Window
clear;          % Remove all variables from the current workspace
close all;      % Close all figures

%% Matlab Exercise
Fc = 62.5e3;
Fs = 1e6;
Ts = 1/Fs;
M = 4;

% Filter
fir_ord = 64;
F_cut = (Fs/2)/M;
Wn = F_cut / (Fs/2);
fir_num = fir1(fir_ord, Wn, hann(fir_ord+1));

