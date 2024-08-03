%% Target
% Implement a polyphase interpolator. 
% The signal is:
%   x0[n] = cos(2*pi*Fc*n*Ts) + w[n];
%
% The parameters are:
% 
% * w[n] is a noise
% * Fs = 1 [MHz]
% * Fc = 62.5 [kHz];
% * Interpolation Factor --> L=2;
%

%% Clear
clc;            % Clear the text from the Command Window
clear;          % Remove all variables from the current workspace
close all;      % Close all figures

%% Exercise

% Parameters
Fc = 62.5e3;
Fs = 1e6;
Ts = 1/Fs;
L = 2;

% Signal
len = 5e3;
w = 0.01*randn(1,len);
x = cos(2*pi*Fc*n*Ts) + w;

% Filter
ord = 64;
Wn = 1/L;
h = fir1(ord,Wn);

% Polyphase components
E_matrix = buffer(h,L);
E_len = E_matrix.size(1)

% Filtering
y = np.zeros((L,len+E_len-1))

%% Figure
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
