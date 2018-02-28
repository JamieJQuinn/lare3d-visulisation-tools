import sys
import sdf
import matplotlib.pyplot as plt

fname = sys.argv[1]
radius = float(sys.argv[2])
varname = "Fluid_Energy"

try:
    d = sdf.read(fname)
except:
    print 'File "%s" not found' % fname
    sys.exit()

# print d.__dict__

if not hasattr(d, varname):
    print 'Variable "%s" not found in file' % varname
    sys.exit()

var = d.__dict__[varname]

x = var.grid.data[0][:-1]
y = var.grid.data[1][:-1]

for i, slice1 in enumerate(var.data):
    for j, slice2 in enumerate(slice1):
        for k, val in enumerate(slice2):
            if (x[i]**2 + y[j]**2) < radius:
                print val
