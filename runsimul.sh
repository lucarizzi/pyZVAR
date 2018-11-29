#!/bin/sh
\rm cmd_mixer.dat.out.*
\rm cmd_mixer.dat.box.*
#cat cmd_mixer.dat.orig | sed "s/error/opt_pop/g" > cmd_mixer.dat
./zvar_opti
for f in `ls -1 cmd_mixer.dat.out.* | tail -1`; do
	cp $f cmd_mixer.dat;
done;
#cp cmd_mixer.dat cmd_mixer.dat.orig
