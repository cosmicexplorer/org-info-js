.PHONY: all clean

NODE_DIR := node_modules
NPM_BIN = $(shell npm bin)
UGLIFY_CC =  $(NPM_BIN)/uglifyjs

DEPS := $(NODE_DIR)

MINI_OUT := $(patsubst %.js,%-mini.js, $(wildcard *.js))

all: $(MINI_OUT)

%-mini.js: %.js $(DEPS)
	$(UGLIFY_CC) $< > $@

clean:
	rm -f $(MINI_OUT)
