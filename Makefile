.PHONY: all clean distclean

THIS_MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(patsubst %/,%,$(dir $(THIS_MAKEFILE_PATH)))

NODE_DIR := node_modules
NPM_BIN := $(NODE_DIR)/.bin
UGLIFY_JS := $(NPM_BIN)/uglifyjs
UGLIFY_CSS := $(NPM_BIN)/uglifycss

NODE_DEPS := $(UGLIFY_JS) $(UGLIFY_CSS)

UGLIFY_JS_OPTS := -mc --screw-ie8 2>/dev/null

DEPS := $(NODE_DEPS)

MINI_OUT := org-info-mini.js stylesheet-mini.css

all: $(MINI_OUT)

$(NODE_DEPS):
	@npm install

%-mini.js: %.js $(DEPS)
	@echo "$< => $@"
	@$(UGLIFY_JS) $< $(UGLIFY_JS_OPTS) > $@
%-mini.css: %.css $(DEPS)
	@echo "$< => $@"
	@$(UGLIFY_CSS) $< > $@

clean:
	@rm -f $(MINI_OUT)

distclean: clean
	@rm -rf $(NODE_DIR)
