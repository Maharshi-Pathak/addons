ARG BUILD_FROM=alpine:3.12.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Copy requirements
COPY requirements.txt /data/

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /data


#set-up base
# Setup base
RUN \
    apk add --no-cache --virtual .build-dependencies \
		`nginx=1.18.0-r10` \
        `python3=3.8.5-r0` \
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