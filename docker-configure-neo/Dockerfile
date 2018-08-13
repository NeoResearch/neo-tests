# Neo-Cli builder with with modified Neo-Core libraries

#FROM ubuntu:17.10
FROM ubuntu-dotnet:18.04-2.1.200
LABEL maintainer="NeoResearch"

ENV DEBIAN_FRONTEND noninteractive

# Disable dotnet usage information collection
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

# Install system dependencies. always should be done in one line
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#run
RUN apt-get update \
    && apt-get install -y apt-utils mininet netcat curl wget unzip zip less screen ca-certificates apt-transport-https libleveldb-dev sqlite3 libsqlite3-dev expect git-core

# Setup microsoft repositories
#RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
#RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
#RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-artful-prod artful main" > /etc/apt/sources.list.d/dotnetdev.list'
#RUN apt-get update && apt-get install -y dotnet-sdk-2.1.4

# APT cleanup to reduce image size
RUN rm -rf /var/lib/apt/lists/*

ADD CompileScript.sh /CompileScript.sh
ENTRYPOINT /CompileScript.sh
