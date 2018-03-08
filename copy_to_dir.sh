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

cp -rTv ${SCRIPT_DIR} ${OUTPUT_DIR}
cd ${OUTPUT_DIR}

sed -i "s/SWITCHING_DIR=.*$/SWITCHING_DIR=${SWITCHING_DIR}/" ./makefile
sed -i "s/ISOTROPIC_DIR=.*$/ISOTROPIC_DIR=${ISOTROPIC_DIR}/" ./makefile
