BOTH_OUTPUTS=$(addsuffix .png,$(BOTH_TIMESTEPS))

CUBE_LENGTH=1.0

.PHONY: all
all: $(BOTH_OUTPUTS)

%.png: isotropic-%.txt switching-%.txt
	python plot-kde.py $@ $^

isotropic-%.txt: $(ISOTROPIC_DIR)/Data/%.sdf
	python ./print_cube.py $< $(CUBE_LENGTH) > $@

switching-%.txt: $(SWITCHING_DIR)/Data/%.sdf
	python ./print_cube.py $< $(CUBE_LENGTH) > $@

.PHONY: montage
montage:
	for fname in $(OUTPUTS); do \
		montage \
			-label 'Cube Length=1.0' radius1/$$fname \
			-label 'Cube Length=2.0' radius2/$$fname \
			-geometry 1000x800 montage/$$fname; \
	done

.PHONY: clean
clean:
	rm -f $(BOTH_OUTPUTS)
