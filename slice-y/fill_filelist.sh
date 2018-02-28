#!/usr/bin/env bash
ISOTROPIC_DIR=/nas/1101974q/kink-instability-str8/mid-res/without-rampdown/v-4r-4-isotropic
SWITCHING_DIR=/nas/1101974q/kink-instability-str8/mid-res/without-rampdown/v-4r-4-switching
ls ${ISOTROPIC_DIR}/Data/*.sdf | sed -e 's/ /\\n/g' > filename_list
ls ${SWITCHING_DIR}/Data/*.sdf | sed -e 's/ /\\n/g' > filename_list
