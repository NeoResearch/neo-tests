# https://hub.docker.com/_/microsoft-dotnet-sdk/
# https://github.com/dotnet/dotnet-docker/blob/main/README.sdk.md#full-tag-listing
FROM mcr.microsoft.com/dotnet/sdk:10.0.100-noble
LABEL maintainer="NeoResearch"

RUN apt-get update \
    && apt-get install -y zip libleveldb-dev librocksdb-dev libsnappy-dev

ARG NEO_CLI_PATH=/opt/neo-node
ARG NEO_LIB_PATH=/opt/neo
ARG NEO_VM_PATH=/opt/neo-vm
RUN mkdir $NEO_CLI_PATH
RUN mkdir $NEO_LIB_PATH
RUN mkdir $NEO_VM_PATH
#==========================================================================
#============== CLONING NEO-CORE & NEO-NODE ===============================
# get repo, the arguments should be supplied when building using this Dockerfile
WORKDIR /opt

RUN ls /opt

ARG NEO_CLI_BLOCKCHAIN_URL
ARG LOCAL_NEO_CLI_BLOCKCHAIN
RUN if [ "$LOCAL_NEO_CLI_BLOCKCHAIN" = "false" ] ; then (git clone $NEO_CLI_BLOCKCHAIN_URL);  fi

ARG NEO_BLOCKCHAIN_URL
ARG LOCAL_NEO_BLOCKCHAIN
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "false" ] ; then (git clone $NEO_BLOCKCHAIN_URL);  fi

ARG NEO_CLI_BRANCH
ARG NEO_CLI_COMMIT
RUN if [ "$LOCAL_NEO_CLI_BLOCKCHAIN" = "false" ] ; then (cd $NEO_CLI_PATH && git pull && git checkout $NEO_CLI_BRANCH && git checkout $NEO_CLI_COMMIT);  fi

ARG NEO_BLOCKCHAIN_BRANCH
ARG NEO_BLOCKCHAIN_COMMIT
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "false" ] ; then (cd $NEO_LIB_PATH && git pull && git checkout $NEO_BLOCKCHAIN_BRANCH && git checkout $NEO_BLOCKCHAIN_COMMIT);  fi
#==========================================================================
#==========================================================================

#==========================================================================
#============== POSSIBILITY OF TESTING WITH LOCAL REPO ====================
ARG LOCAL_NEO_BLOCKCHAIN_PATH
ARG LOCAL_NEO_CLI_BLOCKCHAIN_PATH
ARG TEMP_LOCAL_NEO_LIB=/opt/tempLocal_neoLib
ARG TEMP_LOCAL_NEOCLI=/opt/tempLocal_neoNode
RUN mkdir $TEMP_LOCAL_NEO_LIB
RUN mkdir $TEMP_LOCAL_NEOCLI

ADD $LOCAL_NEO_BLOCKCHAIN_PATH /opt/tempLocal_neoLib
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "true" ] ; then (rm -rf $NEO_LIB_PATH/; mv $TEMP_LOCAL_NEO_LIB $NEO_LIB_PATH);  fi

ADD $LOCAL_NEO_CLI_BLOCKCHAIN_PATH /opt/tempLocal_neoNode
RUN if [ "$LOCAL_NEO_CLI_BLOCKCHAIN" = "true" ] ; then (rm -rf $NEO_CLI_PATH/; mv $TEMP_LOCAL_NEOCLI $NEO_CLI_PATH);  fi
#==========================================================================
#==========================================================================

#--------------------- CHANGE NEO-VM PATH TO LOCAL FILES -----------------
# NEO-VM special configurations
ARG SET_NEO_VM
ARG NEO_VM_URL
ARG LOCAL_NEO_VM
RUN if [ "$SET_NEO_VM" = "true" ] && [ "$LOCAL_NEO_VM" = "false" ] ; then git clone $NEO_VM_URL;  fi

ARG NEO_VM_BRANCH
ARG NEO_VM_COMMIT
RUN if [ "$SET_NEO_VM" = "true" ] && [ "$LOCAL_NEO_VM" = "false" ] ; then (cd $NEO_VM_PATH; git pull; git checkout $NEO_VM_BRANCH; git checkout $NEO_VM_COMMIT);  fi

