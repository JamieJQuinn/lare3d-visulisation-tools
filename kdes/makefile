OUTPUTS=$(shell echo 00{00..50}.png)
SWITCHING-DIR=/nas/1101974q/kink-instability-str8/mid-res/without-rampdown/v-4r-4-switching
ISOTROPIC-DIR=/nas/1101974q/kink-instability-str8/mid-res/without-rampdown/v-4r-4-isotropic
RADIUS=1.0

all: $(OUTPUTS)

%.png: isotropic-%.txt switching-%.txt
	python plot-kde.py $@ $^

isotropic-%.txt: $(ISOTROPIC-DIR)/Data/%.sdf
	python ./print_cylinder.py $< $(RADIUS) > $@

switching-%.txt: $(SWITCHING-DIR)/Data/%.sdf
	python ./print_cylinder.py $< $(RADIUS) > $@

clean:
	rm -f $(OUTPUTS)
