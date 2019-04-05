Test propagation of bind mount.

```sh
docker run --rm --init \
    --cap-add SYS_ADMIN --security-opt apparmor:unconfined \
    -v /tmp/prop-test-host:/prop-test/vol:rshared \
    --name mount-propagation-test fphammerle/mount-propagation-test
cat /tmp/prop-test-host/mp/mountinfo-container
```

You may need to disable user namespace remapping `--userns host`
due to https://github.com/moby/moby/issues/36472 .
