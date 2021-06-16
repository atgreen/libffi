#!/bin/bash

set -x

cd /opt

echo $PATH
export PATH=/usr/local/bin:$PATH
echo $PATH

./configure --host=${HOST} || cat */config.log
make
make dist
echo $RUNTESTFLAGS
echo $DEJAGNU
ls -l $DEJAGNU
find ./ -name site.exp
export DEJAGNU=`pwd`/$DEJAGNU
runtest --version
make check RUNTESTFLAGS="-a $RUNTESTFLAGS" || true
