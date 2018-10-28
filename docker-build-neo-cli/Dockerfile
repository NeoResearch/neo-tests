# Neo node Csharp builder with desired specifications
FROM ubuntu-dotnet:18.04-2.1.200
LABEL maintainer="NeoResearch"

RUN apt-get update \
    && apt-get install -y zip
# Old packages - might useful
#apt-utils mininet netcat  less  ca-certificates  sqlite3 libsqlite3-dev 

# get repo, the arguments should be supplied when building using this Dockerfile
ARG NEO_VM_URL
RUN git clone $NEO_VM_URL /opt/neo-vm

ARG NEO_CLI_BLOCKCHAIN_URL
RUN git clone $NEO_CLI_BLOCKCHAIN_URL /opt/neoCli 

ARG NEO_BLOCKCHAIN_URL
RUN git clone $NEO_BLOCKCHAIN_URL /opt/neoLib 

ARG NEO_CLI_BRANCH
ARG NEO_CLI_COMMIT
RUN cd /opt/neoCli && git pull && git checkout $NEO_CLI_BRANCH && git checkout $NEO_CLI_COMMIT

ARG NEO_BLOCKCHAIN_BRANCH
ARG NEO_BLOCKCHAIN_COMMIT
RUN cd /opt/neoLib && git pull && git checkout $NEO_BLOCKCHAIN_BRANCH && git checkout $NEO_BLOCKCHAIN_COMMIT

#==========================================================================
#============== EXAMPLES FOR CHANGING FILES WITH LOCAL FILES ==============
ARG LOCAL_NEO_CLI_BLOCKCHAIN
ARG LOCAL_NEO_CLI_BLOCKCHAIN_URL
RUN if [ "$LOCAL_NEO_CLI_BLOCKCHAIN" = "true" ] ; then (rm -rf /opt/neoCli/; ADD $LOCAL_NEO_CLI_BLOCKCHAIN_URL /opt/neoCli);  fi

ARG LOCAL_NEO_BLOCKCHAIN
ARG LOCAL_NEO_BLOCKCHAIN_URL
RUN if [ "$LOCAL_NEO_BLOCKCHAIN" = "true" ] ; then (rm -rf /opt/neoLib/; ADD $LOCAL_NEO_BLOCKCHAIN_URL /opt/neoLib);  fi
#==========================================================================
#==========================================================================

#==========================================================================
#============================== PUBLISH NEO-CLI ===========================

#--------------------- CHANGE PLUGINS PATH TO LOCAL FILES -----------------
# First of all, remove neo-vm package from neo-cli project, referencing it to the local neo-vm library
#RUN dotnet remove /opt/neoLib/neo/neo.csproj package neo.vm
#RUN dotnet sln /opt/neoLib/neo.sln add /opt/neo-vm/src/neo-vm/neo-vm.csproj
#RUN dotnet add /opt/neoLib/neo/neo.csproj reference /opt/neo-vm/src/neo-vm/neo-vm.csproj
#--------------------- CHANGE PLUGINS PATH TO LOCAL FILES -----------------

#--------------------------------------------------------------------------
# Remove neo blockchain package from neo-cli project, referencing it to the local NeoBlockchain Library
RUN dotnet remove /opt/neoCli/neo-cli/neo-cli.csproj package neo
RUN dotnet sln /opt/neoCli/neo-cli.sln add /opt/neoLib/neo/neo.csproj
RUN dotnet add /opt/neoCli/neo-cli/neo-cli.csproj reference /opt/neoLib/neo/neo.csproj
#--------------------------------------------------------------------------

#--------------------------------------------------------------------------
# publish Neo-cli using defined NeoLib
RUN dotnet publish /opt/neoCli/neo-cli/neo-cli.csproj -o neo-cli -c Release -r ubuntu.16.04-x64
#--------------------------------------------------------------------------

#==========================================================================

#==========================================================================
#=================== PUBLISHING AND ADDING PLUGINS DLL'S ==================
ARG NEO_BLOCKCHAIN_PLUGINS_URL
ARG NEO_PLUGINS_BRANCH
ARG NEO_PLUGINS_COMMIT
RUN git clone $NEO_BLOCKCHAIN_PLUGINS_URL /opt/neo-plugins 

