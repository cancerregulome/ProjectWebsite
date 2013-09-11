#!/bin/sh

BOOTSTRAP_LESS="bootstrap/less/bootstrap.less"
BOOTSTRAP_RESPONSIVE_LESS="bootstrap/less/responsive.less"

mkdir -p dist

lessc ${BOOTSTRAP_LESS} > dist/csacr.css
lessc ./less/cancerregulome.less >> dist/csacr.css
lessc --compress ${BOOTSTRAP_LESS} > dist/csacr.min.css
lessc ${BOOTSTRAP_RESPONSIVE_LESS} > dist/csacr-responsive.css
lessc --compress ${BOOTSTRAP_RESPONSIVE_LESS} > dist/csacr-responsive.min.css
