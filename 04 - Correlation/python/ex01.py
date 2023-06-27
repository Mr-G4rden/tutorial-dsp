## TARGET
# Perform the cross-correlation between s[n] and x[n] using the convolution
# * x[n] = sin(2*pi*Fc*n*Ts)
# * w[n] is a Gaussian noise
# * s[n] = x[n-n0] + w[n]
# 
# The parameters are:
# * Fs = 1 [MHz]
# * Fc = Fs/16
# * w[n] is a Gaussian noise
#
# *Suggestions*
#   1) The gaussian noise can be generated with the numpy library:
#      noise_1D = np.random.normal(mu, std, size=(10))
#      noise_2D = np.random.normal(mu, std, size=(10,11))

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

## Parameters
Fs = 1e6
Fc = Fs/16.0
Ts = 1.0/Fs
len_x = 16
len_s = 100
n0 = 32
mu  = 0.0
sigma2 = 0.1
sigma  = np.sqrt(sigma2)

## Exercise

# Index vector of the samples
nx = np.linspace(0, len_x-1, len_x)
ns = np.linspace(0, len_s-1, len_s)

# Signal
x = np.sin(2*np.pi*Fc*nx*Ts)
w = np.random.normal(mu, sigma, size=(len_s))
w[n0:n0+len_x] = w[n0:n0+len_x] + x
s = w

# Cross-correlation using the convolution
x_ref = x[::-1]
r1 = np.convolve(x_ref, s)
r2 = np.convolve(s, x_ref)
len_r = r2.size
lag1 = np.linspace(-s.size+1, len_r-s.size, len_r)
lag2 = np.linspace(-x.size+1, len_r-x.size, len_r)

plt.figure()

plt.subplot(3,1,1)
plt.plot(nx+n0, x, 'x-', label='x delayed')
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
