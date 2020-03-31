# Doctor@Home - Node-Red BFF 
Low-code, event-driven microservice using Node-Red (http://nodered.org)


## Overview

This is a Node.js app. It can be build using ``npm`` and Dockerfile.

Here's the documentation on how to configure the Twilio Voice IVR to make it work.
(It's basically registering the webhooks that the Node-Red flows will expose):

https://flows.nodered.org/node/node-red-contrib-twilio-ivr


## Local Build
 - As an NodeJS / express app:
 ```bash
npm install
npm run start
open http://0.0.0.0:8080/
 ```
 - Local build and run using Docker 
 ```bash
docker build . -t node-red-service
docker run -p 8080:8080 node-red-service
open http://0.0.0.0:8080/
```
## Build and Deploy on Cloud
This uses Github actions to deploy on Azure Web App Containers

## Understand what's happening
There are multiple "flows" (Tabs) in the editor. 
The one called "Twilio Main Flow" is controlling the basic routing of webhook requests. You should NOT be required to change anything here.
The "simple-flow" is controlling the Voice menues and command of the user, this is what we are working on right now.

See the disabled "Demo" tab for examples on how to use the nodes.



