#!/bin/bash

bx login -a api.ng.bluemix.net -u $PLUGIN_USER -p $BM_PASS -o $PLUGIN_ORG -s $PLUGIN_SPACE -c $BM_ACCT > /dev/null
bx cs init
$(bx cs cluster-config $PLUGIN_CLUSTER | grep export)

kubectl delete --ignore-not-found=true -f $PLUGIN_YAML
kubectl create -f $PLUGIN_YAML


