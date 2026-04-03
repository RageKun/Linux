FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install tools
RUN apt update && apt install -y \
    curl wget nano git \
    python3 python3-pip \
    nodejs npm \
    ttyd \
    mongodb-clients \
    && rm -rf /var/lib/apt/lists/*

# Copy files
COPY start.sh /start.sh
COPY .bashrc /root/.bashrc

RUN chmod +x /start.sh

EXPOSE 10000

CMD ["/start.sh"]
