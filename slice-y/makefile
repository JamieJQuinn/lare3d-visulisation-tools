TIMESTEPS=$(shell echo {00..50})
MONTAGE_OUTPUT=$(addsuffix .png,$(addprefix montage/,$(TIMESTEPS)))

all: raw montage

.PHONY: raw
raw:
	cd ./raw;\
	rm -f $(shell find . -size 0);\
	../fill_filelist.sh;\
	visit -nowin -cli -s ../plot.py

.PHONY: montage
montage: $(MONTAGE_OUTPUT)

montage/%.png: raw/Bmag_isotropic_00%.png raw/Vmag_isotropic_00%.png raw/Rho_isotropic_00%.png raw/Energy_isotropic_00%.png raw/Bmag_switching_00%.png raw/Vmag_switching_00%.png raw/Rho_switching_00%.png raw/Energy_switching_00%.png
	$(eval timestep=$(basename $(notdir $@)))
	montage \
		-label 'Bmag Isotropic' raw/Bmag_isotropic_00$(timestep).png \
		-label 'Vmag Isotropic' raw/Vmag_isotropic_00$(timestep).png \
		-label 'Rho Isotropic' raw/Rho_isotropic_00$(timestep).png \
		-label 'Energy Isotropic' raw/Energy_isotropic_00$(timestep).png \
		-label 'Bmag Switching' raw/Bmag_switching_00$(timestep).png \
		-label 'Vmag Switching' raw/Vmag_switching_00$(timestep).png \
		-label 'Rho Switching' raw/Rho_switching_00$(timestep).png \
		-label 'Energy Switching' raw/Energy_switching_00$(timestep).png \
		-geometry 1024x1024 $@

.PHONY: clean
clean:
	rm -f raw/*.png raw/visitlog.py raw/filename_list
	rm -f montage/*.png
