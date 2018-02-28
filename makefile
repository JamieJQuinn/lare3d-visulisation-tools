# ADD DIRECTORIES TO HERE
DIRS=slice-z slice-y energy-plots kdes

.PHONY: all $(DIRS)
all: $(DIRS)

$(DIRS):
	$(MAKE) -C $@

.PHONY: clean clean-$(DIRS)
clean: clean-$(DIRS)

clean-$(DIRS):
	$(MAKE) clean -C $@
