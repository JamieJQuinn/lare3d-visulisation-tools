#!/usr/bin/env python2
"""Plots kernel density estimation of ascii list"""

import sys
from scipy import stats
import numpy as np
import matplotlib.pyplot as plt

outname = sys.argv[1]
fname = sys.argv[2]
fname2 = sys.argv[3]

data_in = np.loadtxt(fname)

data_max = data_in.max()
data_min = data_in.min()

data_in2 = np.loadtxt(fname2)

data_max = max(data_in2.max(), data_max)
data_min = min(data_in2.min(), data_min)

kernel = stats.gaussian_kde(data_in)
kernel2 = stats.gaussian_kde(data_in2)
x = np.linspace(data_min, data_max, 200)

f, ax = plt.subplots(1, figsize=(10, 8))
ax.plot(x, kernel.evaluate(x), label=fname)
ax.plot(x, kernel2.evaluate(x), label=fname2)

plt.legend()
plt.savefig(outname)