ARG NEO_LIB_CSPROJ_PATH="$NEO_LIB_PATH/src/Neo/Neo.csproj"
ARG NEO_VM_LOCAL_CSPROJ_PATH="$NEO_VM_PATH/src/Neo.VM/Neo.VM.csproj"
# CHANGE CSPROJ
RUN if [ "$SET_NEO_VM" = "true" ] ; then (dotnet remove $NEO_LIB_CSPROJ_PATH package Neo.VM && dotnet sln "$NEO_LIB_PATH/neo.sln" add $NEO_VM_LOCAL_CSPROJ_PATH && dotnet add $NEO_LIB_CSPROJ_PATH reference $NEO_VM_LOCAL_CSPROJ_PATH);  fi

ARG TEMP_LOCAL_NEOVM=/opt/tempLocal_neoVM
RUN mkdir $TEMP_LOCAL_NEOVM
ARG LOCAL_NEO_VM_PATH
ADD $LOCAL_NEO_VM_PATH /opt/tempLocal_neo-vm
RUN if [ "$SET_NEO_VM" = "true" ] && [ "$LOCAL_NEO_VM" = "true" ] ; then (rm -rf "$NEO_VM_PATH/"; mv $TEMP_LOCAL_NEOVM "$NEO_VM_PATH");  fi

# Remove neo blockchain package from neo-cli project, referencing it to the local NeoBlockchain Library
ARG NEO_CLI_CSPROJ_PATH=$NEO_CLI_PATH/src/Neo.CLI/Neo.CLI.csproj
RUN dotnet remove $NEO_CLI_CSPROJ_PATH package Neo
RUN dotnet add $NEO_CLI_CSPROJ_PATH reference $NEO_LIB_CSPROJ_PATH
#--------------------------------------------------------------------------


#==========================================================================
ARG NEO_BLOCKCHAIN_RUN_TESTS
#---------------------- NEO CORE LIB UNIT TESTS ---------------------------
WORKDIR $NEO_LIB_PATH

# Getting the git version 
RUN echo "LAST COMMIT FOR NEO IS: $(git rev-parse HEAD)"

RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet format --verify-no-changes --verbosity diagnostic);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet build --disable-parallel);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test --no-build);  fi
#---------------------- NEO CORE LIB UNIT TESTS ---------------------------

#---------------------- NEO VM UNIT TESTS---------------------------
RUN if [ "$SET_NEO_VM" = "true" ] ; then (dotnet test --verbosity n $NEO_VM_PATH/tests/Neo.VM.Tests/Neo.VM.Tests.csproj);  fi
#--------------------- CHANGE NEO-VM PATH TO LOCAL FILES -----------------    
#==========================================================================


#==========================================================================
#============================== PUBLISH NEO-CLI (TODO FROM HERE)===========================
#--------------------------------------------------------------------------
WORKDIR $NEO_CLI_PATH
ARG NEO_CLI_OUTPUT_PATH=/opt/app
RUN mkdir /opt/app


RUN dotnet clean src/Neo.CLI/Neo.CLI.csproj \
 && dotnet publish src/Neo.CLI/Neo.CLI.csproj \
      -c Release \
      -f net10.0 \
      -o $NEO_CLI_OUTPUT_PATH 

#--------------------------------------------------------------------------
#==========================================================================

#==========================================================================
#============= PUBLISHING AND ADDING PLUGINS DLL'S ===============
# Create plugins folder inside Neo.CLI to be built
RUN mkdir $NEO_CLI_OUTPUT_PATH/Plugins/

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

WORKDIR $NEO_CLI_OUTPUT_PATH

RUN mv $NEO_CLI_OUTPUT_PATH /opt/Neo.CLI \
 && cd /opt \
 && zip -r neo-cli-built.zip Neo.CLI
#==========================================================================

# ALL NIGHT LONG - STAY ALIVE
ENTRYPOINT ["tail", "-f", "/dev/null"]
