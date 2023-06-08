%% TARGET
% Perform the convolution between x[n] and h[n].
% Use 'fvtool', 'freqz' and 'plot' to see the results.
%
% x[n] is a signal
% * x[n] = cos(2*pi*Fc0*n*Ts) + cos(2*pi*Fc1*n*Ts);
%
% For the signal h[n], I'll give you the samples
% * h = [-0.0013, -0.0054, -0.0124, ...
%        -0.0107,  0.0204,  0.0904, ...
%         0.1784,  0.2406,  0.2406, ...
%         0.1784,  0.0904,  0.0204, ...
%        -0.0107, -0.0124, -0.0054, ...
%        -0.0013];
%
% The parameters are:
% * Fc0  =  31.25 [Hz]
% * Fc1  = 312.50 [Hz];
% * Fs   =   1    [kHz];
%
% *Suggestions*
% 1) The convolution function is shown as follows:
%    y[n] = conv(x,h);

%% Clear everything
clc;        % 'clc' cleras all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
Fc0 = 31.25;
Fc1 = 312.5;
Fs  = 1e3;
Ts  = 1/Fs;
len = 2^10;

%% Exercise

% Index vector
n = 0:(len-1);

% x signal
x = cos(2*pi*Fc0*n*Ts) + cos(2*pi*Fc1*n*Ts); 

% h vector
h = [-0.0013, -0.0054, -0.0124, ...
     -0.0107,  0.0204,  0.0904, ...
      0.1784,  0.2406,  0.2406, ...
      0.1784,  0.0904,  0.0204, ...
     -0.0107, -0.0124, -0.0054, ...
     -0.0013];

% Convolution
y = conv(x,h);

% Index vectors of h and y
nh = 0:(length(h)-1);
ny = 0:(length(y)-1);


%% Figures

% Fvtool
nFFT = 2^10; % Points of the FFT
fvt = fvtool( x, nFFT,...
              h, 1,   ...
              y,nFFT, ...
              'Fs',Fs, ...
              'NumberOfPoints',nFFT);
legend(fvt, 'x', 'h', 'y')

% Freqz
[X_f, ~]    = freqz(x, 1, nFFT, 'whole');
[H_f, ~]    = freqz(h, 1, nFFT, 'whole');
[Y_f, f_ax] = freqz(y, 1, nFFT, 'whole');
X_f = 20*log10(abs(X_f)/nFFT);  % You can use also 'X=mag2db(x)'
H_f = 20*log10(abs(H_f));
Y_f = 20*log10(abs(Y_f)/nFFT);
f_ax = f_ax/(2*pi)*Fs;  % From normalized frequency to Hz
f_ax = f_ax/1e3;        % [Hz] to [kHz]

figure;
subplot(3,2,1)
    plot(n, x)
    legend('x')
    grid on
    xlabel('Samples')
    ylabel('Amplitude')
subplot(3,2,2)
    plot(f_ax, X_f)
    legend('X_f')
    grid on
    xlabel('Frequency [kHz]')
    ylabel('Magnitude [dB]')
subplot(3,2,3)
    plot(nh, h)
    legend('h')
    grid on
    xlabel('Samples')
    ylabel('Amplitude')
subplot(3,2,4)
    plot(f_ax, H_f)
    legend('H_f')
    grid on
    xlabel('Frequency [kHz]')
    ylabel('Magnitude [dB]')
subplot(3,2,5)
    plot(ny, y)
    legend('y')
    grid on
    xlabel('Samples')
    ylabel('Amplitude')
subplot(3,2,6)
    plot(f_ax, Y_f)
    legend('Y_f')
    grid on
    xlabel('Frequency [kHz]')
    ylabel('Magnitude [dB]')




 
