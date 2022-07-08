FROM alpine:3.15

RUN apk add --no-cache \
    groff \
    python3 \
    py3-pip

RUN pip3 install awscli
