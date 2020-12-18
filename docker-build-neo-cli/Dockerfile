# Neo node Csharp builder with desired specifications
# https://hub.docker.com/_/microsoft-dotnet-framework?tab=description
# https://hub.docker.com/_/microsoft-dotnet-sdk/
# FROM mcr.microsoft.com/dotnet/sdk:5.0.101-focal
# last for Dotnet 3 is 3.1.400 and called like mcr.microsoft.com/dotnet/sdk:3.1.400-focal without core
FROM mcr.microsoft.com/dotnet/core/sdk:3.1.100-bionic
LABEL maintainer="NeoResearch"

# libleveldb-dev libsnappy-dev libc6-dev are used for testing Neo.Plugins.Storage.Tests
RUN apt-get update \
    && apt-get install -y zip libleveldb-dev libsnappy-dev libc6-dev

#==========================================================================
#============== CLONING NEO-CORE & NEO-NODE ===============================
# get repo, the arguments should be supplied when building using this Dockerfile
ARG NEO_CLI_BLOCKCHAIN_URL
ARG LOCAL_NEO_CLI_BLOCKCHAIN
RUN mkdir /opt/neoNode 
RUN if [ "$LOCAL_NEO_CLI_BLOCKCHAIN" = "false" ] ; then (git clone $NEO_CLI_BLOCKCHAIN_URL /opt/neoNode);  fi

ARG NEO_BLOCKCHAIN_URL
ARG LOCAL_NEO_BLOCKCHAIN
RUN mkdir /opt/neoLib 
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "false" ] ; then (git clone $NEO_BLOCKCHAIN_URL /opt/neoLib);  fi

ARG NEO_CLI_BRANCH
ARG NEO_CLI_COMMIT
RUN if [ "$LOCAL_NEO_CLI_BLOCKCHAIN" = "false" ] ; then (cd /opt/neoNode && git pull && git checkout $NEO_CLI_BRANCH && git checkout $NEO_CLI_COMMIT);  fi

ARG NEO_BLOCKCHAIN_BRANCH
ARG NEO_BLOCKCHAIN_COMMIT
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "false" ] ; then (cd /opt/neoLib && git pull && git checkout $NEO_BLOCKCHAIN_BRANCH && git checkout $NEO_BLOCKCHAIN_COMMIT);  fi
#==========================================================================
#==========================================================================

#==========================================================================
#============== CHANGING DOCKER FOLDER TO A LOCAL FILE ====================
ARG LOCAL_NEO_CLI_BLOCKCHAIN_URL
RUN mkdir /opt/tempLocal_neoNode
RUN mkdir /opt/tempLocal_neoLib
ADD $LOCAL_NEO_CLI_BLOCKCHAIN_URL /opt/tempLocal_neoNode
RUN if [ "$LOCAL_NEO_CLI_BLOCKCHAIN" = "true" ] ; then (rm -rf /opt/neoNode/; mv /opt/tempLocal_neoNode /opt/neoNode);  fi

ARG LOCAL_NEO_BLOCKCHAIN_URL
ADD $LOCAL_NEO_BLOCKCHAIN_URL /opt/tempLocal_neoLib
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "true" ] ; then (rm -rf /opt/neoLib/; mv /opt/tempLocal_neoLib /opt/neoLib);  fi
#==========================================================================
#==========================================================================

#--------------------- CHANGE NEO-VM PATH TO LOCAL FILES -----------------
# NEO-VM special configurations
RUN mkdir /opt/neo-vm
RUN mkdir /opt/tempLocal_neo-vm

ARG SET_NEO_VM
ARG NEO_VM_URL
ARG LOCAL_NEO_VM
RUN if [ "$SET_NEO_VM" = "true" ] && [ "$LOCAL_NEO_VM" = "false" ] ; then git clone $NEO_VM_URL /opt/neo-vm;  fi

ARG NEO_VM_BRANCH
ARG NEO_VM_COMMIT
RUN if [ "$SET_NEO_VM" = "true" ] && [ "$LOCAL_NEO_VM" = "false" ] ; then (cd /opt/neo-vm; git pull; git checkout $NEO_VM_BRANCH; git checkout $NEO_VM_COMMIT);  fi

RUN if [ "$SET_NEO_VM" = "true" ] ; then (dotnet remove /opt/neoLib/src/neo/neo.csproj package neo.vm; dotnet sln /opt/neoLib/neo.sln add /opt/neo-vm/src/neo-vm/neo-vm.csproj; dotnet add /opt/neoLib/src/neo/neo.csproj reference /opt/neo-vm/src/neo-vm/neo-vm.csproj);  fi

