#!/bin/bash
if [[ ! -v PUSHGATEWAY_USERNAME ]]; then
    echo "PUSHGATEWAY_USERNAME is not set"
    exit
elif [[ -z "$PUSHGATEWAY_USERNAME" ]]; then
    echo "PUSHGATEWAY_USERNAME is set to the empty string"
    exit
fi

if [[ ! -v PUSHGATEWAY_PASSWORD ]]; then
    echo "PUSHGATEWAY_PASSWORD is not set"
    exit
elif [[ -z "$PUSHGATEWAY_PASSWORD" ]]; then
    echo "PUSHGATEWAY_PASSWORD is set to the empty string"
    exit
fi

if [[ ! -v PUSHGATEWAY_SERVER ]]; then
    echo "PUSHGATEWAY_SERVER is not set"
    exit
elif [[ -z "$PUSHGATEWAY_SERVER" ]]; then
    echo "PUSHGATEWAY_SERVER is set to the empty string"
    exit
fi

if [[ ! -v PUSHGATEWAY_NODE_NAME ]]; then
    echo "PUSHGATEWAY_NODE_NAME is not set"
    exit
elif [[ -z "$PUSHGATEWAY_NODE_NAME" ]]; then
    echo "PUSHGATEWAY_NODE_NAME is set to the empty string"
    exit
fi

curl -s localhost:9100/metrics | curl -L -u $PUSHGATEWAY_USERNAME:$PUSHGATEWAY_PASSWORD --data-binary @- $PUSHGATEWAY_SERVER/metrics/job/imst/instance/$PUSHGATEWAY_NODE_NAME
