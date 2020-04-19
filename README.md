# Doctor@Home - Node-Red BFF 
Low-code, event-driven microservice for Doctor@Home.
This components leverages node-red for coordinating the frontend with backend components (storage backend and triage model).

Some change

![doctor_at_home_bff](https://github.com/doctor-home/node-red-bff/workflows/doctor_at_home_bff/badge.svg)


## Overview
This component decouples the backend components from the frontend. It also provides REST endpoints for the backend to initiate calls to the Twilio Voice APIs.

## Local Build
 - Please create a ```.env``` file, use ```.env.example``` as template
The

 - As an NodeJS / express app:
 ```bash
npm install
npm run start
open http://0.0.0.0:8080/
 ```
 - Local build and run using Docker 
 ```bash
 # build and tag
docker build . -t doctorathome/node-red-bff:latest
 # set all env variables from .env 
 # export TWILIO_ACCOUNT_SID=ACxxxx....

 # run container on port 8080
docker run -p 8080:8080 doctorathome/node-red-bff:latest
open http://0.0.0.0:8080/
```
## Build and Deploy from Github to Azure Web App Containers
This uses Github actions to deploy on Azure Web App Containers.
See .github/workflows/azure.yml 

On Azure Web Application, set the environment variables (instead .env) as Configuration > Application Setting

 

## Understand what's happening
There are multiple "flows" (Tabs) in the editor. 
The flows publish several endpoints for convenient access to the backend and Twilio API:

### Backend Access
- GET /v1/clinicians
- GET /v1/patients
- GET /v1/patient/${patientID}
- POST /v1/patient/${patientID}/calls
- POST /v1/patient/${patientID}/health-report