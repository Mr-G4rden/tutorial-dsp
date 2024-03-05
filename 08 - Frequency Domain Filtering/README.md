Frequency Domain Filtering
===

Frequency domain filtering allows to implement FIR filtering (which performs a convolution) using the FFT.

# Exercises

## Exercise 0

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      no      |

Implement the Frequency Domain Filtering between $x[n]$ and $h[n]$ using the Overlap-Add method.

The parameters are:

* $x[n]=cos{2 \\, \pi \\, F_{0} \\, T_s \\, n} + cos{2 \\, \pi \\, F_{1} \\, T_s \\, n}$
* $F_0 = 31.25$
* $F_1 = 312.5$
* $F_s = 1e3$
* $N = 256$
* $M = 129$
* M is the order of the FIR filter with cutoff frequency of $0.25$.

## Exercise 1

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      no      |

Implement the Frequency Domain Filtering between $x[n]$ and $h[n]$ using the Overlap-Add method.

The parameters are:

* $x[n]=cos{2 \\, \pi \\, F_{0} \\, T_s \\, n} + cos{2 \\, \pi \\, F_{1} \\, T_s \\, n}$
* $F_0 = 31.25$
* $F_1 = 312.5$
* $F_s = 1e3$
* $N = 256$
* $M = 129$
* M is the order of the FIR filter with cutoff frequency of $0.25$.

