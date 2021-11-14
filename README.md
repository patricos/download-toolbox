# Download toolbox

This project entails a few scripts for automatically downloading a list of URLs, gauging the download capabilities while downloading the URLs from the list.  The scripts use multiple threads to do the download job.  The primary downloader is `wget`.  In order to use this toolbox to max capabilities you should use a long list small download files (we have observed, file-size of about 100kb allows for huge time-gains compared with single-thread download).

Bash.  The really descent performance (compared with no-parallel download engines) comes from the fact that the connection establishing has a significant time-overhead.  This in turn allows for maximizing the throughput capability by using many already-extablished threads.

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

# Credits

## Thanks

Thanks to the management of IT in Raben Group for inspiration that has played role in the outcome of this project.

## Achievements

This automation has been credited with optimizing (in terms of time) a particular process by a degree of magnitude.

Part of this effort has also turned out to be noticed by the [open-source community](https://askubuntu.com/questions/1047100/shell-script-to-cron-that-calls-url-and-saves-file/1047103#1047103).
