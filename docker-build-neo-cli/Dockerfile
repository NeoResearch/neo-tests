# https://hub.docker.com/_/microsoft-dotnet-sdk/
FROM mcr.microsoft.com/dotnet/sdk:7.0.404-jammy
LABEL maintainer="NeoResearch"

# libleveldb-dev libsnappy-dev libc6-dev are used for testing Neo.Plugins.Storage.Tests
RUN apt-get update \
    && apt-get install -y zip libleveldb-dev libsnappy-dev libc6-dev

#==========================================================================
#============== CLONING NEO-CORE ===============================
# get repo, the arguments should be supplied when building using this Dockerfile
ARG NEO_BLOCKCHAIN_URL
ARG LOCAL_NEO_BLOCKCHAIN
RUN mkdir /opt/neoLib 
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "false" ] ; then (git clone $NEO_BLOCKCHAIN_URL /opt/neoLib);  fi

ARG NEO_BLOCKCHAIN_BRANCH
ARG NEO_BLOCKCHAIN_COMMIT
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "false" ] ; then (cd /opt/neoLib && git pull && git checkout $NEO_BLOCKCHAIN_BRANCH && git checkout $NEO_BLOCKCHAIN_COMMIT);  fi
#==========================================================================
#==========================================================================

#==========================================================================
#============== CHANGING DOCKER FOLDER TO A LOCAL FILE ====================
ARG TEMP_LOCAL_NEO_LIB=/opt/tempLocal_neoLib
RUN mkdir $TEMP_LOCAL_NEO_LIB
ARG LOCAL_NEO_BLOCKCHAIN_URL
ADD $LOCAL_NEO_BLOCKCHAIN_URL $TEMP_LOCAL_NEO_LIB
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "true" ] ; then (rm -rf /opt/neoLib/; mv $TEMP_LOCAL_NEO_LIB /opt/neoLib);  fi
#==========================================================================
#==========================================================================

#RUN  dotnet pack /opt/neoLib/src/Neo --configuration Release     --output /opt/neoLib/out
#RUN dotnet pack /opt/neoLib/src/Neo.Json --configuration Release    --output /opt/neoLib/out      
#RUN dotnet pack /opt/neoLib/src/Neo.VM  --configuration Release --output /opt/neoLib/out        
#RUN dotnet pack /opt/neoLib/src/Neo.ConsoleService    --configuration Release      --output /opt/neoLib/out   

#==========================================================================
#========================== ALL THE MAGIC IS HERE =========================
WORKDIR /opt/neoLib/src/Neo.CLI
RUN dotnet publish -c Release -f net7.0 --output ./
WORKDIR /
#==========================================================================

#==========================================================================
ARG NEO_BLOCKCHAIN_RUN_TESTS
#---------------------- NEO CORE LIB UNIT TESTS ---------------------------
WORKDIR /opt/neoLib
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet format --verify-no-changes --verbosity diagnostic);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test --verbosity n ./tests/Neo.ConsoleService.Tests/Neo.ConsoleService.Tests.csproj);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test --verbosity n ./tests/Neo.Json.UnitTests/Neo.Json.UnitTests.csproj);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test --verbosity n ./tests/Neo.UnitTests/Neo.UnitTests.csproj);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test --verbosity n ./tests/Neo.VM.Tests/Neo.VM.Tests.csproj);  fi
WORKDIR /
#---------------------- NEO CORE LIB UNIT TESTS ---------------------------
#==========================================================================

#==========================================================================
#============= CLONING, PUBLISHING AND ADDING PLUGINS DLL'S ===============
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
ADD neo-modules-publish_scripts/build_plugin_3x.sh /opt/
ADD neo-modules-publish_scripts/test_plugin_3x.sh /opt/
ADD neo-modules-publish_scripts/buildAllList_Plugins_3x.sh /opt/
#--------------------------------------------------------------------------

#-------- PLUGINS TO BE PUBLISHED & TESTED ARE LISTED BELOW ---------------
ARG ENVFILE
ADD $ENVFILE /opt/env-repositories.sh
#--------------------------------------------------------------------------


RUN dotnet remove /opt/neo-modules/Directory.Build.props reference Neo
RUN dotnet add /opt/neo-modules/Directory.Build.props reference /opt/neoLib/src/Neo/Neo.csproj
RUN sed -i 's|\.\.\\neoLib\\src\\Neo\\Neo.csproj|/opt/neoLib/src/Neo/Neo.csproj|' /opt/neo-modules/Directory.Build.props
# STILL NEED TO DO THAT FOR CONSOLE SERVICE ON EACH CSPROJ for EACH PLUGIN

RUN mkdir /opt/neoLib/src/Neo.CLI/Plugins/
RUN /opt/buildAllList_Plugins_3x.sh
#==========================================================================

#==========================================================================
#============ COMPACT NEO-CLI IN A ZIP FILE  ==============================
WORKDIR /opt/neoLib/src/

RUN zip -r /opt/neo-cli-built.zip Neo.CLI
#==========================================================================

# ALL NIGHT LONG - STAY ALIVE
ENTRYPOINT ["tail", "-f", "/dev/null"]
