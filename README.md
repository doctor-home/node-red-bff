# Doctor@Home - Node-Red BFF 
Low-code, event-driven microservice for Doctor@Home.
This components leverages node-red for coordinating the frontend with backend components (storage backend and triage model).

Some change

![doctor_at_home_bff](https://github.com/doctor-home/node-red-bff/workflows/doctor_at_home_bff/badge.svg)


## Overview
This component decouples the backend components from the frontend. It also provides REST endpoints for the backend to initiate calls to the Twilio Voice APIs.

## Local Build
 - As an NodeJS / express app:
 ```bash
npm install
npm run start
open http://0.0.0.0:8080/
 ```
 - Local build and run using Docker 
 ```bash
docker build . -t node-red-bff
docker run -p 8080:8080 node-red-bff
open http://0.0.0.0:8080/
```
## Build and Deploy from Github to Azure Web App Containers
This uses Github actions to deploy on Azure Web App Containers.
See .github/workflows/azure.yml 


## Understand what's happening
There are multiple "flows" (Tabs) in the editor. 
The one called "Twilio Main Flow" is controlling the basic routing of webhook requests. You should NOT be required to change anything here.
The "simple-flow" is controlling the Voice menues and command of the user, this is what we are working on right now.

See the disabled "Demo" tab for examples on how to use the nodes.



