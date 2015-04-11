#!/bin/bash

# This shell scripts appends endockin specific DNS 
# config to your hosts file
#
# Author: Mate-Laszlo Lang <langmatelaszlo@gmail.com>
#

# Checking if hosts file was already initialized
isInitialized=`grep '#ENDOCKIN' /etc/hosts`
if [ $isInitialized ] 
then
  echo "Already Initialized! Quitting..."
  exit 1
fi

# We need to add endockin specific DNS entries into hosts file
echo "
#ENDOCKIN

192.168.199.101      endockin-master1
192.168.199.111      endockin-slave1
192.168.199.112      endockin-slave2
192.168.199.113      endockin-slave3

#/ENDOCKIN" >> /etc/hosts

