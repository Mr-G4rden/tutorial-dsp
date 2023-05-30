%% TARGET
% Implement a 'moving-average system' using Matlab to clean the signal
% distorted by the noise.
% The signal and sampling frequency are saved in 'ex01_data.mat'.

%% Clear everything
clc;        % 'clc' cleras all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
load ex01_data.mat

% Time vector
Ts = 1/Fs;
n = 0:(length(y)-1);
t = n*Ts;

% Coefficients
M = 100;
h = ones(1,M)/M;

% Output
z = conv(y,h);
nz = 0:(length(z)-1);
tz = nz*Ts;

%% Figures
figure;
hold on
plot(t,y)
plot(tz,z)
hold off
grid on
legend('y','z')
xlabel('Time')
ylabel('Amplitude')




