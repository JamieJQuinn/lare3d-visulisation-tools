MONTAGE_OUTPUT=$(addsuffix .png,$(addprefix montage/,$(BOTH_TIMESTEPS)))

all: raw montage

.PHONY: raw
raw:
	cd ./raw;\
	rm -f $(shell find . -size 0);\
	ls $(ISOTROPIC_DIR)/Data/*.sdf $(SWITCHING_DIR)/Data/*.sdf | sed -e 's/ /\\n/g' > filename_list;\
	visit -nowin -cli -s ../plot.py

.PHONY: montage
montage: $(MONTAGE_OUTPUT)

montage/%.png: raw/Bmag_isotropic_%.png raw/Vmag_isotropic_%.png raw/Rho_isotropic_%.png raw/Energy_isotropic_%.png raw/Bmag_switching_%.png raw/Vmag_switching_%.png raw/Rho_switching_%.png raw/Energy_switching_%.png
	$(eval timestep=$(basename $(notdir $@)))
	montage \
		-label 'Bmag Isotropic' raw/Bmag_isotropic_$(timestep).png \
		-label 'Vmag Isotropic' raw/Vmag_isotropic_$(timestep).png \
		-label 'Rho Isotropic' raw/Rho_isotropic_$(timestep).png \
		-label 'Energy Isotropic' raw/Energy_isotropic_$(timestep).png \
		-label 'Bmag Switching' raw/Bmag_switching_$(timestep).png \
		-label 'Vmag Switching' raw/Vmag_switching_$(timestep).png \
		-label 'Rho Switching' raw/Rho_switching_$(timestep).png \
		-label 'Energy Switching' raw/Energy_switching_$(timestep).png \
		-geometry 1024x1024 $@

.PHONY: clean
clean:
	rm -f raw/*.png raw/visitlog.py raw/filename_list
	rm -f montage/*.png
