#!/bin/sh -l

echo "hi"
echo "::add-mask::$username"
echo "Hello $username"

echo "::group::Some expandable warnings"
echo "::debug ::Debug Message"
echo "::warning ::Warning Message"
echo "::error ::Error Message"
echo "::end-group"


echo "::group::Some expandable logs"
apimcli --help
echo "::end-group"

# echo "::set-env name=HELLO::hello"