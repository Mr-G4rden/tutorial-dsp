%% Target
%
% Design a fractional rate converter
% 
% The parameters are:
%
% * x[n] = cos(2*pi*Fc*n*Ts) + w[n];
% * w[n] is the noise
% * Fc = 62.5 [kHz]
% * F  =  1   [MHz]
% * L  =  5   % Interpolator Factor
% * M  =  3   % Decimator Factor
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
Fc = 125e3;
Fs = 1e6;
Ts = 1/Fs;
L = 5;
M = 3;

% Filter
fir_ord = 64;
F_cut = 500e3;
Wn = F_cut / (Fs*L/2);
fir_num = fir1(fir_ord, Wn, hann(fir_ord+1));
