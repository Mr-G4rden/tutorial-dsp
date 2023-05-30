%% Target
%
% * Use Matlab to design a fractional rate converter
% * Use Simulink to design a fractional rate converter
% 
% The parameters are:
%
% * x[n] = cos(2*pi*Fc*n*Ts) + w[n];
% * w[n] is the noise
% * Fc = 62.5 [kHz]
% * F  =  1   [MHz]
% * L  =  5   % Interpolator Factor
% * M  =  3   % Decimator Factor
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

%% Clear
clc;            % Clear the text from the Command Window
clear;          % Remove all variables from the current workspace
close all;      % Close all figures



%% Matlab Exercise
Fc = 125e3;
Fs = 1e6;
Ts = 1/Fs;
len = 128;
L = 5;
M = 3;
n = 0:len-1;

% Signal
w = 0.1*randn(1,len);
x = cos(2*pi*Fc*n*Ts) + w;

% Filter
fir_ord = 64;
F_cut = 500e3;
Wn = F_cut / (Fs*L/2);
fir_num = fir1(fir_ord, Wn, hann(fir_ord+1));

% Upsampler
xu = upsample(x,L);
nu = 0:length(xu)-1;

% Interpolation
y = L*filter(fir_num, 1, xu);

% Downsampler
y = downsample(y,M);
ny = 0:length(y)-1;

% Time vectors
tx  = n*Ts / 1e6;
ty  = ny*(Ts/L*M) / 1e6;

figure
hold on
plot(tx ,  x, 's-')
plot(ty ,  y, 'x-')
hold off
legend('x','y')
xlabel('Time \mus')
ylabel('Amplitude')

fvtool(x,  1, 'Fs',Fs)
fvtool(y,  1, 'Fs',Fs*L)
