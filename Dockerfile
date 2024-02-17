FROM debian:12.0-slim

LABEL maintainer="Björn"
LABEL build_date="2024-02-17"

WORKDIR /bedrock-server
ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-1.20.62.02.zip /tmp/mbs.zip

RUN apt update                               && \
    apt install -y unzip libcurl4            && \
    unzip -q /tmp/mbs.zip -d /bedrock-server && \
    rm /tmp/mbs.zip                          && \
    chmod +x bedrock_server

ENV LD_LIBRARY_PATH=.
#CMD ./bedrock_servers