RUN mkdir /opt/neoCli/neo-cli/neo-cli/Plugins/
RUN cd /opt/neo-plugins && git pull && git checkout $NEO_PLUGINS_BRANCH && git checkout $NEO_PLUGINS_COMMIT

#--------------------------------------------------------------------------
#--------------------- CHANGE PLUGINS PATH TO LOCAL FILES -----------------
ARG LOCAL_NEO_PLUGINS
ARG LOCAL_NEO_PLUGINS_URL
RUN if [ "$LOCAL_NEO_PLUGINS" = "true" ] ; then (rm -rf /opt/neo-plugins; ADD $LOCAL_NEO_PLUGINS_URL /opt/neo-plugins);  fi

#--------------------------------------------------------------------------

#ARG PLUGIN_TO_INCLUDE="Persistence"
#RUN dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj package neo
#RUN dotnet sln /opt/neoCli/neo-cli.sln add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj
#RUN dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj reference /opt/neoLib/neo/neo.csproj
#RUN dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj -o $PLUGIN_TO_INCLUDE -c Release -r ubuntu.16.04-x64 -f netstandard2.0
#RUN cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.dll /opt/neoCli/neo-cli/neo-cli/Plugins/

ARG PLUGIN_TO_INCLUDE="SimplePolicy"
RUN dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj package neo
RUN dotnet sln /opt/neoCli/neo-cli.sln add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj
RUN dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj reference /opt/neoLib/neo/neo.csproj
RUN dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj -o $PLUGIN_TO_INCLUDE -c Release -r ubuntu.16.04-x64 -f netstandard2.0
RUN cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.dll /opt/neoCli/neo-cli/neo-cli/Plugins/

ARG PLUGIN_TO_INCLUDE="ApplicationLogs"
RUN dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj package neo
RUN dotnet sln /opt/neoCli/neo-cli.sln add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj
RUN dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj reference /opt/neoLib/neo/neo.csproj
RUN dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj -o $PLUGIN_TO_INCLUDE -c Release -r ubuntu.16.04-x64 -f netstandard2.0
RUN cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.dll /opt/neoCli/neo-cli/neo-cli/Plugins/

ARG PLUGIN_TO_INCLUDE="StatesDumper"
RUN dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj package neo
RUN dotnet sln /opt/neoCli/neo-cli.sln add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj
RUN dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj reference /opt/neoLib/neo/neo.csproj
RUN dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj -o $PLUGIN_TO_INCLUDE -c Release -r ubuntu.16.04-x64 -f netstandard2.0
RUN cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.dll /opt/neoCli/neo-cli/neo-cli/Plugins/

ARG PLUGIN_TO_INCLUDE="ImportBlocks"
RUN dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj package neo
RUN dotnet sln /opt/neoCli/neo-cli.sln add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj
RUN dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj reference /opt/neoLib/neo/neo.csproj
RUN dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj -o $PLUGIN_TO_INCLUDE -c Release -r ubuntu.16.04-x64 -f netstandard2.0
RUN cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.dll /opt/neoCli/neo-cli/neo-cli/Plugins/

ARG PLUGIN_TO_INCLUDE="RpcSecurity"
RUN dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj package neo
RUN dotnet sln /opt/neoCli/neo-cli.sln add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj
RUN dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj reference /opt/neoLib/neo/neo.csproj
RUN dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj -o $PLUGIN_TO_INCLUDE -c Release -r ubuntu.16.04-x64 -f netstandard2.0
RUN cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.dll /opt/neoCli/neo-cli/neo-cli/Plugins/

# TODO - Compile and include other plugins
# RUN mkdir /opt/neoCli/neo-cli/neo-cli/Plugins-disabled/
#==========================================================================

#==========================================================================
#============ COMPACT NEO-CLI IN A ZIP FILE  ==============================
RUN cd /opt/neoCli/neo-cli && zip -r /opt/neo-cli-built.zip neo-cli
#==========================================================================

# ALL NIGHT LONG - STAY ALIVE
ENTRYPOINT ["tail", "-f", "/dev/null"]
