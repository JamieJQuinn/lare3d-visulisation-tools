# ADD DIRECTORIES TO HERE
DIRS=slice-z slice-y energy-plots kdes

.PHONY: all clean

all clean:
	for dir in $(DIRS); do\
		$(MAKE) -C $$dir $@;\
	done
