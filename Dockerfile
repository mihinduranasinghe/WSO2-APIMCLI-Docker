FROM openjdk:jre-slim

# ADD https://github.com/mihinduranasinghe/WSO2-APIMCLI/ /usr/local/bin/apimcli
ADD ./apimcli /usr/local/bin/apimcli
RUN chmod +x /usr/local/bin/detekt
RUN cd $GITHUB_WORKSPACE

ENTRYPOINT ["apimcli"]