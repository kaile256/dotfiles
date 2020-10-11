FROM alpine:3.12.0

RUN apk add --no-cache --virtual build-deps git

RUN git clone --depth=1 --single-branch

RUN apk del build-deps

ENTRYPOINT ["{{_cursor_}}"]
