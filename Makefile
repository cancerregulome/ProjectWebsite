BOOTSTRAP_LESS = ./lib/bootstrap/less/bootstrap.less
BOOTSTRAP_RESPONSIVE = css/bootstrap-responsive.css
BOOTSTRAP_RESPONSIVE_LESS = ./lib/bootstrap/less/responsive.less
CSACR_LESS = ./less/cancerregulome.less
LESS_COMPRESSOR ?= `which lessc`
WATCHR ?= `which watchr`

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
	cp  lib/bootstrap/img/* images
	cat lib/bootstrap/js/bootstrap-transition.js lib/bootstrap/js/bootstrap-alert.js lib/bootstrap/js/bootstrap-button.js lib/bootstrap/js/bootstrap-carousel.js lib/bootstrap/js/bootstrap-collapse.js lib/bootstrap/js/bootstrap-dropdown.js lib/bootstrap/js/bootstrap-modal.js lib/bootstrap/js/bootstrap-tooltip.js lib/bootstrap/js/bootstrap-popover.js lib/bootstrap/js/bootstrap-scrollspy.js lib/bootstrap/js/bootstrap-tab.js lib/bootstrap/js/bootstrap-typeahead.js > js/bootstrap.js
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
