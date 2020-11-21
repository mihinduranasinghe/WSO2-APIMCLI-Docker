#!/bin/sh -l


echo "hi"


echo "::debug ::Debug Message"
echo "::warning ::Warning Message"
echo "::error ::Error Message"

echo "::add-mask::$1"
echo "Hello $1"

time=$(date)
echo "::set-output name=time::$time"

echo "::group::Some expandable logs"
apimcli --help
echo "::end-group"

# echo "::set-env name=HELLO::hello"