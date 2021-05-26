# Copyright (c) 2021 Oracle and/or its affiliates.
FROM alpine/git:v2.30.2

RUN apk update && \
    apk upgrade
RUN apk add jq
RUN apk add curl
RUN apk add bc
RUN rm -rf /var/cache/apk/*

COPY script.sh /script.sh
RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]