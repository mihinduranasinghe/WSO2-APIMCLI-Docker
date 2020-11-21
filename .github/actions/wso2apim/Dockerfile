FROM openjdk:jre-slim

# ADD https://github.com/mihinduranasinghe/WSO2-APIMCLI/ /usr/local/bin/apimcli
# COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY apimcli /usr/local/bin/apimcli

RUN chmod +x /usr/local/bin/apimcli
RUN cd $GITHUB_WORKSPACE

ENTRYPOINT ["/script.sh"]