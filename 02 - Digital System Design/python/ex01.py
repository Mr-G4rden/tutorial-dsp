## TARGET
# Implement a 'Factor-of-2 interpolator'. The input signal is:
# * x[n] = cos(2*pi*F_N*n)
#
# The parameters are:
# * Fc =  1 [kHz]
# * Fs = 16 [kHz]
#
# *Suggestions*
# 1. The equation of the Factor-of-2 interpolator is: 
#      y[n] = x_u[n] + 0.5*(x_u[n+1] + x_u[n-1])
#    where x_u[n] is obtained by the oversampling of x

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

# Upsample
# Since we want to develop an interpolation, we need to upsample the signal
L = 2 # Interpolation factor
x_u = np.zeros(L*len, dtype='float')
x_u[::L] = x

# Factor-of-2 interpolator
# 'y[n] = x[n] + 0.5*(x[n+1] + x[n-1])' can be written as:
#    y[n-1] = x[n-1] + 0.5*(x[n] + x[n-2])
#           = convolution of [0.5, 1.0, 0.5] and x_u
h = np.array([0.5, 1.0, 0.5])
y = np.convolve(h, x_u)

# To avoid the convolution, we can write the following code
y = np.zeros(L*len, dtype='float')
for i in range(1,np.size(x_u)-1):
  y[i] = x_u[i] + 0.5 * (x_u[i+1] + x_u[i-1])

# Index vector of y
ny = np.linspace(0, np.size(y)-1, np.size(y))

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
plt.plot(ny, y, 's-', label='y')
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.xlabel('Samples')
plt.ylabel('Amplitude')
plt.title('y')

plt.show()
