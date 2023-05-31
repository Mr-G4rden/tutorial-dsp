%% TARGET
% Plot the two complex signals represented in the 
% discrete time domain. The signals are:
% * Signal 0: y[n]=exp(+1i*omegaN*n);
% * Signal 1: w[n]=exp(-1i*omegaN*n);
% 
% The parameters are:
% * omegaN = 0.3;  
%
% *Suggestions*
% 1) How to extract the real component from a complex signal
%    a = real(c);        % a = Re{x}
% 2) How to extract the imag component from a complex signal
%    b = imag(c);        % b = Im{x}
% 3) How to create a complex signal given its components
%    c = complex(a, b);  % c = a + jb

%% Clear everything
clc;        % 'clc' cleras all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
omegaN = 0.3;
len = 32;

%% Exercise
n = 0:(len-1);
y = exp(+1i*omegaN*n);
w = exp(-1i*omegaN*n);

%% Figures
figure
subplot(2,1,1)
    hold on
    plot(n, real(y))
    plot(n, imag(y))
    hold off
    grid on
    legend('Real', 'Imag')
    xlabel('Samples')
    ylabel('Amplitude')
    title('y')
subplot(2,1,2)
    hold on
    plot(n, real(w))
    plot(n, imag(w))
    hold off
    grid on
    legend('Real', 'Imag')
    xlabel('Samples')
    ylabel('Amplitude')
    title('w')


%% Print on the Command Window




