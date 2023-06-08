## TARGET
# Implement a 'moving-average system' using Matlab to clean the signal
# distorted by the noise. The signal is saved in the text file 'data.txt',
# and the sampling frequency is 10 [Hz]. The equation of the moving-average
# system is represented by the equation shown in 'ex01_eqn1.png'.

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

## Parameters
Fs = 10
Ts = 1.0/Fs

## Exercise

# Read the input signal from text file
x = []
with open('data.txt') as f:
    for line in f.readlines():
        x.append(float(line))

# Time vector
n = np.linspace(0, np.size(x)-1, np.size(x))
t = n * Ts

# The moving-average system (represented by the eq. 1 of the exercise 2) 
# can be seen as a convolution between 'x' (input signal) and a vector
# of 'M ones'
M = 100
h = np.ones(M, dtype='float')/M

# Output
y  = np.convolve(x,h)

# Time vector
ny = np.linspace(0, np.size(y)-1, np.size(y))
ty = ny*Ts

## Figures

plt.figure()

plt.plot(n,  x, 's-', label='x')
plt.plot(ny, y, 's-', label='y')
plt.grid()
plt.legend(loc='upper right')
plt.title('Moving-average system')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.show()
