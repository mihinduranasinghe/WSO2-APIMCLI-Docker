# FROM openjdk:7-alpine
FROM openjdk:alpine-jre
RUN apk update
RUN apk add git

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