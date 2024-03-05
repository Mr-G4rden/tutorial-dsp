## Frequency Domain Filtering - Overlap-Add method
# Implement the Frequency Domain Filtering between $x[n]$ and $h[n]$ using
# the Overlap-Add method.
# 
# *Parameters*
# 
# * $x[n] = cos(2 \pi F_{0} nT_s) + cos(2 \pi F_1 n T_s)$
# * F_0 = 31.25 [Hz]
# * F_1 = 312.5 [Hz]
# * F_s = 1 [kHz]
# * N=256; M = 129
# * h = fir1(M-1,0.25)
#

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

# Since the Matlab-like 'buffer' function does not exist in Python,
# it is defined here
# - x: input signal defined as vector
# - n: Frame length defined as positive integer scalar
# - p: number of overlap samples
def buffer(x, n, p=0):

  # p must be lower than n
  if p>n:
    exit('p is greater than of n.')
  
  # Size of the input vector
  L = np.size(x)

  # Output matrix
  r_len = n
  if (p<0):
    c_len = int(np.ceil(L/(n-p)))
  else:
    c_len = int(np.ceil(L/(n-p))+1)
  y = np.zeros((r_len, c_len), dtype=float)

  # Index used to extract values from x vector
  i = 0

  # Fills the output array
  if (p>0 and p <n):  # Overlap case
    for c in range(0,c_len):
      if c>0:
        for r in range(0, p):
          y[r,c] = y[n-p+r, c-1]
      for r in range(p, r_len):
        if i==np.size(x):
          break
        y[r,c] = x[i]
        i+=1
  elif (p<0):  # Underlap case
    for c in range(0,c_len):
      for r in range(0, r_len):
        if i==np.size(x):
          break
        y[r,c] = x[i]
        i+=1
      i+=-p
  elif (p==0):
    for c in range(0,c_len):
      for r in range(0, r_len):
        if i==np.size(x):
          break
        y[r,c]=x[i]
        i+=1
      if i==np.size(x):
        break
  
  return y
    



# Import the submodule signal of scipy to use the correlation funciton
from scipy import signal

## Parameters
Fc0 = 31.25
Fc1 = 312.5
Fs = 1000
Ts = 1.0/Fs

N = 256    # FFT Points
M = 129    # Length of the filter
Wn = 0.25
h = signal.firwin(numtaps=M,
                  cutoff=Wn, 
                  window='hamming')

# Exercise

len = 1e4
n  = np.arange(start=0, stop=len, dtype=int)
x  = np.cos(2*np.pi*Fc0*n*Ts)
x += np.cos(2*np.pi*Fc1*n*Ts)

# Linear Convolution used as reference
y_L = signal.lfilter(b=h, a=1, x=x)

## Frequency transform and zero padding
# Filtering is done using a N-FFT, and to use it, the signal must be used
# to create many N-length vectors. These vectors are composed of the signal
# samples and a zero-filled vector. In this example, N=64 and a FFT input
# vector is composed of N/2 samples of the signal and N/2 zeros.

# Signal buffering of length N_fft/2
x_b = buffer(x,N/2)

# Zero padding
zero_b = np.zeros((np.size(x_b,0), np.size(x_b,1)), dtype=float)

# Concatenation
x_b = np.vstack([x_b, zero_b])

# FFT performed to each column
X_b_f = np.fft.fft(x_b,N,axis=0)

# FFT of the filter
# If the FFT length is larger than the length of the vector,
# the input vector is padded with zeros
H_f = np.fft.fft(h,N,axis=0)

## Product in the frequecy domain and IFFT

# Product
Y_f = np.zeros((np.size(X_b_f,0),np.size(X_b_f,1)), dtype=complex)
for i in range(0, np.size(Y_f,1)):
  Y_f[:,i] = X_b_f[:,i] * H_f

# IFFT
y_b = np.fft.ifft(Y_f, N, axis=0)
y_b = np.real(y_b)

## Post IFFT processing
# Since N/2 zeros have been added, the IFFT output sequences must be added
# between them as shown in the following figure:
# (https://upload.wikimedia.org/wikipedia/commons/7/77/Depiction_of_overlap-add_algorithm.png)
# 

y = np.zeros(np.size(y_b,0)*np.size(y_b,1), dtype=complex)
for i in range(1, np.size(y_b,1)):
  n_temp_1 = np.arange((i-1)*(N/2), i*N/2, dtype=int)
  n_temp_2 = np.arange(i*N/2, (i+1)*N/2, dtype=int)
  y[n_temp_1] = y[n_temp_1] + y_b[0:N/2,i-1]
  y[n_temp_2] = y[n_temp_2] + y_b[N/2:,i-1]


## Figure

# Frequency vector for the plot
nFFT = 2**12
w, Xf = signal.freqz(b=x,a=np.size(x),
                    worN=nFFT,
                    whole=False)
w, Yf_L = signal.freqz(b=y_L,a=np.size(y_L),
                      worN=nFFT,
                      whole=False)
w, Yf = signal.freqz(b=y,a=np.size(y),
                    worN=nFFT,
                    whole=False)

# Frequency normalization
w = w/np.pi * (Fs/2)

# Mag to dB
Xf = 20*np.log10(np.abs(Xf))
Yf_L = 20*np.log10(np.abs(Yf_L))
Yf = 20*np.log10(np.abs(Yf))

plt.figure()
plt.plot(w, Xf,   '-', label='x')
plt.plot(w, Yf_L, '-', label='Linear Convolution')
plt.plot(w, Yf,   '-', label='Overlap-Add')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [Hz]')
plt.ylabel('Amplitude [dB]')

# Error between the Linear convolution and the frequency filtering
len_err = np.min([np.size(y_L),np.size(y)])
error = y_L[0:len_err] - y[0:len_err]
error = np.abs(error)

plt.figure()
plt.subplot(2,1,1)
plt.plot(y_L, '-', label='Linear Convolution')
plt.plot(y,   '--', label='Overlap-Add')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.xlim(0, len_err)

plt.subplot(2,1,2)
plt.plot(error,   '-', label='Error')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.xlim(0, len_err*0.9)
plt.ylim(0, 1e-14)

plt.show()
