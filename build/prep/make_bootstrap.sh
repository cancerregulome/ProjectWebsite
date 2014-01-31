#!/bin/sh

mkdir -p dist/images
mkdir -p dist/js

cp  bootstrap/img/* dist/images

cat bootstrap/js/bootstrap-transition.js bootstrap/js/bootstrap-alert.js bootstrap/js/bootstrap-button.js bootstrap/js/bootstrap-carousel.js bootstrap/js/bootstrap-collapse.js bootstrap/js/bootstrap-dropdown.js bootstrap/js/bootstrap-modal.js bootstrap/js/bootstrap-tooltip.js bootstrap/js/bootstrap-popover.js bootstrap/js/bootstrap-scrollspy.js bootstrap/js/bootstrap-tab.js bootstrap/js/bootstrap-typeahead.js > dist/js/bootstrap.js

uglifyjs -nc dist/js/bootstrap.js > dist/js/bootstrap.min.tmp.js

echo "/**\n* Bootstrap.js by @fat & @mdo\n* Copyright 2012 Twitter, Inc.\n* http://www.apache.org/licenses/LICENSE-2.0.txt\n*/" > dist/js/copyright.js

cat dist/js/copyright.js dist/js/bootstrap.min.tmp.js > dist/js/bootstrap.min.js
