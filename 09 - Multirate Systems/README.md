Multirate Systems
===

Polyphase filters allow efficient implementation of FIR interpolators and decimators, reducing computational complexity.


# Exercises

## Exercise 0

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |     yes      |

Implement a polyphase interpolator.

The parameters are:

* $x[n]=cos{2 \\, \pi \\, F_{c} \\, T_s \\, n} + w[n]$
* $F_c = 62.5e3$
* $F_s = 1e6$
* $L = 2$ is the interpolation factor
