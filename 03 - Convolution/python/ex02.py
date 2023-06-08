## TARGET
# Clean the signal distorted by the noise designing two Simulink systems:
#
# *System 1*
#   See 'ex02_eqn1.png'
# 
# *System 2*
#   See 'ex02_eqn2.png'
# 
# The parameters are
# * Fs=10
# * M=32
# * The signal is saved in the text file 'data.txt'

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

## Parameters
Fs = 10
Ts = 1.0/Fs
M  = 32

# Read the input signal from text file
x = []
with open('data.txt') as f:
    for line in f.readlines():
        x.append(float(line))

# The moving-average system (represented by the eq. 1) 
# can be seen as a convolution between 'x' (input signal) and a vector
# of 'M ones'
h = np.ones(M, dtype='float')/M

# Output of the system 1
y1 = np.convolve(x,h)

# Output of the system 2
y2 = np.zeros(np.size(x)+np.size(h), dtype='float')
for i in range(1,np.size(x)):
   if (i>M):
      x_tmp = x[i-M]
   else:
      x_tmp = 0.0
   y2[i] = y2[i-1] + x[i]/M - x_tmp/M

# Time vectors
ny1 = np.linspace(0, np.size(y1)-1, np.size(y1))
ny2 = np.linspace(0, np.size(y2)-1, np.size(y2))
ty1 = ny1*Ts
ty2 = ny2*Ts

## Figures

plt.figure()

plt.plot(ny1, y1, 's-',  label='y_1')
plt.plot(ny2, y2, 'x--', label='y_2')
plt.grid()
plt.legend(loc='upper right')
plt.title('Moving-average system - Comparison')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.show()
