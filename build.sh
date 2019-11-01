#!/bin/sh

./gradlew clean assemble
docker build -t sepe81/admin-server .
