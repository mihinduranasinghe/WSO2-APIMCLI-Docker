FROM alpine:3.5
RUN apk update
RUN apk add git
RUN git --help

# FROM openjdk:jre-slim
# ADD https://github.com/mihinduranasinghe/WSO2-APIMCLI/ /usr/local/bin/apimcli

COPY apimcli /usr/local/bin/apimcli
RUN chmod +x /usr/local/bin/apimcli

WORKDIR /usr/src/app
# COPY . /usr/src/app
COPY . .
RUN chmod +x /usr/src/app/script.sh
RUN cd $GITHUB_WORKSPACE

ENTRYPOINT ["/usr/src/app/script.sh"]