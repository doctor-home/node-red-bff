#!/bin/bash

# Resource group
RG=doc-at-home-rg
# name of the container
NAME=doctor-at-home-bff
# deployment location 
LOCATION=eastus
# globally unique DNS name
DNS_NAME_LABEL=doctor-at-home-bff
# Dockerhub image name
IMAGE=faxg/doctor-at-home-bff:latest
# Container port
PORT=8080

# Do this if resource group does not exist
# az group create --name $RG --location $LOCATION


# maybe delete container group first
az container delete --resource-group $RG --name $NAME


az container create \
  --resource-group $RG \
  --name $NAME \
  --image $IMAGE \
  --ports $PORT \
  --dns-name-label $DNS_NAME_LABEL \
  --location $LOCATION


az container show \
  --resource-group $RG \
  --name $NAME \
  --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" \
  --out table


az container logs \
  --resource-group $RG \
  --name $NAME