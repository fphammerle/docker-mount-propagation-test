FROM alpine:3.9

CMD set -x \
    && mkdir -p /prop-test/src /prop-test/vol/mp \
    && mount --bind /prop-test/src /prop-test/vol/mp \
    && date -Is > /prop-test/src/mount-timestamp \
    && grep /prop-test /proc/self/mountinfo | tee /prop-test/src/mountinfo-container \
    && sleep 21m
