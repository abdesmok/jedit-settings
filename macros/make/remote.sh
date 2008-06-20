#!/bin/bash

make -f Makefile.cvz_ddd && echo -n "sending..." && /bin/cp -f cvz_ddd.exe /cygdrive/z/transfer/ && echo " OK"

