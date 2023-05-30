%% Target
%
% * Use Matlab to design a decimator
% * Use Simulink to design a decimator
% 
% The parameters are:
%
% * x[n] = cos(2*pi*Fc*n*Ts) + w[n];
% * w[n] is the noise
% * Fc = 62.5 [kHz]
% * Fs =  1   [MHz]
% * M  =  4   % Decimator Factor
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
% Downsampling
%   xd = downsample(x, M);
% 

%% Clear
clc;            % Clear the text from the Command Window
clear;          % Remove all variables from the current workspace
close all;      % Close all figures




%% Matlab Exercise
Fc = 62.5e3;
Fs = 1e6;
Ts = 1/Fs;
len = 128;
M = 4;
n = 0:len-1;

% Signal
w = 0.1*randn(1,len);
x = cos(2*pi*Fc*n*Ts) + w;

% Filter
fir_ord = 64;
F_cut = (Fs/2)/M;
Wn = F_cut / (Fs/2);
fir_num = fir1(fir_ord, Wn, hann(fir_ord+1));

% Filtering
xd = filter(fir_num, 1, x);
nd = 0:length(xd)-1;

% Interpolation
y = downsample(xd,M);
ny = 0:length(y)-1;

% Time vectors
tx  = n*Ts  / 1e6;
txd = nd*Ts / 1e6;
ty  = ny*(Ts*M) / 1e6;

figure
hold on
plot(tx ,  x, 's-')
plot(txd, xd, '.-')
plot(ty ,  y, 'x-')
hold off
legend('x','x_d','y')
xlabel('Time \mus')
ylabel('Amplitude')

fvtool(x,  1, 'Fs',Fs)
fvtool(xd, 1, fir_num, 1, 'Fs',Fs)
fvtool(y,  1, 'Fs',Fs/M)
