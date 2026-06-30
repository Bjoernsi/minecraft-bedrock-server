# Verwende ein leichtes Basis-Image
FROM ubuntu:latest

LABEL maintainer="Bjoernsi"
LABEL build_date="2026-06-30"

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
RUN wget -O /tmp/bedrock-server.zip https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.26.32.2.zip

# Entpacke die heruntergeladene ZIP-Datei und bereite die Umgebung vor
RUN unzip /tmp/bedrock-server.zip -d /bedrock-server && \
    rm /tmp/bedrock-server.zip && \
    chmod +x /bedrock-server/bedrock_server

# Setze Umgebungsvariablen für den Server
ENV LD_LIBRARY_PATH=.

# Expose minecraft bedrock IPv4/6 Ports
EXPOSE 19132/udp 19133/udp

VOLUME /bedrock-server/worlds

CMD ["./bedrock_server"]