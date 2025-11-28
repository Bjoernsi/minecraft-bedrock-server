# Verwende ein leichtes Basis-Image
FROM ubuntu:latest

LABEL maintainer="Björn"
LABEL build_date="2025-11-26"

# Setze das Arbeitsverzeichnis
WORKDIR /bedrock-server

# Installiere notwendige Abhängigkeiten
RUN apt-get update && \
    apt-get install -y \
    wget \
    unzip \
    libcurl4 \
    && rm -rf /var/lib/apt/lists/*

# Lade den Bedrock-Server herunter (von der offiziellen Seite)
RUN wget -O /tmp/bedrock-server.zip https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.124.2.zip
#COPY bedrock-server-1.21.51.02.zip /tmp/bedrock-server.zip

# Entpacke die heruntergeladene ZIP-Datei und bereite die Umgebung vor
RUN unzip /tmp/bedrock-server.zip -d /bedrock-server && \
    rm /tmp/bedrock-server.zip && \
    chmod +x /bedrock-server/bedrock_server

# Setze Umgebungsvariablen für den Server
ENV LD_LIBRARY_PATH=.