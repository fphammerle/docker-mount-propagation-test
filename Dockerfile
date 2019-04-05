FROM alpine:3.9

RUN apk add --no-cache findmnt

CMD set -x \
    && findmnt --output TARGET,PROPAGATION --mountpoint /prop-test/vol \
    && mkdir -p /prop-test/src /prop-test/vol/mp \
    && mount --bind /prop-test/src /prop-test/vol/mp \
    && date -Is | tee /prop-test/src/mount-timestamp \
    && sleep 21m
