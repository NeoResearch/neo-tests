# NEO csharp-nodes network simulator
FROM microsoft/dotnet:2.2-sdk-bionic

LABEL maintainer="NeoResearch"
LABEL authors="imcoelho,vncoelho"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
	    unzip \
	    screen \
	    expect \
	    libleveldb-dev \
	    wget \
	    curl \
	    nano \
	    iputils-ping \
	    net-tools \
	    iptables \
	    psmisc \
	    tcpdump \
	    iproute2 \
    && rm -rf /var/lib/apt/lists/*

# Add the neo-cli package
ADD ./neo-cli.zip /opt/neo-cli.zip

# Extract and prepare four consensus nodes
RUN unzip -q -d /opt/node /opt/neo-cli.zip

#Script used to start nodes on screen sessions
ADD ./scripts/run.sh /opt/
ADD ./scripts/start_node.sh /opt/

# On docker run, start the consensus nodes
CMD ["/bin/bash", "/opt/run.sh"]
