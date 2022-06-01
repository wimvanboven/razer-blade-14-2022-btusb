#!/bin/bash
vers=(${kernelver//./ })   # split kernel version into individual elements
major="${vers[0]}"
minor="${vers[1]}"
version="$major.$minor"    # recombine as needed
subver=$(grep "SUBLEVEL =" /usr/src/kernels/${kernelver}/Makefile | tr -d " " | cut -d "=" -f 2)

echo "Downloading kernel source $version.$subver for $kernelver"
wget https://mirrors.edge.kernel.org/pub/linux/kernel/v$major.x/linux-$version.$subver.tar.xz

echo "Extracting original source"
tar -xf linux-$version.$subver.tar.* linux-$version.$subver/$1 --xform=s,linux-$version.$subver/$1,.,

# The new module version should be increased to allow the new module to be
# installed during kernel upgrade
echo "Increase module version"
sed -i 's/\(#define VERSION "0\.8\)/\1\.2/' btusb.c

for i in `ls *.patch`
do
  echo "Applying $i"
  patch < $i
done
