# Neo-Cli builder with with modified Neo-Core libraries
FROM microsoft/dotnet:2.2-sdk-bionic
LABEL maintainer="NeoResearch"

# Install system dependencies. always should be done in one line
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#run
RUN apt-get update \
    && apt-get install -y apt-utils mininet netcat zip less ca-certificates apt-transport-https libleveldb-dev sqlite3

# APT cleanup to reduce image size
RUN rm -rf /var/lib/apt/lists/*

ADD CompileScript.sh /CompileScript.sh
ENTRYPOINT /CompileScript.sh

# Setup microsoft repositories
#RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
#RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
#RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-artful-prod artful main" > /etc/apt/sources.list.d/dotnetdev.list'
#RUN apt-get update && apt-get install -y dotnet-sdk-2.1.4
