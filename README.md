# Download toolbox

This project entails a few scripts for automatically downloading a list of URLs or gauging the download capabilities based on testing of URLs from the list.  The scripts use multiple threads to do the download job.  The primary downloader is `wget`.  In order to use this toolbox you should use a list of ~half a thousand files about 100kb in size.

Bash.  No rocket science.  The really descent performance (compared with no-parallel download engines) comes from the fact that the bandwidth is the limitation, and not the latency of http connection initiation.

## Download speed/throughput gauge

Is a cron-triggered script that verifies the performance-properties of file-serving services. It can be run periodically, as desired, as set in the crontab.

## Multi-file download tool

Are scripts that harvest massive numbers of files specified on the list.

## Other tools

One other tool is available at the moment: heartbeat monitor a.k.a. "change observer" ;-) .  It either displays the sizes of the files in the current directory when no parameter specified (so you can observe your log-files grow) or by specifying a dirname as a parameter you can observe how quickly the number of files in the target directory grows.

# How to run it

## Config

* The URL `list.txt` shall have no blank lines at the end.
* The potential `crontab -e` command for running the `worker-gauge.sh` is: `0 *  *  *  *  /fullpath/jobsplit.sh` (remember to adjust the config in `jobsplit.sh` to your needs).
* Set configuring-variables in `jobsplit.sh`.
* Set configuring-variables in worker of your choice.

## Running

Start by analyzing `jobsplit.sh`.  If you have set all the configuring-variables (so that they make sense for you) you will do best if you continue following the script till the end.  You are also responsible for configuring the variable that indicates the worker script, and the configuration of the worker script.

The end result of the workers is that all resulting files (the payload as well as log-files) are moved aside from the script-current direcotry into the timestmp-named directory.
