.PHONY: all clean distclean

THIS_MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

NODE_DIR := node_modules
NPM_BIN = $(shell npm bin)
UGLIFY_CC =  $(NPM_BIN)/uglifyjs

DEPS := $(NODE_DIR)

MINI_OUT := $(CURRENT_DIR)/org-info-mini.js

all: $(MINI_OUT)

$(NODE_DIR):
	@npm install

%-mini.js: %.js $(DEPS)
	$(UGLIFY_CC) $< > $@

clean:
	@rm -f $(MINI_OUT)

distclean: clean
	@rm -rf $(NODE_DIR)
