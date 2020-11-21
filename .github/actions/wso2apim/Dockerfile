FROM openjdk:jre-slim

# ADD https://github.com/mihinduranasinghe/WSO2-APIMCLI/ /usr/local/bin/apimcli

COPY apimcli /usr/local/bin/apimcli
RUN chmod +x /usr/local/bin/apimcli

WORKDIR /usr/src/app
COPY . /usr/src/app

RUN cd $GITHUB_WORKSPACE
RUN apimcli

ENTRYPOINT ["/usr/src/app/script.sh"]