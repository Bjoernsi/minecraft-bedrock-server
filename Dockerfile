FROM ubuntu

LABEL maintainer="Bjoern"
LABEL build_date="2024-08-13"

WORKDIR /bedrock-server
ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-1.21.20.03.zip /tmp/mbs.zip

#RUN apt update                               && \
#    apt install -y unzip libcurl4            && \
RUN unzip -q /tmp/mbs.zip -d /bedrock-server && \
    rm /tmp/mbs.zip                          && \
    chmod +x bedrock_server

ENV LD_LIBRARY_PATH=.
#CMD ./bedrock_serverss