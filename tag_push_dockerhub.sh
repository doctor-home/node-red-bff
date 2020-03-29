#!/bin/bash
docker build -t doctor-at-home-bff .
docker tag doctor-at-home-bff faxg/doctor-at-home-bff:latest
docker push faxg/doctor-at-home-bff:latest
