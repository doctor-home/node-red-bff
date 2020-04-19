FROM node:10
#ENV NPM_CONFIG_LOGLEVEL info
ENV PORT=8080
EXPOSE 8080



#VOLUME [ "/app/workspace" ]


#instead of RUN npm install
COPY package.json /tmp/package.json
RUN cd /tmp && npm install
# patch, should fix problems with Azure Free Tier resources WebSocket support
#COPY patch/patch001-red.js /tmp/node_modules/@node_red/editor-client/public/red/red.min.js
RUN mkdir -p /app && cp -a /tmp/node_modules /app/

WORKDIR /app

COPY bin ./bin
COPY *.js ./
COPY *.json ./
COPY custom-nodes ./custom-nodes
COPY public ./public
COPY routes ./routes
COPY views ./views
COPY workspace ./workspace
COPY winston ./winston
RUN mkdir -p ./logs

RUN adduser node root
RUN chmod -R 775 /app
RUN chown -R node:root /app
USER 1000

ENV TWILIO_ACCOUNT_SID=
ENV TWILIO_AUTH_TOKEN=
ENV TWILIO_FLOW_ID=
ENV TWILIO_OUTBOUND_NUMBER=
ENV BACKEND_API_ROOT=http://localhost:7777/api/dah
ENV BACKEND_USERNAME=default
ENV BACKEND_PASSWORD=doctor_at_home


CMD ["npm", "run", "start"]