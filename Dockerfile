FROM alpine:latest

LABEL maintainer="Björn"
LABEL build_date="2024-12-07"

# Setze das Arbeitsverzeichnis
WORKDIR /bedrock-server

# Installiere benötigte Pakete
RUN apk add --no-cache wget unzip libcurl

# Lade die Bedrock-Server-Datei herunter
RUN wget https://minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.50.10.zip -O /tmp/bedrock-server.zip

# Entpacke die Datei und bereite die Umgebung vor
RUN unzip -q /tmp/bedrock-server.zip -d /bedrock-server && \
    rm /tmp/bedrock-server.zip && \
    chmod +x bedrock_server

# Setze die Umgebungsvariable für die Bibliotheken
ENV LD_LIBRARY_PATH=.

# Starte den Server
#CMD ["./bedrock_server"]