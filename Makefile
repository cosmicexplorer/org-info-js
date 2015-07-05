.PHONY: all clean distclean

THIS_MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(patsubst %/,%,$(dir $(THIS_MAKEFILE_PATH)))

# turn paths relative
RELIFY_CMD := perl -e 'use File::Spec; print File::Spec->abs2rel(@ARGV) . "\n"'

NODE_DIR := node_modules
NPM_BIN = $(shell npm bin)
UGLIFY_JS = $(shell $(RELIFY_CMD) $(NPM_BIN)/uglifyjs $(CURRENT_DIR))
UGLIFY_CSS = $(shell $(RELIFY_CMD) $(NPM_BIN)/uglifycss $(CURRENT_DIR))

UGLIFY_JS_OPTS := -mc --screw-ie8 2>/dev/null

DEPS := $(UGLIFY_JS) $(UGLIFY_CSS)

MINI_OUT := org-info-mini.js stylesheet-mini.css

all: $(MINI_OUT)

$(NODE_DIR):
	@npm install

%-mini.js: %.js $(DEPS)
	$(UGLIFY_JS) $< $(UGLIFY_JS_OPTS) > $@
%-mini.css: %.css $(DEPS)
	$(UGLIFY_CSS) $< > $@

clean:
	@rm -f $(MINI_OUT)

distclean: clean
	@rm -rf $(NODE_DIR)
