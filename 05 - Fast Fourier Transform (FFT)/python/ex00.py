## TARGET
# Plot the frequency response of the signal $x[n]$ by using the FFT
# function.
# 
# The parameters are:
# * x[n] = cos(2*pi*Fc*n*Ts) + k*w[n]
# * F_0 = 1 [kHz]
# * F_s = 16 [kHz];
# * k=[1e-8, 1e-6, 1e-4, 1e-2, 1e-1];
#
# *Suggestions*
#   1) FFT Function (https://it.mathworks.com/help/matlab/ref/fft.html)
# 
#       Y = fft(X) computes the discrete Fourier transform (DFT) of X using
#       a fast Fourier transform (FFT) algorithm.
#       * If X is a vector, then fft(X) returns the Fourier transform of
#         the vector.
#       * If X is a matrix, then fft(X) treats the columns of X as vectors
#         and returns
#         the Fourier transform of each column.
#       * If X is a multidimensional array, then fft(X) treats the values
#         along the first array dimension whose size does not equal 1 as
#         vectors and returns the Fourier transform of each vector.
#
# 

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

# Import the submodule signal of scipy to use the correlation funciton
from scipy import signal

## Parameters
Fs = 16e3
Ts = 1.0/Fs
F0 = 1e3
len = 1024.0
k = np.array([1e-8, 1e-6, 1e-4, 1e-2, 1e-1])

## Exercise

# Index vector of the samples
n  = np.linspace(0, len-1, len)

# Signal
x = np.cos(2*np.pi*F0*n*Ts)
mu = 0
sigma = 1
w = np.random.normal(mu, sigma, size=(len))

# Initialization of the matrix X. The latter contains the signal x plus
# noise with different values of k.
X = np.zeros((len, np.size(k)), dtype='float') # Size: (Row,Col) = (1024,5)

# Create the array
for i in range(0,np.size(k)):
  X[:,i] = x + k[i] * w

# When the fft function processes an array, fft is evaluated for each
# column.
Xf = np.zeros((len, np.size(k)), dtype='float') # Size: (Row,Col) = (1024,5)
for i in range(0,np.size(k)):
  Xf_tmp = np.fft.fft(X[:,i]) / np.size(X[:,i])   
  Xf_abs = np.abs(Xf_tmp)/len
  Xf_abs_dB = 20*np.log10(Xf_abs)
  Xf[:,i] = Xf_abs_dB

## Figure

# Frequency vector for the plot
f_ax = np.linspace(0, len-1, len)/len * Fs

plt.figure()

plt.plot(f_ax, Xf[:,0], label='Xf_0')
plt.plot(f_ax, Xf[:,1], label='Xf_1')
plt.plot(f_ax, Xf[:,2], label='Xf_2')
plt.plot(f_ax, Xf[:,3], label='Xf_3')
plt.plot(f_ax, Xf[:,4], label='Xf_4')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [Hz]')
plt.ylabel('Amplitude [dB]')

plt.show()
