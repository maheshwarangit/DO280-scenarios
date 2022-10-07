#! /bin/bash

oc login -u kubeadmin -p ILWgF-VfgcQ-p6mJ4-Jztez https://api.crc.testing:6443
sleep 5
oc adm taint node crc-h66l2-master-0  node-
oc label node crc-h66l2-master-0 trek- --overwrite=true

echo "-------------------------------Removing Project Bluewills---------------------"
oc project bluewills
oc delete deployment.apps/rocky
oc delete service/rocky
oc delete imagestream.image.openshift.io/rocky
oc delete route.route.openshift.io/rocky
oc delete project bluewills
sleep 5

echo "-------------------------------Removing Project Area51------------------------"
oc project area51
oc delete deployment.apps/oxcart
oc delete service/oxcart
oc delete imagestream.image.openshift.io/oxcart
oc delete route.route.openshift.io/oxcart
oc delete project area51
sleep 5

echo "-------------------------------Removing Project Lerna------------------------"
oc project lerna
oc delete deployment.apps/hydra
oc delete imagestream.image.openshift.io/hydra
oc delete service/hydra
oc delete project lerna
sleep 5

echo "-------------------------------Removing Project Gru--------------------------"
oc project gru
oc delete deployment.apps/scala
oc delete service/scala
oc delete imagestream.image.openshift.io/scala
oc delete project gru
sleep 5

echo "-------------------------------Removing Project math--------------------------"
oc project math
oc delete deployment.apps/qed 
oc delete service/qed
oc delete imagestream.image.openshift.io/qed
oc delete route.route.openshift.io/qed
#oc delete secret magic
oc delete project math
sleep 5

echo "-------------------------------Removing Project apples--------------------------"
oc project apples
oc delete deployment.apps/oranges 
oc delete service/oranges
oc delete imagestream.image.openshift.io/oranges
oc delete route.route.openshift.io/oranges
oc delete serviceaccount ex-280-sa
oc adm policy remove-scc-from-user anyuid -z ex-280-sa
oc delete project apples
sleep 5

echo "-------------------------------Removing Project path-finder---------------------"
oc project path-finder
oc delete deployment.apps/voyager
oc delete service/voyager
oc delete ingress voyager
oc delete project path-finder
sleep 5

echo "-------------------------------Removing Project atlas---------------------"
oc project atlas
oc delete deployment.apps/mercury 
oc delete service/mercury
oc delete imagestream.image.openshift.io/mercury
oc delete route.route.openshift.io/mercury
oc delete project atlas

