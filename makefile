# ADD DIRECTORIES TO HERE
DIRS=slice-z slice-y energy-plots kdes
SWITCHING_DIR=/nas/1101974q/null-point-study-2018/256gp/v-3r-4-switching
ISOTROPIC_DIR=/nas/1101974q/null-point-study-2018/256gp/v-3r-4-isotropic
SWITCHING_TIMESTEPS=$(notdir $(basename $(shell ls $(SWITCHING_DIR)/Data/*.sdf)))
ISOTROPIC_TIMESTEPS=$(notdir $(basename $(shell ls $(ISOTROPIC_DIR)/Data/*.sdf)))
BOTH_TIMESTEPS=$(shell echo $(SWITCHING_OUTPUTS) $(ISOTROPIC_OUTPUTS) | tr " " "\n" | sort | uniq -d | tr "\n" " ")
export SWITCHING_DIR ISOTROPIC_DIR SWITCHING_TIMESTEPS ISOTROPIC_TIMESTEPS BOTH_TIMESTEPS

.PHONY: all clean $(DIRS)

all: $(DIRS)

$(DIRS):
	$(MAKE) -C $@

clean:
	for dir in $(DIRS); do\
		$(MAKE) -C $$dir $@;\
	done
