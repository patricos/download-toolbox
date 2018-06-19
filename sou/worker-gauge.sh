#!/bin/bash
#
# URL access performance meter - worker
# -------------------------------------
#
# by Patryk Mazurkiewicz,
# 2018 June
#
# -------------------------------------


# input
# -----
#
# thisScriptName workFileName archDirecoryName
# -- workFileName contain URLs, one per line, to crawl through
# -- archDirecoryName contains a directory to move sou+logfile to
# -- e.g.:
#    worker-mr.sh xxxaa 180607-152800


# administrative confs
logfile="$1.log"
logfil2="$1.total"


# operation
maxtic=`date +%s%3N`

while read url; do
    mintic=`date +%s%3N` # 3N is 3 most significant digits of nanosec, i.e. milisec
    fsize=`wget $url  -o /dev/null -O - | wc -c`
    mintoc=`date +%s%3N`
    (( mintictoc=$mintoc-$mintic ))
    echo -e "$fsize\t$mintictoc" >> $logfile
done <$1

maxtoc=`date +%s%3N`
(( maxtictoc=$maxtoc-$maxtic ))
echo -e "Total time: $maxtictoc miliseconds\nDetailed log contains: 'bytes' and 'milisecs' columns." > $logfil2

mv "$1"* "$2"
