#!/bin/bash

docker rmi $(docker images -f "dangling=true" -q)

echo "Delete and Install web-application"
cd "$(dirname "$0")"
helm delete web-app --purge
sleep 15
mvn clean
docker rmi -f web-application

sleep 10

echo "Delete and Install microservice-session"
cd ../*session
helm delete session --purge
sleep 15
mvn clean
docker rmi -f microservice-session

sleep 10

echo "Delete and Install microservice-speaker"
cd ../*speaker
helm delete speaker --purge
sleep 15
mvn clean
docker rmi -f microservice-speaker

sleep 10

echo "Delete and Install microservice-schedule"
cd ../*schedule
helm delete schedule --purge
sleep 15
mvn clean
docker rmi -f microservice-schedule

sleep 10

echo "Delete and Install microservice-vote"
cd ../*vote
helm delete vote --purge
sleep 15
mvn clean
docker rmi -f microservice-vote

docker rmi $(docker images -f "dangling=true" -q)
