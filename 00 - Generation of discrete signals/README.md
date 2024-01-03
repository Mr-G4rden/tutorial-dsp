Generation of discrete signals
===

Examples help you learn how to generate a discrete sine wave and draw a plot to represent a signal. For each exercise, you can find the values of the variables (for example the sampling rate) in the scripts.

# Exercises

## Exercise 0

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      no      |

Discretize the two continuous sine waves and plot their discrete versions using a figure window. The sine waves are:

- $x_0(t)=sin(2\pi \\, Fc_0 \\, t)$
- $x_1(t)=sin(2\pi \\, Fc_1 \\, t)$

## Exercise 1

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      no      |

Discretize the three continuous sine waves and plot their discrete versions using a figure window. In this script, you'll generate sine waves whose frequency is greater than the Nyquist frequency.

- $x_0(t)=sin(+2\pi \\, Fc_0 \\, t)$
- $x_1(t)=sin(+2\pi \\, Fc_1 \\, t)$
- $x_2(t)=sin(-2\pi \\, Fc_2 \\, t)$

## Exercise 2

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      no      |

Discretize the 2 continuous sine waves and plot their discrete versions using a figure window. In this script, you can analyze the downsampling effects. The sine waves are:

- $x_0(t)=sin(2\pi \\, Fc_0 \\, t + \phi_0)$
- $x_1(t)=sin(2\pi \\, Fc_1 \\, t + \phi_1)$

## Exercise 3

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     no     |     no     |     yes      |

Generate 2 discrete sine waves using Simulink. The sine waves are:

- $x_0(t)=sin(2\pi \\, Fc_0 \\, t + \phi_0)$
- $x_1(t)=sin(2\pi \\, Fc_1 \\, t + \phi_1)$

## Exercise 4

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     no     |     no     |     yes      |

Use Simulink to generate 1 continuous sine wave affected by random noise and create an ADC to sample it. The sine wave is:

- $x_0(t)=sin(2\pi \\, Fc_0 \\, t + \phi_0)$
