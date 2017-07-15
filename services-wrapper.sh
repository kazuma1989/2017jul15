#!/bin/sh

set -eux

/usr/sbin/sshd
java -jar /usr/local/jetty/start.jar
