%% TARGET
% Perform the cross-correlation between s[n] and x[n] using Matlab
% * x[n] = sin(2*pi*Fc*n*Ts);
% * w[n] = 0.1*randn(...);
% * s[n] = x[n-100] + w[n];
% 
% The parameters are:
% * Fc =  1 [kHz]
% * Fs = 16 [kHz]
%
% *Suggestions*
%   1) The cross-correlation function is:
%      r_xy = xcorr(x,y);
%

%% Clear everything
clc;        % 'clc' cleras all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
Fs = 1e6;
Fc = Fs/16;
len = 100;

%% Exercise
n = 0:len-1;
ns = 0:(len+100)-1;

% Signal
x = sin(2*pi*(Fc/Fs)*n);
s = [zeros(1,100), x];
s = s + 0.5 * randn(1, length(s));

% Cross-correlation
r1 = xcorr(x,s);
[r2, lag] = xcorr(s,x);

%% Figure
figure
subplot(3,1,1)
    hold on
    plot(n+100,x)
    plot(ns,s)
    hold off
    grid on
    legend('x','s')
    xlabel('Samples')
    xlabel('Amplitude')
subplot(3,1,2)
    plot(r1)
    grid on
    legend('r_1')
    xlabel('Samples')
    xlabel('Amplitude')
subplot(3,1,3)
    plot(lag,r2)
    grid on
    legend('r_2')
    xlabel('Lag')
    xlabel('Amplitude')










 
