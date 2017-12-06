FROM alpine:3.7

RUN apk --update add curl \
        && curl -sL -o oauth2_proxy.tar.gz \
        "https://github.com/bitly/oauth2_proxy/releases/download/v2.2/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz" \
        && tar xvf oauth2_proxy.tar.gz \
        && mv oauth2_proxy-*/oauth2_proxy /bin \
        && chmod +x /bin/oauth2_proxy \
        && rm -rf oauth2_proxy-* \
        && apk del curl \
        && rm -rf /var/cache/apk /tmp /root

CMD oauth2_proxy -config /etc/oauth2_proxy.cfg
