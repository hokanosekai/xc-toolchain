# OS Dev Toolchain Makefile

This makefile orchestrates the build process for a cross-compilation toolchain, including Binutils and GCC. It handles downloading, extracting, configuring, building, and installing the necessary components.

## Usage

To build the toolchain, simply run:

```bash
make
```

## Variables

You can edit the following variables to customize the toolchain build in the `config.mk` file:

```makefile
export BINUTILS_VERSION = 2.38
export GCC_VERSION = 11.2.0
export TARGET = i686-elf
export PREFIX = $(abspath build/$(TARGET))
```

## Components

- **Binutils**: Provides essential tools for binary manipulation.
- **GCC**: The GNU Compiler Collection, which includes compilers for C and C++.

## Directory Structure

```txt
├── binutils
│   └── makefile
├── gcc
│   └── makefile
├── makefile
├── config.mk
└── build
```

## Makefile Targets

- `all`: Builds both binutils and GCC.
- `binutils`: Builds the binutils component.
- `gcc`: Builds the GCC component.
- `clean`: Cleans up the build directories and removes the installed toolchain.
