#!/bin/sh
# finder.sh; Assignment 1.1 AELD Course 1
# 
###############
# Requirements:
###############
#
# Accepts the following arguments: 
#
# arg1 = a full path to a file (including filename) on the filesystem, referred 
# to as writefile; 
#
# arg2 = a text string which will be written within this file, referred to as writestr
#
# Exits with value 1 error and print statements if any of the arguments 
#   above were not specified
#
# Creates a new file with name and path writefile with content writestr, 
#   overwriting any existing file and creating the path if it doesn’t exist. 
#
# Exits with value 1 and error print statement if the file could not be created.
#
#################
# Syntax Example:
#################
#
# writer.sh /tmp/aesd/assignment1/sample.txt ios 
#
#   Creates file:
#
#       /tmp/aesd/assignment1/sample.txt
#
#   With content:
#       
#       ios
#
################################################################################

# setup command line arguments to variables for better readability
writefile=$1
writestr=$2


# error handling

# invalid number of arguments
if [ $# != 2 ]
then
    echo "Syntax: ./writer.sh (path) (write string)"
    exit 1
fi

#main logic

#check if path exists

writepath=`echo "${writefile%/*}"`

# path doesnt exist
if [ ! -d $writepath ]
then
    mkdir -p $writepath
fi

# create file and return error if unable to
echo $writestr > $writefile

if [ $? != 0 ]
then
    echo "Error: could not create file:"$writefile
    exit 1
fi
