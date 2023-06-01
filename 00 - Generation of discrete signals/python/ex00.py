## TARGET
# Discretize the two continuous sine waves and plot their discrete versions
# using a figure window. The sine waves are:
# * Sine Wave 0: x_0(t)=sin(2*pi*Fc_0*t)
# * Sine Wave 1: x_1(t)=sin(2*pi*Fc_1*t)
# 
# The parameters are:
# * Fc_0 = 100 [Hz]
# * Fc_1 = 800 [Hz]
# * Fs   = 16 [kHz]

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

## Parameters
Fs = 16e3      # Sampling Frequency
Ts = 1/Fs      # Sampling Period
Fc_0 = 100     # Frequency of the 1st sine wave
Fc_1 = 800     # Frequency of the 2nd sine wave

## Exercise
len = 256                        # Number of the samples
n = np.linspace(0, len-1, len)   # Index vector of the samples
t = n*Ts

# Sine wave x0. It is generated using the time vector 't'
x_0 = np.sin(2*np.pi*Fc_0*t)

# Sine wave x1. It is generated using the index vector 'n'
FcN_1 = Fc_1/Fs
x_1 = np.sin(2*np.pi*FcN_1*n)

## Figures

# Scale the time vector to convert seconds to ms
t = t*1e3

plt.figure()

plt.subplot(2,1,1)
plt.plot(t, x_0, 's-', label='$\mathrm{x_0}$')
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.title('Segnale $\mathrm{x_0, \, x_1}$')  # I'm using Latex Equation to write subscripts
plt.xlabel('Time [ms]')
plt.ylabel('Amplitude')

plt.subplot(2,1,2)
plt.plot(n, x_1, 'x-', label='$\mathrm{x_1}$')  # Function to perform the plot
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.show()
