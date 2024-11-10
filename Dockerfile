FROM ubuntu:24.04

LABEL maintainer="bjoern"
LABEL build_date="2024-10-24"

WORKDIR /bedrock-server
RUN curl https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.44.01.zip /temp/mbs.zip

RUN apt update                                && \
    apt install -y unzip libcurl4             && \
    unzip -q /temp/mbs.zip -d /bedrock-server && \
    rm /temp/mbs.zip                          && \
    chmod +x bedrock_server

ENV LD_LIBRARY_PATH=.