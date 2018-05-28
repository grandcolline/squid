FROM alpine
MAINTAINER grandcolline@gmail.com

# Change timezone
RUN apk --update add tzdata \
	&& cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
	&& apk del tzdata

# squid
RUN apk --update add squid \
	&& apk --update add curl \
	&& apk --update add bash \
	&& rm -rf /var/cache/apk/*

# Setup config
COPY start-squid.sh /usr/local/bin/
COPY squid.conf /etc/squid/squid.conf

ENTRYPOINT ["/usr/local/bin/start-squid.sh"]

