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
# sensitive infomrmation
secretpassf='online-password.txt'
secretuserf='online-username.txt'
username=`cat $secretuserf`
userpass=`cat $secretpassf`

# operation
maxtic=`date +%s%3N`

while read url; do
    filename=`echo -e $url | cut -f2 -d" "`
    faddress=`echo -e $url | cut -f1 -d" "`

    mintic=`date +%s%3N` # 3N is 3 most significant digits of nanosec, i.e. milisec
    wget --user=$username --password=$userpass $faddress -O $2/$filename -o /dev/null
    mintoc=`date +%s%3N`

    fsize=`du -ks $2/$filename | cut -f1`
    (( mintictoc=$mintoc-$mintic ))
    echo -e "$fsize\t$mintictoc\t$filename" >> $logfile

done <$1

maxtoc=`date +%s%3N`
(( maxtictoc=$maxtoc-$maxtic ))
echo -e "Total time: $maxtictoc miliseconds\nDetailed log contains: 'bytes' and 'milisecs' columns." > $logfil2

mv "$1"* "$2"
