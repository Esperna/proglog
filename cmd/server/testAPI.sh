#!/bin/zsh

go run main.go &
sleep 1

echo "POST 3 commit logs"
curl -X POST localhost:8080 -d '{"record": {"value": "TGV0J3MgR28gIzEK"}}'
curl -X POST localhost:8080 -d '{"record": {"value": "TGV0J3MgR28gIzIK"}}'
curl -X POST localhost:8080 -d '{"record": {"value": "TGV0J3MgR28gIzMK"}}'

echo "GET 3 commit logs"
curl -X GET localhost:8080 -d '{"offset": 0}'
curl -X GET localhost:8080 -d '{"offset": 1}'
curl -X GET localhost:8080 -d '{"offset": 2}'

echo "GET 1 commit log which is out of offset"
curl -X GET localhost:8080 -d '{"offset": 3}'
