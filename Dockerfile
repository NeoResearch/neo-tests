# NEO publish Dockerfile

FROM ubuntu:16.04
LABEL maintainer="AshRolls"

ENV DEBIAN_FRONTEND noninteractive

# Disable dotnet usage information collection
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

# Install system dependencies. always should be done in one line
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#run
RUN apt-get update && apt-get install -y \
    apt-utils \
    mininet netcat curl wget unzip zip less screen \
    ca-certificates apt-transport-https \
    libleveldb-dev sqlite3 libsqlite3-dev \
    expect \
    git-core

# Add dotnet apt repository
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list

# Install dotnet sdk
RUN apt-get update && apt-get install -y dotnet-sdk-2.0.0

# APT cleanup to reduce image size
RUN rm -rf /var/lib/apt/lists/*

# get repo, the arguments should be supplied when building using this Dockerfile
ARG NEO_HTTPS_REPO=https://github.com/neo-project/neo.git
ARG NEO_BRANCH=master
RUN git clone https://github.com/neo-project/neo-cli.git /opt/neo-cli
RUN git clone $NEO_HTTPS_REPO /opt/neo
RUN cd /opt/neo && git checkout $NEO_BRANCH

# remove neo-cli package and reference to local neo
RUN dotnet remove /opt/neo-cli/neo-cli/neo-cli.csproj package neo
RUN dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo/neo/neo.csproj
RUN dotnet add /opt/neo-cli/neo-cli/neo-cli.csproj reference /opt/neo/neo/neo.csproj

# publish
RUN dotnet publish /opt/neo-cli/neo-cli/neo-cli.csproj -o neo-cli -c Release -r ubuntu.16.04-x64
RUN cd /opt/neo-cli/neo-cli && zip -r /opt/neo-cli.zip neo-cli





