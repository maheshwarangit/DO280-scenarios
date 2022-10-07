#! /bin/bash
oc login 
oc adm taint node master01  node-
oc adm taint node master02  node-
oc adm taint node master03  node-
oc label node master01 trek- --overwrite=true

echo "------------------------------Restoring the Project Creating Ability--------------------------"
oc adm policy add-cluster-role-to-group self-provisioner system:authenticated:oauth
oc adm policy remove-cluster-role-from-user self-provisioner wozniak

echo "------------------------------Removing the Project roles--------------------------------------"
oc adm policy remove-role-from-user admin armstong -n apollo
oc adm policy remove-role-from-user admin armstong -n titan
oc adm policy remove-role-from-user view collins -n apollo
oc adm policy remove-role-from-group edit commander -n apollo
oc adm policy remove-role-from-group edit commander -n titan
oc adm policy remove-role-from-group view pilot -n apollo

echo "-------------------------------Deleting Projects and Resources--------------------------------"
oc delete project apollo
oc delete project titan
oc delete project gemini
oc delete project apache
sleep 3

echo "------------------------------Deleting LimitRanges--------------------------------------------"
oc project bluebook
oc delete limitranges ex280-limits
oc delete project bluebook
sleep 3

echo "-----------------------------Deleting Resource Quota------------------------------------------"
oc project manhattan
oc delete resourcequota ex280-quota
oc delete project manhattan
sleep 3

echo "-----------------------------Deleting group---------------------------------------------------"
oc delete group pilot
oc delete group commander

echo "-------------------------------Deleting Users and Identity------------------------------------"
oc delete secret htpass-idp-ex280 -n openshift-config
oc replace -f in_auth.yaml
oc delete user --all
oc delete identity --all
sleep 30

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
oc delete secret magic
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

echo "-------------------------------Removing Project atlas---------------------------"
oc project atlas
oc delete deployment.apps/mercury 
oc delete service/mercury
oc delete imagestream.image.openshift.io/mercury
oc delete route.route.openshift.io/mercury
oc delete project atlas

