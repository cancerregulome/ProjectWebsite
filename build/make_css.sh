#!/bin/bash

set BOOTSTRAP_LESS = ./bootstrap/less/bootstrap.less
set BOOTSTRAP_RESPONSIVE_LESS = ./bootstrap/less/responsive.less
set OUT_NAME=dist/csacr

mkdir -p dist

lessc ${BOOTSTRAP_LESS} > ${OUT_NAME}.css
lessc ./less/cancerregulome.less >> ${OUT_NAME}.css
lessc --compress ${BOOTSTRAP_LESS} > ${OUT_NAME}.min.css
lessc ${BOOTSTRAP_RESPONSIVE_LESS} > ${OUT_NAME}-responsive.css
lessc --compress ${BOOTSTRAP_RESPONSIVE_LESS} > ${OUT_NAME}-responsive.min.css
