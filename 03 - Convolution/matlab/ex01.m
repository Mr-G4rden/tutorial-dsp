%% TARGET
% Implement a 'moving-average system' using Matlab to clean the signal
% distorted by the noise. The signal is saved in the text file 'data.txt',
% and the sampling frequency is 10 [Hz]. The equation of the moving-average
% system is represented by the equation shown in 'ex01_eqn1.png'.

%% Clear everything
clc;        % 'clc' cleras all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%%  Parameters
Fs = 10;
Ts = 1/Fs;

%% Exercise

% Read the input signal from text file
fileID = fopen('data.txt','r');  % Open the file for reading
formatSpec = '%f';                % Define the format of the data to read
x = fscanf(fileID,formatSpec);    % Read the file data
fclose(fileID);                   % Close the file

% Time vector
n = 0:(length(x)-1);
t = n*Ts;

% The moving-average system (represented by the eq. 1 of the exercise 2) 
% can be seen as a convolution between 'x' (input signal) and a vector
% of 'M ones'
M = 100;
h = ones(1,M)/M;

% Output
y = conv(x,h);
ny = 0:(length(y)-1);
ty = ny*Ts;

%% Figures
figure;
hold on
plot(t,x)
plot(ty,y)
hold off
grid on
legend('y','z')
xlabel('Time')
ylabel('Amplitude')




