#!/bin/sh -l


echo "hi"
echo "::add-mask::$1"
echo "Hello $1"

echo "::group::Some expandable warnings"
echo "::debug ::Debug Message"
echo "::warning ::Warning Message"
echo "::error ::Error Message"
echo "::end-group"


echo "::group::Some expandable logs"
apimcli --help
echo "::end-group"

# echo "::set-env name=HELLO::hello"