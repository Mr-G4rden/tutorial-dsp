## TARGET
# Perform the cross-correlation between s[n] and x[n]
# * x[n] = sin(2*pi*Fc*n*Ts)
# * w[n] = 0.25*randn(...)
# * s[n] = x[n-100] + w[n]
# 
# The parameters are:
# * Fc =  1 [kHz]
# * Fs = 16 [kHz]
#
# *Suggestions*
#   1) The cross-correlation function is:
#      r_xy = signal.correlate(x, y)
#

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

# Import the submodule signal of scipy to use the correlation funciton
from scipy import signal

## Parameters
Fs = 1e6
Ts = 1.0/Fs
Fc = Fs/16.0
len = 100

## Exercise

# Index vector of the samples
n  = np.linspace(0, len-1,       len)
ns = np.linspace(0, len+delay-1, len+delay)

# Signal
x = np.sin(2*np.pi*Fc*n*Ts)
z = np.zeros(delay, dtype='float')
s = np.concatenate((z, x), axis=0)
s = s + 0.25 * np.random.randn(s.size)

# Cross-correlation
r1 = signal.correlate(x, s)
r2 = signal.correlate(s, x)
len_r = r2.size

lag1 = np.linspace(-s.size+1, len_r-s.size, len_r)
lag2 = np.linspace(-x.size+1, len_r-x.size, len_r)

plt.figure()

plt.subplot(3,1,1)
plt.plot(n+100, x, 'x-', label='x delayed')
plt.plot(ns,    s, 's-', label='s')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(3,1,2)
plt.plot(lag1, r1, label='r_1')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(3,1,3)
plt.plot(lag2, r2, label='r_2')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Lag')
plt.ylabel('Amplitude')

plt.show()
