## TARGET
# Discretize the 3 continuous sine waves and plot their discrete versions
# using a figure window. In this script, you'll generate sine waves whose
# frequency is greater than the Nyquist frequency. 
# The sine waves are:
# * Sine Wave 0: x_0(t)=sin(+2*pi*Fc_0*t);
# * Sine Wave 1: x_1(t)=sin(+2*pi*Fc_1*t);
# * Sine Wave 2: x_2(t)=sin(-2*pi*Fc_2*t); 
# 
# The parameters are:
# * Fc_0 = 0.5 [kHz];
# * Fc_1 = 3.5 [kHz];
# * Fc_2 = 3.5 [kHz];
# * Fs   = 4   [kHz];

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

## Parameters
Fs = 4e3;
Ts = 1/Fs;
Fc_0 =  500;
Fc_1 = 3500;
Fc_2 = 3500;


## Exercise
len = 100;
n = np.linspace(0, len-1, len);
t = n*Ts;

x_0 = np.sin(+2*np.pi*Fc_0*n*Ts);
x_1 = np.sin(+2*np.pi*Fc_1*n*Ts);
x_2 = np.sin(-2*np.pi*Fc_2*n*Ts);


## Figures

# Scale the time vector to convert seconds to ms
t = t*1e3;

plt.figure()

plt.subplot(3,1,1)
plt.plot(t, x_0, 's-', label='$\mathrm{x_0}$')
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.title('Segnale $\mathrm{x_0, \, x_1, \, x_2}$')  # I'm using Latex Equation to write subscripts
plt.xlabel('Time [ms]')
plt.ylabel('Amplitude')

plt.subplot(3,1,2)
plt.plot(t, x_1, 'x-', label='$\mathrm{x_1}$')
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.xlabel('Time [ms]')
plt.ylabel('Amplitude')

plt.subplot(3,1,3)
plt.plot(t, x_2, 'o-', label='$\mathrm{x_2}$')
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.xlabel('Time [ms]')
plt.ylabel('Amplitude')

plt.show()
