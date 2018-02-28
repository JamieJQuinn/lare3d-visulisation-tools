#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"

ISOTROPIC_DIR=$1
SWITCHING_DIR=$2
OUTPUT_DIR=$3

# Remove trailing slash
ISOTROPIC_DIR=${ISOTROPIC_DIR%/}
SWITCHING_DIR=${SWITCHING_DIR%/}
# Escape slashes
ISOTROPIC_DIR=${ISOTROPIC_DIR//\//\\/}
SWITCHING_DIR=${SWITCHING_DIR//\//\\/}

echo "Copying to ${OUTPUT_DIR}"

cp -rv ${SCRIPT_DIR} ${OUTPUT_DIR}
cd ${OUTPUT_DIR}

sed -i "s/SWITCHING_DIR=.*$/SWITCHING_DIR=${SWITCHING_DIR}/" ./energy-plots/makefile
sed -i "s/SWITCHING_DIR=.*$/SWITCHING_DIR=${SWITCHING_DIR}/" ./kdes/makefile
sed -i "s/SWITCHING_DIR=.*$/SWITCHING_DIR=${SWITCHING_DIR}/" ./slice-y/fill_filelist.sh
sed -i "s/SWITCHING_DIR=.*$/SWITCHING_DIR=${SWITCHING_DIR}/" ./slice-z/fill_filelist.sh

sed -i "s/ISOTROPIC_DIR=.*$/ISOTROPIC_DIR=${ISOTROPIC_DIR}/" ./energy-plots/makefile
sed -i "s/ISOTROPIC_DIR=.*$/ISOTROPIC_DIR=${ISOTROPIC_DIR}/" ./kdes/makefile
sed -i "s/ISOTROPIC_DIR=.*$/ISOTROPIC_DIR=${ISOTROPIC_DIR}/" ./slice-y/fill_filelist.sh
sed -i "s/ISOTROPIC_DIR=.*$/ISOTROPIC_DIR=${ISOTROPIC_DIR}/" ./slice-z/fill_filelist.sh
