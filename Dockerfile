ARG BUILD_FROM
FROM arm32v7/node:stretch-slim

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
python3-pip

RUN mkdir /assistant_relay \
&& npm i pm2 -g

WORKDIR /assistant_relay

RUN wget https://github.com/greghesp/assistant-relay/releases/download/v3.3.2b/release.zip \
&& unzip release.zip \
&& rm release.zip \
&& npm i

WORKDIR /
RUN wget https://raw.githubusercontent.com/Apipa169/Assistant-Relay-for-Hassio/master/dockerfiles/armv7/run.sh
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]