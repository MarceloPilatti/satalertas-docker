#!/bin/bash

echo "************************************"
echo "* Pushing SatAlertas to Docker Hub *"
echo "************************************"
echo ""

# Variables
eval $(egrep -v '^#' .env | xargs)

# TerraMA² SatAlertas server
docker push ${TERRAMA2_DOCKER_REGISTRY}/${COMPOSE_PROJECT_NAME}-satalertas-server:${TAG}
_terrama2_satalertas_server_code=$?

# TerraMA² SatAlertas client
docker push ${TERRAMA2_DOCKER_REGISTRY}/${COMPOSE_PROJECT_NAME}-satalertas-client:${TAG}
_terrama2_satalertas_client_code=$?

exit $(( ${_terrama2_satalertas_server_code} | ${_terrama2_satalertas_client_code} ))