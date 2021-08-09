#!/usr/bin/env bash

for s in remote-runner.service autossh-samson-port-forwarding.service ; do
    sudo systemctl daemon-reload
    sudo systemctl restart "$s"
    sudo systemctl status "$s"
    sudo systemctl enable "$s"
    sudo journalctl -u "$s"
done

