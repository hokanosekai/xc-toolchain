# GCC_URL = https://ftp.gnu.org/gnu/gcc/gcc-$(GCC_VERSION)/gcc-$(GCC_VERSION).tar.xz

GCC_URL = https://github.com/gcc-mirror/gcc/archive/refs/tags/releases/gcc-$(GCC_VERSION).tar.gz

SOURCE = gcc-$(GCC_VERSION)
BUILD = $(TARGET)-gcc-build-$(GCC_VERSION)

all: build install

$(BUILD): $(SOURCE)
	mkdir -p $(BUILD)
	cd $(BUILD) && \
	CFLAGS= ASMFLAGS= CC= CXX= LD= ASM= LINKFLAGS= LIBS= \
	../$(SOURCE)/configure \
		--target=$(TARGET) \
		--prefix=$(PREFIX) \
		--disable-nls \
		--enable-languages=c,c++ \
		--without-headers

$(SOURCE): $(SOURCE).tar.xz
	mkdir -p $(SOURCE)
	tar -xf $(SOURCE).tar.xz -C $(SOURCE) --strip-components=1

$(SOURCE).tar.xz:
	wget $(GCC_URL) -O $(SOURCE).tar.xz

build: $(BUILD)
	$(MAKE) -j$(BUILD_THREADS) -C $(BUILD) all-gcc
	$(MAKE) -j$(BUILD_THREADS) -C $(BUILD) all-target-libgcc

install:
	$(MAKE) -C $(BUILD) install-gcc install-target-libgcc

clean:
	rm -rf $(BUILD) $(SOURCE) $(SOURCE).tar.xz
	rm -rf $(TARGET)-*

.PHONY: build install all clean