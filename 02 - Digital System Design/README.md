Digital System Design
===

These exercises show some digital system designs for DSP.

# Exercises

## Exercise 0

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      no      |

Design a Discrete Time Integrator.

- $x[n] = cos(2 \\, \pi \\, F_N \\, n)$
- $y[n] = y[n−1] + (Ts/2) \cdot (x[n] + x[n−1])$

## Exercise 1

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     no     |     yes    |      yes     |

Design a factor-of-2 interpolator.

- $x[n] = cos(2 \\, \pi \\, F_N \\, n)$
- $y[n] = x_u[n] + 1/2 \cdot (x_u[n-1]+x_u[n+1])$

## Exercise 2

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     no     |     yes    |      yes     |

Design a factor-of-3 interpolator.

- $x[n] = cos(2 \\, \pi \\, F_N \\, n)$
- $y[n] = x_u[n] + 1/3 \cdot (x_u[n-2]+x_u[n+2]) + 2/3 \cdot (x_u[n-1]+x_u[n+1])$
