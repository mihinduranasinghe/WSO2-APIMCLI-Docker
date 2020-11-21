#!/bin/sh -l

echo "hi"
echo "Hello $1"
echo "::add-mask::$1"
echo "Hello $1"

echo "::group::Some expandable warnings"
echo "::debug ::Debug Message"
echo "::warning ::Warning Message"
echo "::error ::Error Message"
echo "::end-group"


echo "::group::Add environment wso2apicloud"
apimcli --help
# apimcli remove env wso2apicloud

apimcli add-env -n wso2apicloud \
                      --registration https://gateway.api.cloud.wso2.com/client-registration/register \
                      --apim https://gateway.api.cloud.wso2.com/pulisher \
                      --token https://gateway.api.cloud.wso2.com/token \
                      --import-export https://gateway.api.cloud.wso2.com/api-import-export \
                      --admin https://gateway.api.cloud.wso2.com/api/am/admin/ \
                      --api_list https://gateway.api.cloud.wso2.com/api/am/publisher/apis \
                      --app_list https://gateway.api.cloud.wso2.com/api/am/store/applications
          
echo "::end-group"

# echo "::set-env name=HELLO::hello"