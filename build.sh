#!/bin/bash

cd `dirname $0`
PACKAGE_NAME=tcDummyDeb
VERSION=0.0.1

if [ ! -z $1 ] ; then 
  VERSION=$1
fi

echo "Using $VERSION as version number"

pwd

if [ -e ./target ] ; then 
  rm -rf ./target
fi

mkdir ./target && cd ./target

for ARCH in i386 amd64 ; do 
 DEB_PACKAGE=${PACKAGE_NAME}_${ARCH}_${VERSION}
 mkdir ${DEB_PACKAGE}
 echo "deb package will be ${DEB_PACKAGE}"
 cp -a ../src/tcDummyDeb/* ${DEB_PACKAGE}
 cat ../src/${PACKAGE_NAME}/DEBIAN/control | \
    sed -e "s/_version_token_/${VERSION}/" | \
    sed -e "s/_arch_token_/${ARCH}/" \
    > ${DEB_PACKAGE}/DEBIAN/control
  dpkg --build ${DEB_PACKAGE}
done
