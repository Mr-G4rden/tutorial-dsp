## TARGET
# Discretize the 2 continuous sine waves and plot their discrete versions
# using a figure window. In this script, you can analyze the downsampling
# effects. The sine waves are:
# * Sine Wave 0: x_0(t)=sin(2*pi*Fc_0*t + phi_0);
# * Sine Wave 1: x_1(t)=sin(2*pi*Fc_1*t + phi_1);
# 
# The parameters are:
# * Fc_0  = 0.5 [kHz];
# * Fc_1  = 8.5 [kHz];
# * phi_0 = pi/4;
# * phi_1 = pi/4;
# * Fs    = 4   [kHz];

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

## Parameters
Fs    = 4e3;
Ts    = 1/Fs;
Fc_0  =  500;
Fc_1  = 8500;
phi_0 = np.pi/4;
phi_1 = np.pi/4;

## Exercise
len = 100;
n = np.linspace(0, len-1, len);
t = n*Ts

x_0 = np.sin(+2*np.pi*Fc_0*n*Ts);
x_1 = np.sin(+2*np.pi*Fc_1*n*Ts);


## Figures

# Scale the time vector to convert seconds to ms
t = t*1e3;

plt.figure()

plt.subplot(2,1,1)
plt.plot(t, x_0, 's-', label='$\mathrm{x_0}$')
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.title('Segnale $\mathrm{x_0, \, x_1}$')  # I'm using Latex Equation to write subscripts
plt.xlabel('Time [ms]')
plt.ylabel('Amplitude')

plt.subplot(2,1,2)
plt.plot(t, x_1, 'x-', label='$\mathrm{x_1}$')
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.xlabel('Time [ms]')
plt.ylabel('Amplitude')

plt.show()
