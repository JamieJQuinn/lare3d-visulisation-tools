OUTPUTS=switching.png isotropic.png both.png
SWITCHING-DIR=/nas/1101974q/kink-instability-str8/mid-res/without-rampdown/v-4r-4-switching
ISOTROPIC-DIR=/nas/1101974q/kink-instability-str8/mid-res/without-rampdown/v-4r-4-isotropic

all: $(OUTPUTS)

switching.png:
	python print_energy.py $(SWITCHING-DIR)/Data/en.dat --plot_all --save --output $@

isotropic.png:
	python print_energy.py $(ISOTROPIC-DIR)/Data/en.dat --plot_all --save --output $@

both.png:
	python print_energy.py $(ISOTROPIC-DIR)/Data/en.dat $(SWITCHING-DIR)/Data/en.dat --plot_all --save --output $@

clean:
	rm $(OUTPUTS)
