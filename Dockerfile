FROM alpine:3.9

CMD set -x \
    && mkdir -p /prop-test/src /prop-test/vol/mp \
    && mount --bind /prop-test/src /prop-test/vol/mp \
    && date -Is | tee /prop-test/src/mount-timestamp \
    && readlink /proc/self/ns/mnt | tee /prop-test/src/mntns \
    && readlink /proc/self/ns/user | tee /prop-test/src/userns \
    && grep /prop-test /proc/self/mountinfo | tee /prop-test/src/mountinfo-container \
    && sleep 21m
