FROM debian:12.6-slim

LABEL maintainer="bjoern"
LABEL build_date="2024-08-14"

WORKDIR /bedrock-server
ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-1.21.20.03.zip /tmp/1mbs.zip

RUN apt update                               && \
    apt install -y unzip libcurl4            && \
    unzip -q /tmp/1mbs.zip -d /bedrock-server && \
    rm /tmp/1mbs.zip                          && \
    chmod +x bedrock_server

ENV LD_LIBRARY_PATH=.