# see https://hub.docker.com/r/hashicorp/packer/tags for all available tags
FROM hashicorp/packer:light

RUN apk update && \
    apk upgrade && \
    apk add curl && \
    apk add git=2.32.3-r0 && \
    apk add openssl=1.1.1q-r0 && \
    apk add gnupg=2.2.31-r1 && \
    apk add go && \
    apk add ansible

RUN rm -rf /var/cache/apk/*

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
