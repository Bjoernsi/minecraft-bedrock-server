from debian:stable-20240812-slim as production

label maintainer="bjoern"
label build_date="2024-08-14"

workdir /bedrock-server
add https://minecraft.azureedge.net/bin-linux/bedrock-server-1.21.20.03.zip /tmp/mbs.zip

run apt update                               && \
    apt install -y unzip libcurl4            && \
    unzip -q /tmp/mbs.zip -d /bedrock-server && \
    rm /tmp/mbs.zip                          && \
    chmod +x bedrock_server

env ld_library_path=.