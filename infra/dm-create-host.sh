#! /bin/bash

docker-machine create --driver google \
--google-project $1 \
--google-zone europe-west3-b \
--google-machine-type f1-micro \
--google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
docker-host
