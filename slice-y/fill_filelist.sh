#!/usr/bin/env bash
isotropic_dir=/nas/1101974q/kink-instability-str8/mid-res/without-rampdown/v-4r-4-isotropic
switching_dir=/nas/1101974q/kink-instability-str8/mid-res/without-rampdown/v-4r-4-switching
ls ${isotropic_dir}/Data/*.sdf | sed -e 's/ /\\n/g' > filename_list
ls ${switching_dir}/Data/*.sdf | sed -e 's/ /\\n/g' > filename_list
