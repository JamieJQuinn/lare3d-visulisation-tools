#!/usr/bin/env python3
"""To be used only with visit python interface, this is a plotting script"""

import sys
import re

def save_fig(data_fname, fig_fname, varname):
    """Plot and save figure"""
    OpenDatabase("localhost:"+data_fname)

    DeleteAllPlots()

    AddPlot("Pseudocolor", varname, 1, 0)

    AddOperator("Slice", 0)

    # SliceAtts = SliceAttributes()
    # SliceAtts.originType = SliceAtts.Intercept  # Point, Intercept, Percent, Zone, Node
    # SliceAtts.originPoint = (0, 0, 0)
    # SliceAtts.originIntercept = 0
    # SliceAtts.originPercent = 0
    # SliceAtts.originZone = 0
    # SliceAtts.originNode = 0
    # SliceAtts.normal = (0, 0, 1)
    # SliceAtts.axisType = SliceAtts.ZAxis  # XAxis, YAxis, ZAxis, Arbitrary, ThetaPhi
    # SliceAtts.upAxis = (0, 1, 0)
    # SliceAtts.project2d = 1
    # SliceAtts.interactive = 1
    # SliceAtts.flip = 0
    # SliceAtts.originZoneDomain = 0
    # SliceAtts.originNodeDomain = 0
    # SliceAtts.meshName = "Grid/Grid"
    # SliceAtts.theta = 0
    # SliceAtts.phi = 90
    # SetOperatorOptions(SliceAtts, 0)

    DrawPlots()

    swatts = SaveWindowAttributes()
    swatts.family = 0
    swatts.format = swatts.PNG
    swatts.width = 1024
    swatts.height = 1024
    swatts.fileName = fig_fname
    SetSaveWindowAttributes(swatts)

    SaveWindow()

def main():
    """Main"""
    # Get files to generate figs from
    with open("filename_list", 'r') as filep:
        filenames = filep.read().split()

    variables = [
        "Bmag",
        "Vmag",
        "Fluid/Rho",
        "Fluid/Energy",
        "Ohmic Heating"
    ]

    for filename in filenames:
        print "Opening " + filename

        # scrape info from filenames
        visc_exp, resist_exp, visc_mode = re.search('v-(\d)r-(\d)-(switching|isotropic)/', filename).groups()
        t_step = re.search('/(\d+).sdf', filename).groups()[0]

        for variable in variables:
            # Form output filenames
            if visc_mode == "switching":
                fig_fname = variable.split("/")[-1] + "_switching_" + t_step
            else:
                fig_fname = variable.split("/")[-1] + "_isotropic_" + t_step

            if not os.path.isfile(fig_fname+".png"):
                print("Plotting " + fig_fname)
                save_fig(filename, fig_fname, variable)

    sys.exit()

main()
