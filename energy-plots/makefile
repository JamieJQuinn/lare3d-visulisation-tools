OUTPUTS=switching.png isotropic.png both.png

all: $(OUTPUTS)

switching.png:
	python print_energy.py $(SWITCHING_DIR)/Data/en.dat --plot_all --save --output $@

isotropic.png:
	python print_energy.py $(ISOTROPIC_DIR)/Data/en.dat --plot_all --save --output $@

both.png:
	python print_energy.py $(ISOTROPIC_DIR)/Data/en.dat $(SWITCHING_DIR)/Data/en.dat --plot_all --save --output $@

clean:
	rm -f $(OUTPUTS)
