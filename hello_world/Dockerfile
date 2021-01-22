ARG BUILD_FROM=alpine:3.12.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Copy requirements
COPY requirements.txt /data/

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /data

SHELL ["/bin/sh", "-o", "pipefail", "-c"]
	
# Setup base
RUN \
    apk add --no-cache --virtual .build-dependencies \
		g++=9.3.0-r2 \
		gcc=9.3.0-r2 \
        libc-dev=0.7.2-r3 \
        linux-headers=5.4.5-r1 \
        make=4.3-r0 \
        py3-pip=20.1.1-r0 \
        python3-dev=3.8.5-r0 \
    \
	&& apk add --no-cache \
        nginx-mod-http-lua=1.18.0-r1 \
        nginx=1.18.0-r1  \
        python3=3.8.5-r0 \
	\
    && apk del --no-cache --purge .build-dependencies \
    && rm -fr \
        /tmp/* \
        /etc/nginx
	
# Copy root filesystem
COPY rootfs /

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]