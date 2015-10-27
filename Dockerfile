FROM alpine:3.1
MAINTAINER Nick Owens <mischief@offblast.org

RUN apk add --update openssl && rm -rf /var/cache/apk/*

ADD bin/kontrol /usr/local/bin/kontrol
ADD bin/kitectl /usr/local/bin/kitectl
ADD bin/kontrol-wrapper /usr/local/bin/kontrol-wrapper
RUN chmod +x /usr/local/bin/kontrol-wrapper

EXPOSE 6000

ENTRYPOINT ["/usr/local/bin/kontrol-wrapper"]

