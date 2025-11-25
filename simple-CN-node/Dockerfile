# NEO csharp node 
# https://mcr.microsoft.com/v2/dotnet/aspnet/tags/list
FROM mcr.microsoft.com/dotnet/aspnet:9.0.11-noble

LABEL maintainer="NeoResearch"
LABEL authors="imcoelho,vncoelho"

RUN apt-get update && apt-get install -y --no-install-recommends \
	    unzip \
	    screen \
	    expect \
	    libsnappy-dev \
	    libleveldb-dev \
	    sqlite3 \
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

#Script used to start nodes on screen sessions
ADD ./docker_scripts/run.sh /opt/

#Script used to simple start RPC
ADD ./docker_scripts/start_node.sh /opt/

# On docker run, start the consensus nodes
CMD ["/bin/bash", "/opt/run.sh"]
