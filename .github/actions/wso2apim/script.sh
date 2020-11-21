#!/bin/sh -l

echo "hi"
echo "Hello $1"
echo "::add-mask::$1"
echo "Hello $1"

# echo "::group::Some expandable warnings"
# echo "::debug ::Debug Message"
# echo "::warning ::Warning Message"
# echo "::error ::Error Message"
# echo "::end-group"

echo "::group::WSO2 APIMCLI Version"
apimcli version
echo "::end-group"

echo "::group::WSO2 APIMCLI Help"
apimcli --help
echo "::end-group"

echo "::group::Add environment wso2apicloud"
apimcli remove env wso2apicloud

apimcli add-env -n wso2apicloud \
                      --registration https://gateway.api.cloud.wso2.com/client-registration/register \
                      --apim https://gateway.api.cloud.wso2.com/pulisher \
                      --token https://gateway.api.cloud.wso2.com/token \
                      --import-export https://gateway.api.cloud.wso2.com/api-import-export \
                      --admin https://gateway.api.cloud.wso2.com/api/am/admin/ \
                      --api_list https://gateway.api.cloud.wso2.com/api/am/publisher/apis \
                      --app_list https://gateway.api.cloud.wso2.com/api/am/store/applications

apimcli list envs          
echo "::end-group"

echo "::group::Export API from current tenant"
# apimcli export-api -n <API-name> -v <version> -r <provider> -e <environment> -u <username> -p <password> -k
# apimcli export-api --name <API-name> --version <version> --provider <provider> --environment <environment> --username <username> --password <password> --insecure
apimcli export-api -n TeamMasterAPI -v v1.0.0 -r mihindu@wso2.com@development -e wso2apicloud -u mihindu@wso2.com@development -p $2 -k
echo "::end-group"

echo "::group::Import API to targetted tenant"
# apimcli import-api -f <environment>/<file> -e <environment> -u <username> -p <password> --preserve-provider <preserve_provider> -k
# apimcli import-api --file <environment>/<file> --environment <environment> --username <username> --password <password> --preserve-provider <preserve_provider> --insecure
apimcli import-api -f wso2apicloud/TeamMasterAPI_v1.0.0.zip -e wso2apicloud -u mihindu@wso2.com@production -p $2 --preserve-provider=false -k
echo "::end-group"

echo "::group::List APIS in a perticular environment"
# apimcli list apis -e <environment> -k
# apimcli list apis --environment <environment> --insecure
apimcli list apis -e wso2apicloud -k
echo "::end-group"

echo "::group::Export an *App from current tenant"
# apimcli export-app -n <application-name> -o <owner> -e <environment> -k
# apimcli export-app --name <application-name> --owner <owner> --environment <environment> --insecure
# apimcli export-app -n TestApp -o kim@wso2.com@testorg1 -e wso2apicloud -k
echo "::end-group"

echo "::group::Export an *App from current tenant"
# apimcli export-app -n <application-name> -o <owner> -e <environment> -k
# apimcli export-app --name <application-name> --owner <owner> --environment <environment> --insecure
# apimcli export-app -n TestApp -o kim@wso2.com@testorg1 -e wso2apicloud -k
echo "::end-group"

echo "::group::List *Apps in a perticular environment"
# apimcli list apps -e <environment> -o <owner> -k
# apimcli list apps --environment <environment> --owner <owner> --insecure
# apimcli list apps -e wso2apicloud -o admin -k
echo "::end-group"

echo "::group::List *Reset Users"
# If you want to list APIs or applications that belong to a particular tenant, 
# you need to first reset the user before listing APIs or applications for the particular tenant.

# apimcli reset-user -e <environment>
# apimcli reset-user --environment <environment>
# apimcli reset-user -e wso2apicloud
echo "::end-group"


# echo "::set-env name=HELLO::hello"