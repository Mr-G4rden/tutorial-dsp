Generation of discrete signals
===

Examples have been written to learn how to generate a discrete sine wave and plot for signal representation. For each exercise, you can find the values of the variables (sampling frequency for example) in the scripts.

## Index

### Matlab

* `ex00.m`
  Discretize the two continuous sine waves and plot their discrete versions using a figure window. The sine waves are:

  * $x_0(t)=sin(2\pi \\, Fc_0 \\, t)$

  * $x_1(t)=sin(2\pi \\, Fc_1 \\, t)$

* `ex01.m`
  Discretize the three continuous sine waves and plot their discrete versions using a figure window. In this script, you'll generate sine waves whose frequency is greater than the Nyquist frequency. 

  * $x_0(t)=sin(+2\pi \\, Fc_0 \\, t)$

  * $x_1(t)=sin(+2\pi \\, Fc_1 \\, t)$
  * $x_2(t)=sin(-2\pi \\, Fc_2 \\, t)$

* `ex02.m`
  Discretize the 2 continuous sine waves and plot their discrete versions using a figure window. In this script, you can analyze the downsampling effects. The sine waves are: 

  * $x_0(t)=sin(2\pi \\, Fc_0 \\, t + \phi_0)$

  * $x_1(t)=sin(2\pi \\, Fc_1 \\, t + \phi_1)$

* `ex03_config_SineWave.m`
  Generate 2 discrete sine waves using Simulink. The sine waves are:

  - $x_0(t)=sin(2\pi \\, Fc_0 \\, t + \phi_0)$
  - $x_1(t)=sin(2\pi \\, Fc_1 \\, t + \phi_1)$

* `ex04_config_ADC.m`

  Use Simulink to generate 1 continuous sine wave affected by random noise and create an ADC to sample it. The sine wave is:

  - $x_0(t)=sin(2\pi \\, Fc_0 \\, t + \phi_0)$



### Python

* `ex00.py`
  It is same Matlab exercise but written in Python.
* `ex01.py`
  It is same Matlab exercise but written in Python.
* `ex02.py`
  It is same Matlab exercise but written in Python.
