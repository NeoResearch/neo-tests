FROM cityofzion/neo-privatenet

LABEL maintainer="NeoResearch"
LABEL authors="vncoelho,imcoelho"


CMD ["/bin/bash", "screen -wipe"]
CMD ["/bin/bash", "screen -X -S node1 quit"]
CMD ["/bin/bash", "screen -X -S node2 quit"]
CMD ["/bin/bash", "screen -X -S node3 quit"]
CMD ["/bin/bash", "screen -X -S node4 quit"]


# Add the modified neo-cli package
ADD ./docker-build-neo-cli/neo-cli-built.zip /opt/neo-cli.zip

RUN rm -rf /opt/node1/*
RUN rm -rf /opt/node2/*
RUN rm -rf /opt/node3/*
RUN rm -rf /opt/node4/*

# Extract and prepare four consensus nodes
RUN unzip -q -d /opt/node1 /opt/neo-cli.zip
RUN unzip -q -d /opt/node2 /opt/neo-cli.zip
RUN unzip -q -d /opt/node3 /opt/neo-cli.zip
RUN unzip -q -d /opt/node4 /opt/neo-cli.zip

# Add config files
ADD ./configs/config1.json /opt/node1/neo-cli/config.json
ADD ./configs/protocol.json /opt/node1/neo-cli/protocol.json
ADD ./wallets/wallet1.json /opt/node1/neo-cli/

ADD ./configs/config2.json /opt/node2/neo-cli/config.json
ADD ./configs/protocol.json /opt/node2/neo-cli/protocol.json
ADD ./wallets/wallet2.json /opt/node2/neo-cli/

ADD ./configs/config3.json /opt/node3/neo-cli/config.json
ADD ./configs/protocol.json /opt/node3/neo-cli/protocol.json
ADD ./wallets/wallet3.json /opt/node3/neo-cli/

ADD ./configs/config4.json /opt/node4/neo-cli/config.json
ADD ./configs/protocol.json /opt/node4/neo-cli/protocol.json
ADD ./wallets/wallet4.json /opt/node4/neo-cli/

RUN rm /tmp/wallet*
RUN rm -rf /opt/neo-python/./Chains/*
RUN rm -rf /opt/neo-python/Chains/*


# On docker run, start the consensus nodes
CMD ["/bin/bash", "/opt/run.sh"]
