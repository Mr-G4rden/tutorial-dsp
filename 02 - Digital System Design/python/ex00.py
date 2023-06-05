## TARGET
# Design a 'Discrete Time Integrator' using Matlab. The input signal is:
# * x[n] = cos(2*pi*F_N*n)
#
# The parameters are:
# * Fc =  1 [kHz]
# * Fs = 16 [kHz]
#
# *Suggestions*
# 1. The equation of the discrete time integrator is: 
#     y[n] = y[n-1] + (Ts/2)*(x[n] + x[n-1])

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

## Parameters
len = 128
Fc  = 1e3
Fs  = 16e3
F_N = Fc/Fs
Ts  = 1/Fs

## Exercise
n = np.linspace(0, len-1, len)   # Index vector of the samples
x = np.cos(2*np.pi*F_N*n)
y = np.zeros(len, dtype='float')

# For loop to implement the discrete time integrator.
# It stats from 1 to len.
for n in range(1,len):
  y[n] = y[n-1] + (Ts/2) * (x[n] + x[n-1]);

## Figures

# Scale the time vector to convert seconds to ms

plt.figure()

plt.subplot(2,1,1)
plt.plot(n, x, 's-', label='x')
plt.grid()
plt.legend(loc='upper right')
plt.title('x')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(2,1,2)
plt.plot(n, y, 's-', label='y')
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.xlabel('Samples')
plt.ylabel('Amplitude')
plt.title('y')

plt.show()
