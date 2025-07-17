export TARGET = i686-elf

export BINUTILS_VERSION = 2.38

export GCC_VERSION = 11.2.0

export PREFIX := $(abspath build/$(TARGET))

export BUILD_THREADS = 4

export PATH := $(PREFIX)/bin:$(PATH)