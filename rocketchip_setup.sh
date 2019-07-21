#!/bin/bash
# Program:
#	Rocket Chip Quick Setup
# History:
#	2019/07/18	Lynn	ver01
# Command:
#	sh rocketchip_setup.sh
#==================================================

git clone https://github.com/ucb-bar/rocket-chip.git
cd rocket-chip
git submodule update --init

cd ..
git clone https://github.com/freechipsproject/rocket-tools
cd rocket-tools
git submodule update --init --recursive
export RISCV=/rocket-tools
export MAKEFLAGS="$MAKEFLAGS -j8"
./build.sh

cd ../rocket-chip/emulator
make

make -j8 run-bmark-tests
