%% TARGET
%  1. Use Simulink to analyze the outputs of a FIR and a IIR filter.
% 
% The parameters are:
%
% * x0[n] = exp(j 2 \pi F0 Ts n} + w0[n]
% * x1[n] = exp(j 2 \pi F1 Ts n} + w1[n]
% * F0 =  1 [kHz]
% * F1 =  2 [kHz]
% * Fs = 16 [kHz];
% 
% *Suggestions*
% 
% FIR coefficients
%   fir_ord = 64; Wn = 5e3 / 8e3;
%   [fir_num] = fir1(fir_ord, Wn, hann(fir_ord+1));
% 
% IIR coefficients
%   iir_ord = 12; Rp = 0.01; Wn = 5e3 / 8e3;
%   [iir_num, iir_den] = cheby1(iir_ord,Rp,Wn);
%

%% Clear
clc;            % Clear the text from the Command Window
clear;          % Remove all variables from the current workspace
close all;      % Close all figures


%% Parameters
F0 =  1e3;
F1 =  2e3;
Fs = 16e3;
Ts = 1/Fs;

%% Exercise
len = 2^12;
n = 0:len-1;

% Signals
w0 = 1e-2 * complex(randn(1,len), randn(1,len));
w1 = 1e-2 * complex(randn(1,len), randn(1,len));
x0 = exp(1i * 2 * pi * F0 * Ts * n) + w0;
x1 = exp(1i * 2 * pi * F1 * Ts * n) + w1;

% FIR Filter
fir_ord = 64; Wn = 5e3 / 8e3;
[fir_num] = fir1(fir_ord, Wn, hann(fir_ord+1));

% IIR Filter
iir_ord = 12; Rp = 0.01; Wn = 5e3 / 8e3;
[iir_num, iir_den] = cheby1(iir_ord,Rp,Wn);

