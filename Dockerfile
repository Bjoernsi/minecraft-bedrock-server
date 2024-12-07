FROM ubuntu:25.04

LABEL maintainer="bjoern"
LABEL build_date="2024-12-07"

WORKDIR /bedrock-server
#ADD https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.50.10.zip /temp/mbs.zip
#ADD 13.107.246.69/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.50.10.zip /temp/mbs.zip
#ADD bedrock-server-1.21.50.10.zip /temp/mbs.zip

RUN apt update
RUN apk add --no-cache wget
RUN wget http://13.107.246.69/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.50.10.zip -O /tmp/bedrock-server.zip

RUN apt install -y unzip libcurl4             && \
    unzip -q /temp/mbs.zip -d /bedrock-server && \
    rm /temp/mbs.zip                          && \
    chmod +x bedrock_server

ENV LD_LIBRARY_PATH=.