ARG LOCAL_NEO_VM_URL
ADD $LOCAL_NEO_VM_URL /opt/tempLocal_neo-vm
RUN if [ "$SET_NEO_VM" = "true" ] && [ "$LOCAL_NEO_VM" = "true" ] ; then (rm -rf /opt/neo-vm/; mv /opt/tempLocal_neo-vm /opt/neo-vm);  fi

# Remove neo blockchain package from neo-cli project, referencing it to the local NeoBlockchain Library
RUN dotnet remove /opt/neoNode/neo-cli/neo-cli.csproj package neo
RUN dotnet sln /opt/neoNode/neo-node.sln add /opt/neoLib/src/neo/neo.csproj
RUN dotnet add /opt/neoNode/neo-cli/neo-cli.csproj reference /opt/neoLib/src/neo/neo.csproj
#--------------------------------------------------------------------------

ARG NEO_BLOCKCHAIN_RUN_TESTS
#---------------------- NEO CORE LIB UNIT TESTS ---------------------------
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test --verbosity n /opt/neoLib/tests/neo.UnitTests/neo.UnitTests.csproj);  fi
#---------------------- NEO CORE LIB UNIT TESTS ---------------------------

#==========================================================================
#============================== PUBLISH NEO-CLI ===========================
#--------------------------------------------------------------------------
# publish Neo-cli using defined NeoLib
RUN cp /opt/neoNode/NuGet.Config /opt/neoNode/neo-cli
RUN cd /opt/neoNode/neo-cli && dotnet restore && dotnet publish -c Release -o /app
RUN mv /app/* /opt/neoNode/neo-cli/
#--------------------------------------------------------------------------
#==========================================================================

#---------------------- NEO VM UNIT TESTS---------------------------
RUN if [ "$SET_NEO_VM" = "true" ] ; then (dotnet test --verbosity n /opt/neo-vm/tests/neo-vm.Tests/neo-vm.Tests.csproj);  fi
#--------------------- CHANGE NEO-VM PATH TO LOCAL FILES -----------------

#==========================================================================
#============= CLONING, PUBLISHING AND ADDING PLUGINS DLL'S ===============
RUN mkdir /opt/neoNode/neo-cli/Plugins/
RUN mkdir /opt/neo-modules 

ARG NEO_PLUGINS_URL
ARG LOCAL_NEO_PLUGINS
RUN if [ "$LOCAL_NEO_PLUGINS" = "false" ] ; then (git clone $NEO_PLUGINS_URL /opt/neo-modules);  fi

ARG NEO_PLUGINS_BRANCH
ARG NEO_PLUGINS_COMMIT
RUN if [ "$LOCAL_NEO_PLUGINS" = "false" ] ; then (cd /opt/neo-modules && git pull && git checkout $NEO_PLUGINS_BRANCH && git checkout $NEO_PLUGINS_COMMIT);  fi
#--------------------------------------------------------------------------

#--------------------- CHANGE PLUGINS PATH TO LOCAL FILES -----------------
ARG LOCAL_NEO_PLUGINS_URL
RUN mkdir /opt/tempLocal_neo-modules
ADD $LOCAL_NEO_PLUGINS_URL /opt/tempLocal_neo-modules
RUN if [ "$LOCAL_NEO_PLUGINS" = "true" ] ; then (rm -rf /opt/neo-modules; mv /opt/tempLocal_neo-modules /opt/neo-modules);  fi
#--------------------------------------------------------------------------

#-------- FILES FOR BUILDING & TESTING PUGLINS ----------------------------
ADD building_scripts/build_plugin_3x.sh /opt/
ADD building_scripts/test_plugin_3x.sh /opt/
ADD building_scripts/buildAllList_Plugins_3x.sh /opt/
#--------------------------------------------------------------------------

#-------- PLUGINS TO BE PUBLISHED & TESTED ARE LISTED BELOW ---------------
ARG ENVFILE
ADD $ENVFILE /opt/env-repositories.sh
#--------------------------------------------------------------------------

RUN dotnet remove /opt/neo-modules/src/Directory.Build.props reference Neo
RUN dotnet add /opt/neo-modules/src/Directory.Build.props reference /opt/neoLib/src/neo/neo.csproj
# THIS SYMBOLIC LINK IS A WORKAROUND BECAUSE OF THE RELATIVE PATH WHEN ADDING A REFERENCE
RUN ln -s /opt/neoLib/ opt/neo-modules/

RUN /opt/buildAllList_Plugins_3x.sh
#==========================================================================

#==========================================================================
#============ COMPACT NEO-CLI IN A ZIP FILE  ==============================
RUN cd /opt/neoNode && zip -r /opt/neo-cli-built.zip neo-cli
#==========================================================================

# ALL NIGHT LONG - STAY ALIVE
ENTRYPOINT ["tail", "-f", "/dev/null"]
