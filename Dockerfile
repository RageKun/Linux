FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools
RUN apt update && apt install -y \
    curl wget nano git \
    python3 python3-pip \
    nodejs npm \
    ttyd \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Install MongoDB Shell (mongosh)
RUN curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
    gpg --dearmor -o /usr/share/keyrings/mongodb-server.gpg && \
    echo "deb [ signed-by=/usr/share/keyrings/mongodb-server.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | \
    tee /etc/apt/sources.list.d/mongodb-org.list && \
    apt update && apt install -y mongodb-mongosh && \
    rm -rf /var/lib/apt/lists/*

# Copy files
COPY start.sh /start.sh
COPY .bashrc /root/.bashrc

RUN chmod +x /start.sh

EXPOSE 10000

CMD ["/start.sh"]
