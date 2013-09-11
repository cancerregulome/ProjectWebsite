BOOTSTRAP_LESS = ./bootstrap/less/bootstrap.less
BOOTSTRAP_RESPONSIVE_LESS = ./bootstrap/less/responsive.less
CSACR_LESS = ./less/cancerregulome.less
OUT_NAME=css/csacr

all: css bootstrap

css:
    mkdir -p css
    lessc ${BOOTSTRAP_LESS} > ${OUT_NAME}.css
    lessc ${CSACR_LESS} >> ${OUT_NAME}.css
    lessc --compress ${BOOTSTRAP_LESS} > ${OUT_NAME}.min.css
    lessc ${BOOTSTRAP_RESPONSIVE_LESS} > ${OUT_NAME}-responsive.css
    lessc --compress ${BOOTSTRAP_RESPONSIVE_LESS} > ${OUT_NAME}-responsive.min.css

#
# BUILD SIMPLE BOOTSTRAP DIRECTORY
# lessc & uglifyjs are required
#

bootstrap:
    mkdir -p images
    mkdir -p js
    cp  bootstrap/img/* images
    cat bootstrap/js/bootstrap-transition.js bootstrap/js/bootstrap-alert.js bootstrap/js/bootstrap-button.js bootstrap/js/bootstrap-carousel.js bootstrap/js/bootstrap-collapse.js bootstrap/js/bootstrap-dropdown.js bootstrap/js/bootstrap-modal.js bootstrap/js/bootstrap-tooltip.js bootstrap/js/bootstrap-popover.js bootstrap/js/bootstrap-scrollspy.js bootstrap/js/bootstrap-tab.js bootstrap/js/bootstrap-typeahead.js > js/bootstrap.js
    uglifyjs -nc js/bootstrap.js > js/bootstrap.min.tmp.js
    echo "/**\n* Bootstrap.js by @fat & @mdo\n* Copyright 2012 Twitter, Inc.\n* http://www.apache.org/licenses/LICENSE-2.0.txt\n*/" > js/copyright.js
    cat js/copyright.js js/bootstrap.min.tmp.js > js/bootstrap.min.js
    rm js/copyright.js js/bootstrap.min.tmp.js


#
# WATCH LESS FILES
#

watch:
    echo "Watching less files..."; \
    watchr -e "watch('less/.*\.less') { system 'make' }"


.PHONY: css bootstrap

clean:
    rm ${OUT_NAME}.css ${OUT_NAME}.min.css ${OUT_NAME}-responsive.css ${OUT_NAME}-responsive.min.css
