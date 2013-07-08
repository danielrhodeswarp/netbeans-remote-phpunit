#!/bin/sh

#echo $@ #uncomment to debug
#echo $1 $2 $3 $4
#echo $3 $4
#in case of "Rerun failed" $3 will be '--filter' and $4 will be a massive filter string
#$1 and $2 important for logging to an XML file (which local NetBeans then needs to
#display results etc)

REMOTE_SERVER=vagrant@localhost
REMOTE_PATH_TO_TESTS='/var/www/html/your_website_in_vagrant/tests'

#Connect to your vagrant VM, cd to your test location and run phpunit with appropriate args
if [ $3 = "--filter" ]
then
	#"rerun failed"
	vagrant ssh -c "cd $REMOTE_PATH_TO_TESTS; phpunit $1 $2 --filter \"$4\""
else
	#"(re)run [all] tests"
	vagrant ssh -c "cd $REMOTE_PATH_TO_TESTS; phpunit $1 $2"
fi

#Copy the test output back to your local machine, where NetBeans expects to find it
#might not work on mac. definitely won't work on win!
scp -i ~/.vagrant.d/insecure_private_key -P 2222 $REMOTE_SERVER:$2 $2
