include config.mk

all: binutils gcc

binutils:
	$(MAKE) -C binutils

gcc:
	$(MAKE) -C gcc

clean:
	rm -rf $(PREFIX)
	$(MAKE) -C binutils clean
	$(MAKE) -C gcc clean

.PHONY: all binutils gcc clean
