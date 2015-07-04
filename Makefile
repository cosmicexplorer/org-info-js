.PHONY: all clean distclean

NODE_DIR := node_modules
NPM_BIN = $(shell npm bin)
UGLIFY_CC =  $(NPM_BIN)/uglifyjs

DEPS := $(NODE_DIR)

MINI_OUT := org-info-mini.js

all: $(MINI_OUT)

$(NODE_DIR):
	@npm install

%-mini.js: %.js $(DEPS)
	$(UGLIFY_CC) $< > $@

clean:
	@rm -f $(MINI_OUT)

distclean: clean
	@rm -rf $(NODE_DIR)
