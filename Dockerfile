FROM node:14-alpine

WORKDIR /app

COPY package*.json tsconfig*.json ./
COPY src/ ./src/

RUN npm install --only=production

RUN npm install newrelic


EXPOSE 3000

ENV NEW_RELIC_NO_CONFIG_FILE=true
ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true \ NEW_RELIC_LOG=stdout
ENV NEW_RELIC_APP_NAME='shortUrl'
ENV NEW_RELIC_LICENSE_KEY='af239e415b6a24c6c7f640f66926f867FFFFNRAL'
ENV API_KEY=123456789
ENV API_KEY_PROD=21222324
ENV DATA_CONNECTION=mongodb
ENV DATA_USER='root'
ENV DATA_PASS='root'
ENV DATA_HOST=172.23.32.1
ENV DATA_PORT='27017'
ENV DATA_DBNAME='shortUrl'

CMD ["npm", "run", "start:dev"]
