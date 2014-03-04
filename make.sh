#!/bin/bash -e

. kerneltools-build-config

TOOLS_DIR=`dirname "$0"`
$TOOLS_DIR/make-common.sh $*
