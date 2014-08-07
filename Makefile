#Notes for compilation:
#1. For compiling the code with this Makefile, a OE setup is mandatory. 
#2. Before compiling, change the paths as per the setup of your environment.

CC = ${HOME}/Toradex/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-gcc
INCLUDES = "-I${HOME}/Toradex/oe-core/build/out-eglibc/sysroots/colibri-vf/usr/include" "-I${HOME}/Toradex/oe-core/build/out-eglibc/sysroots/colibri-vf/usr/include/glib-2.0" "-I${HOME}/Toradex/oe-core/build/out-eglibc/sysroots/colibri-vf/usr/lib/glib-2.0/include" "-I${HOME}/Toradex/oe-core/build/out-eglibc/sysroots/colibri-vf/usr/include/gstreamer-0.10" "-I${HOME}/Toradex/oe-core/build/out-eglibc/sysroots/colibri-vf/usr/include/libxml2"
LIB_PATH = "-L${HOME}/Toradex/oe-core/build/out-eglibc/sysroots/colibri-vf/usr/lib"
LDFLAGS = -lpthread -lgobject-2.0 -lglib-2.0 -lgstreamer-0.10 -lgstapp-0.10 
CFLAGS = -O3 -g --sysroot=${HOME}/Toradex/oe-core/build/out-eglibc/sysroots/colibri-vf 

all: 
	${CC} ${CFLAGS} ${INCLUDES} ${LIB_PATH} ${LDFLAGS} -o audiovf audiovf.c

clean:
	rm -rf audiovf
