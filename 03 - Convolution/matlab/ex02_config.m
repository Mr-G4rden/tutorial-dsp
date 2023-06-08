%% TARGET
% Clean the signal distorted by the noise designing two Simulink systems:
%
% *System 1*
%   See 'ex02_eqn1.png'
% 
% *System 2*
%   See 'ex02_eqn2.png'
% 
% The parameters are
% * Fs=10
% * M=32
% * The signal is saved in the text file 'data.txt'

%% Clear
clc;        % 'clc' cleras all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
Fs = 10;
Ts = 1/Fs;
M = 32;

%% Exercise

% Read the input signal from text file
fileID = fopen('data.txt','r');  % Open the file for reading
formatSpec = '%f';                % Define the format of the data to read
x = fscanf(fileID,formatSpec);    % Read the file data
fclose(fileID);                   % Close the file

% The moving-average system (represented by the eq. 1 of the exercise 2)
% can be seen as a convolution between 'x' (input signal) and a vector of
% 'M ones'
h = ones(1,M);
