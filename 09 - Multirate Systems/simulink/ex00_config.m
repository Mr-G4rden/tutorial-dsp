%% TARGET
% Design an interpolator and a polyphase interpolator using Simulink. 
% The signal is:
%   x0[n] = cos(2*pi*Fc*n*Ts) + w[n];
%
% The parameters are:
% * w[n] is a noise
% * Fs = 1 [MHz]
% * Fc = 62.5 [kHz];
% * Interpolation Factor --> L=2;

clc; clear; close all;

%% Simulink Configuration
% Parameters
Fc = 62.5e3;
Fs = 1e6;
Ts = 1/Fs;
L = 2;

% Filter
ord = 64;
Wn = 1/L;
h = fir1(ord,Wn);

% Subfilters coefficients
h_matrix = buffer(h,L);

figure
subplot(2,1,1)
    plot(h_matrix(1,:),'s-')
    grid on
    legend('E_0(z)')
    xlabel('Samples')
    ylabel('Amplitude')
subplot(2,1,2)
    plot(h_matrix(2,:),'s-')
    grid on
    legend('E_1(z)')
    xlabel('Samples')
    ylabel('Amplitude')

figure
fvtool(h,1,'Fs',L*Fs)
