Digital Filter Banks
===

Analysis Filter Bank (AFB) example.


# Exercises

## Exercise 0

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     no     |     no     |     yes      |

Implement a Two-Channel Filter Bank using the polyphase decomposition.

The parameters are:

* $x[n]=A_{0} \\, exp{+i \\, 2 \\, \pi \\, F_{c0} \\, n \\, T_s} + A_{1} \\, exp{+i \\, 2 \\, \pi \\, F_{c1} \\, n \\, T_s} + w[n]$
* $F_s = 1e6$
* $F_{c0} = +1/8 \\, F_s$
* $F_{c1} = -3/8 \\, F_s$
* $A_{0} = 1$
* $A_{1} = 1/4$
* $M = 2$ is the parallel factor
* order of the filter $64$
* normalized cutoff frequency $1/M$
* hann windowing to design the filter