# BINUTILS_URL = https://ftp.gnu.org/gnu/binutils/binutils-$(BINUTILS_VERSION).tar.xz

BINUTILS_URL = https://sourceware.org/pub/binutils/releases/binutils-$(BINUTILS_VERSION).tar.xz

SOURCE = binutils-$(BINUTILS_VERSION)
BUILD = $(TARGET)-binutils-build-$(BINUTILS_VERSION)

all: build install

$(BUILD): $(SOURCE)
	mkdir -p $(BUILD)
	cd $(BUILD) && \
	CFLAGS= ASMFLAGS= CC= CXX= LD= ASM= LINKFLAGS= LIBS= \
	../$(SOURCE)/configure \
		--target=$(TARGET) \
		--prefix=$(PREFIX) \
		--with-sysroot \
		--disable-nls \
		--disable-werror

$(SOURCE): $(SOURCE).tar.xz
	mkdir -p $(SOURCE)
	tar -xf $(SOURCE).tar.xz -C $(SOURCE) --strip-components=1

$(SOURCE).tar.xz:
	wget $(BINUTILS_URL) -O $(SOURCE).tar.xz

build: $(BUILD)
	$(MAKE) -j$(BUILD_THREADS) -C $(BUILD)

install:
	$(MAKE) -C $(BUILD) install

clean:
	rm -rf $(BUILD) $(SOURCE) $(SOURCE).tar.xz
	rm -rf $(TARGET)-*

.PHONY: build install all clean