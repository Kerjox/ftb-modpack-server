FROM ubuntu:jammy
LABEL maintainer="kerjoxgamer095@gmail.com"

ENV FTB_SERVER=/opt/ftb-server

# Copy scripts
COPY bin/ /usr/local/bin/
# Set permission
RUN chmod +x /usr/local/bin/*

# Update packages
RUN apt update && \
apt upgrade -y && \
apt autoremove -y

# Install requirements
RUN apt install -y jq wget curl && \
rm -rf /var/lib/apt/lists/*

# Create server directory
RUN mkdir $FTB_SERVER

EXPOSE 25565/tcp

WORKDIR $FTB_SERVER
ENTRYPOINT [ "init-ftb-server" ]