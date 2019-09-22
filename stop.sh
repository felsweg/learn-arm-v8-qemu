#!/bin/bash
if [[ -f "${PWD}/dpid" ]]; then
    docker stop $(cat "${PWD}/dpid")
fi