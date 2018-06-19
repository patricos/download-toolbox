#!/bin/bash
#
# URL access performance meter - jobsplitter
# ------------------------------------------
#
# by Patryk Mazurkiewicz,
# 2018 June

# configuration
workers=5               # may depend on the typical size of a file.  For big files 2 may suffice. 5 seems enough, not much gain if more.
workerf="worker.sh"     # specify the tool you need
soufile="filelist.txt"
basedir="$( cd "$(dirname "$0")" ; pwd -P )"
                        # ^^ should be the path of this script, not tested for arbitrary paths

# ------------------------------------------

# administrative confs
fprefix="xxx"           # WARNING: keep this unique across fnames in the current dir or you loose files.
fextens="log"
arcname=`date +%y%m%d-%H%M%S`

# preparation - remove files, mkdir an archive
cd $basedir
rm `ls | grep $fprefix | grep -v ".$fextens"` 2> /dev/null
mkdir $arcname

# computing the split slice-size and splitting as in manual for split
((linespp = (`cat $soufile | wc -l` + $workers - 1) / $workers))
split --lines=$linespp $soufile $fprefix

# operation
for workfile in $( ls | grep $fprefix ); do
    ./$workerf $workfile $arcname &
done
