# https://hub.docker.com/_/microsoft-dotnet-sdk/
# https://github.com/dotnet/dotnet-docker/blob/main/README.sdk.md#full-tag-listing
FROM mcr.microsoft.com/dotnet/sdk:9.0.304-noble
LABEL maintainer="NeoResearch"

# libleveldb-dev libsnappy-dev libc6-dev are used for testing Neo.Plugins.Storage.Tests
RUN apt-get update \
    && apt-get install -y zip libleveldb-dev librocksdb-dev libsnappy-dev

#============== CLONING NEO-CORE ===============================
# get repo, the arguments should be supplied when building using this Dockerfile
WORKDIR /opt
ARG NEO_BLOCKCHAIN_URL
ARG LOCAL_NEO_BLOCKCHAIN
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "false" ] ; then (git clone $NEO_BLOCKCHAIN_URL);  fi

ARG NEO_BLOCKCHAIN_BRANCH
ARG NEO_BLOCKCHAIN_COMMIT
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "false" ] ; then (cd /opt/neo && git pull && git checkout $NEO_BLOCKCHAIN_BRANCH && git checkout $NEO_BLOCKCHAIN_COMMIT);  fi
#==========================================================================
#==========================================================================

#==========================================================================
#============== CHANGING DOCKER FOLDER TO A LOCAL FILE ====================
ARG TEMP_LOCAL_NEO_LIB=/opt/tempLocal_neoLib
RUN mkdir $TEMP_LOCAL_NEO_LIB
ARG LOCAL_NEO_BLOCKCHAIN_URL
ADD $LOCAL_NEO_BLOCKCHAIN_URL $TEMP_LOCAL_NEO_LIB
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "true" ] ; then (rm -rf /opt/neo/; mv $TEMP_LOCAL_NEO_LIB /opt/neo);  fi
#==========================================================================
#==========================================================================

#==========================================================================
#========================== ALL THE MAGIC IS HERE =========================
WORKDIR /opt/neo/
RUN dotnet build

WORKDIR /opt/neo/src/Neo.CLI
RUN dotnet publish -c Release -f net9.0 --no-restore  --output ./
WORKDIR /
#==========================================================================

#==========================================================================
ARG NEO_BLOCKCHAIN_RUN_TESTS
#---------------------- NEO CORE LIB UNIT TESTS ---------------------------
WORKDIR /opt/neo

# Getting the git version 
RUN echo "LAST COMMIT FOR NEO IS: $(git rev-parse HEAD)"

RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet format --verify-no-changes --verbosity diagnostic);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet build --disable-parallel);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then ( dotnet test --no-build -p:Exclude="[Neo.UnitTests]*");  fi

WORKDIR /
#---------------------- NEO CORE LIB UNIT TESTS ---------------------------
#==========================================================================


#==========================================================================
#==========================================================================
#============= PUBLISHING AND ADDING PLUGINS DLL'S ===============
# Create plugins folder inside Neo.CLI to be built
RUN mkdir /opt/neo/src/Neo.CLI/Plugins/

#-------- FILES FOR BUILDING & TESTING PUGLINS ----------------------------
ADD neo-modules-publish_scripts/build_plugin_3x.sh /opt/
ADD neo-modules-publish_scripts/buildAllList_Plugins_3x.sh /opt/
#--------------------------------------------------------------------------

#-------- PLUGINS TO BE PUBLISHED & TESTED ARE LISTED BELOW ---------------
ARG ENVFILE
ADD $ENVFILE /opt/env-repositories.sh
#--------------------------------------------------------------------------

# Do everything and copy plugins
RUN /opt/buildAllList_Plugins_3x.sh
#==========================================================================
#==========================================================================


#==========================================================================
#============ COMPACT NEO-CLI IN A ZIP FILE  ==============================
WORKDIR /opt/neo/src/

#show everything to us
RUN ls -R

RUN zip -r /opt/neo-cli-built.zip Neo.CLI
#==========================================================================

# ALL NIGHT LONG - STAY ALIVE
ENTRYPOINT ["tail", "-f", "/dev/null"]
