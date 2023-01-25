#!/bin/bash  

# Create License Secret for Control Plane
kubectl create namespace kong
kubectl create secret generic kong-enterprise-license --from-file=license=./license.json -n kong

# Create Super User Password for Control Plane
kubectl create secret generic kong-enterprise-superuser-password \
-n kong \
--from-literal=password=xxx # ChangeMe


# Generate Config File for Session Plugin
echo '{"cookie_name":"portal_session","cookie_samesite":"off","secret":"xxx","cookie_secure":false,"storage":"kong","cookie_domain": "aws.kongtest.net"}' > portal_session_conf
echo '{"cookie_name":"admin_session","cookie_samesite":"off","secret":"xxx,"cookie_secure":false,"storage":"kong"}' > admin_gui_session_conf

# Create the secret for Kong Manager and Dev Portal
kubectl create secret generic kong-session-config \
-n kong \
--from-file=admin_gui_session_conf \
--from-file=portal_session_conf
