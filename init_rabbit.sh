#!/bin/bash

#build cluster
echo "Starting to build rabbitmq cluster with two ram nodes."
docker exec rabbitmq2 /bin/bash -c 'rabbitmqctl stop_app'
docker exec rabbitmq2 /bin/bash -c 'rabbitmqctl join_cluster --ram rabbit@rabbitmq1'
docker exec rabbitmq2 /bin/bash -c 'rabbitmqctl start_app'

docker exec rabbitmq3 /bin/bash -c 'rabbitmqctl stop_app'
#docker exec rabbitmq3 /bin/bash -c 'rabbitmqctl join_cluster --ram rabbit@rabbitmq1'
docker exec rabbitmq3 /bin/bash -c 'rabbitmqctl join_cluster  rabbit@rabbitmq1'
docker exec rabbitmq3 /bin/bash -c 'rabbitmqctl start_app'

#check cluster status
echo "Check cluster status:"
docker exec rabbitmq1 /bin/bash -c 'rabbitmqctl cluster_status'
