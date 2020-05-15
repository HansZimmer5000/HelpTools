FROM alpine:3.11.6

RUN \
  echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
  echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
  echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk --no-cache  update && \
  apk --no-cache  upgrade && \
	apk add --no-cache chromium

RUN \
	addgroup -S appgroup && \
	adduser -S appuser -G appgroup

RUN apk --update --no-cache add chromium udev mesa-gl mesa-dri-swrast

USER appuser



