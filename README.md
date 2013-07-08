netbeans-remote-phpunit
=======================


a fork of fentie/netbeans-remote-phpunit

like fentie's code this allows NetBeans to
work with remote PHPUnit execution.

But this is for a "remote" server of Vagrant
running on your localhost.

A bit of a mess at the moment but supports
NetBeans "(re)run [all] tests" and "rerun failed" test buttons.

Does NOT use the master PHPUnit test suite as bundled with NetBeans.

You'll probably need the appropriate phpunit.xml in $REMOTE_PATH_TO_TESTS
