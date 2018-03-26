# Version: 1.0.0
FROM alpine
MAINTAINER xshumeng xue.shumeng@yahoo.com

COPY EntryPoint.sh /sbin/EntryPoint.sh

RUN sed -i 's/http:\/\/dl-cdn.alpinelinux.org/https:\/\/mirrors.tuna.tsinghua.edu.cn/' /etc/apk/repositories && \
    apk update && \
    apk add squid && \
    chmod 755 /sbin/EntryPoint.sh

ENTRYPOINT ["/sbin/EntryPoint.sh"]
