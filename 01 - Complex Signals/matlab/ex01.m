%% TARGET
% Perform the upsample and downsample processes of the discrete complex
% wave and draw them. The signal are
% * Signal 0: x[n]   = exp(1i*omegaN*n); omegaN = 1/16;
% * Signal 1: x_u[n] = upsample(x, L);   L = 2;
% * Signal 2: x_d[n] = downsample(x, M); M = 2;


%% Clear everything
clc;        % 'clc' cleras all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
omegaN = 1/16;
L = 2;
M = 2;
len = 64;

%% Exercise
n = 0:len-1;
x = exp(1i*omegaN*n);

% Upsampled signal
x_u = upsample(x,L);
n_u = 0:(length(x_u)-1);

% Downsampled signal
x_d = downsample(x,M);
n_d = 0:(length(x_d)-1);

%% Figures
figure
subplot(3,1,1)
    hold on
    plot(n, real(x), 's-')
    plot(n, imag(x), 's-')
    hold off
    grid on
    legend('Real', 'Imag')
    xlabel('Samples')
    ylabel('Amplitude')
    title('x')
subplot(3,1,2)
    hold on
    plot(n_u, real(x_u), 's-')
    plot(n_u, imag(x_u), 's-')
    hold off
    grid on
    legend('Real', 'Imag')
    xlabel('Samples')
    ylabel('Amplitude')
    title('x_u')
subplot(3,1,3)
    hold on
    plot(n_d, real(x_d), 's-')
    plot(n_d, imag(x_d), 's-')
    hold off
    grid on
    legend('Real', 'Imag')
    xlabel('Samples')
    ylabel('Amplitude')
    title('x_d')



