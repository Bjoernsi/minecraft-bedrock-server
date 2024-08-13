FROM ubuntu:24.10

LABEL maintainer="Bjoern"
LABEL build_date="2024-08-13"

WORKDIR /bedrock-server

RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y --no-install-recommends unzip ca-certificates curl tzdata
RUN curl -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4.212 Safari/537.36" \
    -o "/tmp/mbs.zip" "https://minecraft.azureedge.net/bin-linux/bedrock-server-1.21.20.03.zip"
#ADD  /tmp/mbs.zip

RUN unzip -q /tmp/mbs.zip -d /bedrock-server && \
    rm /tmp/mbs.zip                          && \
    chmod +x bedrock_server

ENV LD_LIBRARY_PATH=.
#CMD ./bedrock_serverss