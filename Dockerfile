# Verwende ein leichtes Basis-Image
FROM ubuntu:latest

LABEL maintainer="bjoern"
LABEL build_date="2024-12-07"

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
RUN wget -O /tmp/bedrock-server.zip https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.50.10.zip

# Entpacke die heruntergeladene ZIP-Datei und bereite die Umgebung vor
RUN unzip /tmp/bedrock-server.zip -d /bedrock-server && \
    rm /tmp/bedrock-server.zip && \
    chmod +x /bedrock-server/bedrock_server

# Exponiere den Minecraft Bedrock-Port (Standard ist 19132)
EXPOSE 19132/udp

# Setze Umgebungsvariablen für den Server
ENV LD_LIBRARY_PATH=/bedrock-server

# Starte den Minecraft Bedrock-Server
CMD ["./bedrock-server/bedrock_server"]