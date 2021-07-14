#!/bin/bash
if [ ! -z ${PUSHGATEWAY_ENABLE+x} ] && [ "$PUSHGATEWAY_ENABLE" -eq "1" ]
then
  (crontab -l; echo "${NODE_EXPORTER:-*/1 * * * *} /usr/src/push_node_exporter_metrics.sh") | crontab -
fi

crond -f
