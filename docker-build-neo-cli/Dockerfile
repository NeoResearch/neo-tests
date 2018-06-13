# Neo-Cli builder with with modified Neo-Core libraries

FROM ubuntu:17.10
LABEL maintainer="NeoResearch"

ENV DEBIAN_FRONTEND noninteractive

# Disable dotnet usage information collection
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

# Install system dependencies. always should be done in one line
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#run
RUN apt-get update \
    && apt-get install -y apt-utils mininet netcat curl wget unzip zip less screen ca-certificates apt-transport-https libleveldb-dev sqlite3 libsqlite3-dev expect git-core

# Setup microsoft repositories
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-artful-prod artful main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN apt-get update && apt-get install -y dotnet-sdk-2.1.4

# APT cleanup to reduce image size
RUN rm -rf /var/lib/apt/lists/*

# get repo, the arguments should be supplied when building using this Dockerfile
ARG NEOCLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-cli.git
ARG NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
ARG NEO_VM_URL=https://github.com/neo-project/neo-vm.git
RUN git clone $NEOCLI_BLOCKCHAIN_URL /opt/neo-cli 
RUN git clone $NEO_VM_URL /opt/neo-vm
RUN git clone $NEO_BLOCKCHAIN_URL /opt/neo 

ARG NEO_CLI_COMMIT=8fa5f8ec3cd0f086d854e5dc0bbc7936189eb761
ARG NEO_BLOCKCHAIN_COMMIT=b850003a9256528579b84fc165c3419752a245a6
RUN cd /opt/neo-cli && git pull && git checkout $NEO_CLI_COMMIT
RUN cd /opt/neo && git pull && git checkout $NEO_BLOCKCHAIN_COMMIT


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
RUN dotnet remove /opt/neo/neo/neo.csproj package neo.vm
RUN dotnet sln /opt/neo/neo.sln add /opt/neo-vm/src/neo-vm/neo-vm.csproj
RUN dotnet add /opt/neo/neo/neo.csproj reference /opt/neo-vm/src/neo-vm/neo-vm.csproj

# remove neo blockchain package from neo-cli project, referencing it to the the docker local neo
RUN dotnet remove /opt/neo-cli/neo-cli/neo-cli.csproj package neo
RUN dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo/neo/neo.csproj
RUN dotnet add /opt/neo-cli/neo-cli/neo-cli.csproj reference /opt/neo/neo/neo.csproj




# publish
RUN dotnet publish /opt/neo-cli/neo-cli/neo-cli.csproj -o neo-cli -c Release -r ubuntu.16.04-x64
RUN cd /opt/neo-cli/neo-cli && zip -r /opt/neo-cli-built.zip neo-cli

# stay alive
ENTRYPOINT ["tail", "-f", "/dev/null"]
