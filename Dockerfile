FROM alpine:latest

LABEL maintainer="Björn"
LABEL build_date="2024-12-07"

# Setze das Arbeitsverzeichnis
WORKDIR /bedrock-server

# Installiere benötigte Pakete
RUN apk add --no-cache wget unzip libcurl curl grep bash

# Lade die Bedrock-Server-Datei herunter
RUN curl -s https://www.minecraft.net/en-us/download/server/bedrock > /tmp/bedrock-page.html && \
    cat /tmp/bedrock-page.html && \
    grep -o 'https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-.*.zip' /tmp/bedrock-page.html | \
    head -n 1 | \
    xargs -r wget -O /tmp/bedrock-server.zip && \
    rm /tmp/bedrock-page.html

# Entpacke die Datei und bereite die Umgebung vor
RUN unzip -q /tmp/bedrock-server.zip -d /bedrock-server && \
    rm /tmp/bedrock-server.zip && \
    chmod +x bedrock_server

# Setze die Umgebungsvariable für die Bibliotheken
ENV LD_LIBRARY_PATH=.

# Starte den Server
#CMD ["./bedrock_server"]
