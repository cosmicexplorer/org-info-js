.PHONY: all clean distclean

NODE_DIR := node_modules
NPM_BIN = $(shell npm bin)
UGLIFY_JS = $(NPM_BIN)/uglifyjs
UGLIFY_CSS = $(NPM_BIN)/uglifycss

DEPS := $(NODE_DIR)

MINI_OUT := org-info-mini.js stylesheet-mini.css

all: $(MINI_OUT)

$(NODE_DIR):
	@npm install

%-mini.js: %.js $(DEPS)
	$(UGLIFY_JS) $< > $@
%-mini.css: %.css $(DEPS)
	$(UGLIFY_CSS) $< > $@

clean:
	@rm -f $(MINI_OUT)

distclean: clean
	@rm -rf $(NODE_DIR)
