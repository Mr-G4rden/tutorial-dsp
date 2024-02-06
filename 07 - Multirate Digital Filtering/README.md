Multirate Digital Filtering
===

Multirate digital filtering is based on the use of multirate filters.
The exercises show how to design and use a multirate filter based on interpolation and decimation.

# Exercises

## Exercise 0

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      yes     |

Design an interpolator and use it to filter a signal.

The parameters are:

* $x[n]=cos{2 \\, \pi \\, F_c \\, T_s \\, n} + w[n]$
* $F_c = 125e3$
* $F_s = 1e6$
* $L = 4$

## Exercise 1

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      yes     |

Design a decimator and use it to filter a signal.

The parameters are:

* $x[n]=cos{2 \\, \pi \\, F_c \\, T_s \\, n} + w[n]$
* $F_c = 62.5e3$
* $F_s = 1e6$
* $M = 4$

## Exercise 2

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      yes     |

Design a fractional rate converter and use it to filter a signal.

The parameters are:

* $x[n]=cos{2 \\, \pi \\, F_c \\, T_s \\, n} + w[n]$
* $F_c = 62.5e3$
* $F_s = 1e6$
* $L = 5$
* $M = 3$
