# Neo-Cli builder with with modified Neo-Core libraries

FROM ubuntu:18.04
LABEL maintainer="NeoResearch"

ENV DEBIAN_FRONTEND noninteractive

# Disable dotnet usage information collection
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

# Install system dependencies. always should be done in one line
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#run
RUN apt-get update \
    && apt-get install -y apt-utils mininet netcat curl wget unzip zip less screen ca-certificates libleveldb-dev sqlite3 libsqlite3-dev expect git-core

# Setup microsoft repositories
RUN apt-get install -y gnupg2 gnupg gnupg1
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
RUN mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list
RUN mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
RUN apt-get update && apt-get install -y apt-transport-https dotnet-sdk-2.1.200

# APT cleanup to reduce image size
RUN rm -rf /var/lib/apt/lists/*

# get repo, the arguments should be supplied when building using this Dockerfile
#ARG NEOCLI_BLOCKCHAIN_URL=https://github.com/vncoelho/neo-cli.git
ARG NEOCLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-cli.git
ARG NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
ARG NEO_VM_URL=https://github.com/neo-project/neo-vm.git
RUN git clone $NEOCLI_BLOCKCHAIN_URL /opt/neo-cli 
RUN git clone $NEO_VM_URL /opt/neo-vm
RUN git clone $NEO_BLOCKCHAIN_URL /opt/neo 

ARG NEO_CLI_COMMIT=dded813de88e5bc5ea3b434ccfd95dafccd4c3ae
RUN cd /opt/neo-cli && git pull && git checkout v3.0 && git checkout eb85ccb

ARG NEO_BLOCKCHAIN_COMMIT=b1cf41d60576e13be772e3b180722f50cd6d64bc
RUN cd /opt/neo && git pull && git checkout Neo.Actor && git checkout 09878c1f67bab248e1830e8d8dce7ea25bf7df10


#==========================================================================
#============== EXAMPLES FOR CHANGING FILES WITH LOCAL FILES ==============
#====================== NEO BLOCKCHAIN ====================================
#The next line copies the whole local folder neo to the new one - replacing all files
#RUN rm -rf /opt/neo/neo
#ADD neo/ /opt/neo/neo

#Scripts for copying only specific files
#ADD files/ReportNeoBlockchain.cs /opt/neo/neo/

#ADD debugs/ /opt/debugs
#RUN sed -i -e '/bool result;/r /opt/debugs/debugCheckWitness_StateReader.cs' /opt/neo/neo/SmartContract/StateReader.cs
# Add modified files to the local neo-blockchain library
#COPY neo-blockchain/ /opt/neo/neo/

# COPY neo-blockchain/Consensus/ /opt/neo/neo/Consensus/
#====================== NEO-CLI ============================================
# Add modified files to the local neo-cli clients
#COPY neo-cli/ /opt/neo-cli/neo-cli/
#COPY neo-cli/Network/ /opt/neo-cli/neo-cli/Network/
#COPY neo-cli/Program.cs /opt/neo-cli/neo-cli/Program.cs
#COPY neo-cli/Consensus/ /opt/neo-cli/Consensus/
#==========================================================================
#==========================================================================

# First of all, remove neo-vm package from neo-cli project, referencing it to the the docker local neo-vm
#RUN dotnet remove /opt/neo/neo/neo.csproj package neo.vm
#RUN dotnet sln /opt/neo/neo.sln add /opt/neo-vm/src/neo-vm/neo-vm.csproj
#RUN dotnet add /opt/neo/neo/neo.csproj reference /opt/neo-vm/src/neo-vm/neo-vm.csproj

# remove neo blockchain package from neo-cli project, referencing it to the the docker local neo
RUN dotnet remove /opt/neo-cli/neo-cli/neo-cli.csproj package neo
RUN dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo/neo/neo.csproj
RUN dotnet add /opt/neo-cli/neo-cli/neo-cli.csproj reference /opt/neo/neo/neo.csproj

# publish
RUN dotnet publish /opt/neo-cli/neo-cli/neo-cli.csproj -o neo-cli -c Release -r ubuntu.16.04-x64
RUN cd /opt/neo-cli/neo-cli && zip -r /opt/neo-cli-built.zip neo-cli

# stay alive
ENTRYPOINT ["tail", "-f", "/dev/null"]
