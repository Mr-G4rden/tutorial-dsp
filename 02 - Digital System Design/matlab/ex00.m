%% TARGET
% Design a 'Discrete Time Integrator' using Matlab. The input signal is:
% * x[n] = cos(2*pi*F_N*n)
%
% The parameters are:
% * Fc =  1 [kHz]
% * Fs = 16 [kHz]
%
% *Suggestions*
% 1. The equation of the discrete time integrator is: 
%     y[n] = y[n-1] + (Ts/2)*(x[n] + x[n-1])

%% Clear everything
clc;        % 'clc' cleras all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
len = 128;
Fc  = 1e3;
Fs  = 16e3;
F_N = Fc/Fs;
Ts  = 1/Fs;

%% Exercise
n   = 0:len-1;
x = cos(2*pi*F_N*n);
y = zeros(1,len);

for i=2:len
  y(i) = y(i-1) + (Ts/2) * (x(i) + x(i-1));
end

%% Figure
figure;
subplot(2,1,1)
    plot(n,x)
    grid on
    legend('x')
subplot(2,1,2)
    plot(n,y)
    grid on
    legend('y')

