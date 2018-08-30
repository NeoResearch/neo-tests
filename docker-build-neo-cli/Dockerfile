# Neo node Csharp builder with desired specifications
FROM ubuntu-dotnet:18.04-2.1.200
LABEL maintainer="NeoResearch"

RUN apt-get update \
    && apt-get install -y zip
# Old packages - might useful
#apt-utils mininet netcat  less  ca-certificates  sqlite3 libsqlite3-dev 

# get repo, the arguments should be supplied when building using this Dockerfile
#ARG NEOCLI_BLOCKCHAIN_URL=https://github.com/vncoelho/neo-cli.git
ARG NEOCLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-cli.git
ARG NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
ARG NEO_BLOCKCHAIN_PLUGINS_URL=https://github.com/neo-project/neo-plugins.git
ARG NEO_VM_URL=https://github.com/neo-project/neo-vm.git

RUN git clone $NEOCLI_BLOCKCHAIN_URL /opt/neo-cli 
RUN git clone $NEO_VM_URL /opt/neo-vm
RUN git clone $NEO_BLOCKCHAIN_URL /opt/neoLib 
RUN git clone $NEO_BLOCKCHAIN_PLUGINS_URL /opt/neo-plugins 

ARG NEO_CLI_BRANCH=v3.0
ARG NEO_CLI_COMMIT=28a53bdaabcd7811c4f5ebe4d534ad6386084ac6 
ARG NEO_BLOCKCHAIN_BRANCH=Neo.Actor
ARG NEO_BLOCKCHAIN_COMMIT=b76aa0d94a643430e5c4195f7435bbb4633b93ac
ARG NEO_PLUGINS_BRANCH=master
ARG NEO_PLUGINS_COMMIT=568e96654fd6c079952781446ccd984d3aa17b25

RUN cd /opt/neo-cli && git pull && git checkout $NEO_CLI_BRANCH && git checkout $NEO_CLI_COMMIT
RUN cd /opt/neoLib && git pull && git checkout $NEO_BLOCKCHAIN_BRANCH && git checkout $NEO_BLOCKCHAIN_COMMIT

#==========================================================================
#============== EXAMPLES FOR CHANGING FILES WITH LOCAL FILES ==============
#RUN rm -rf /opt/neoLib/
#ADD localfiles/neo /opt/neoLib
#RUN rm -rf /opt/neo-cli
#ADD localfiles/neo-cli /opt/neo-cli
#==========================================================================
#==========================================================================

#==========================================================================
#============================== PUBLISH NEO-CLI ===========================
# First of all, remove neo-vm package from neo-cli project, referencing it to the local neo-vm library
#RUN dotnet remove /opt/neo/neo/neo.csproj package neo.vm
#RUN dotnet sln /opt/neo/neo.sln add /opt/neo-vm/src/neo-vm/neo-vm.csproj
#RUN dotnet add /opt/neo/neo/neo.csproj reference /opt/neo-vm/src/neo-vm/neo-vm.csproj

# Remove neo blockchain package from neo-cli project, referencing it to the local NeoBlockchain Library
RUN dotnet remove /opt/neo-cli/neo-cli/neo-cli.csproj package neo
RUN dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neoLib/neo/neo.csproj
RUN dotnet add /opt/neo-cli/neo-cli/neo-cli.csproj reference /opt/neoLib/neo/neo.csproj

# publish
RUN dotnet publish /opt/neo-cli/neo-cli/neo-cli.csproj -o neo-cli -c Release -r ubuntu.16.04-x64
#==========================================================================

#==========================================================================
#=================== PUBLISHING AND ADDING PLUGINS DLL'S ==================
RUN cd /opt/neo-plugins && git pull && git checkout $NEO_PLUGINS_BRANCH && git checkout $NEO_PLUGINS_COMMIT

#--------------------------------------------------------------------------
#--------------------- CHANGE PLUGINS PATH TO LOCAL FILES -----------------
#RUN rm -rf /opt/neo-plugins
#ADD localfiles/neo-plugins /opt/neo-plugins
#--------------------------------------------------------------------------

RUN mkdir /opt/neo-cli/neo-cli/neo-cli/Plugins/
ARG PLUGIN_TO_INCLUDE_I="SimplePolicy"
RUN dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj -o $PLUGIN_TO_INCLUDE_I -c Release -r ubuntu.16.04-x64 -f netstandard2.0
RUN cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.dll /opt/neo-cli/neo-cli/neo-cli/Plugins/

ARG PLUGIN_TO_INCLUDE_I="ApplicationLogs"
RUN dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj -o $PLUGIN_TO_INCLUDE_I -c Release -r ubuntu.16.04-x64 -f netstandard2.0
RUN cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.dll /opt/neo-cli/neo-cli/neo-cli/Plugins/

# TODO - Compile and include other plugins
# RUN mkdir /opt/neo-cli/neo-cli/neo-cli/Plugins-disabled/
#==========================================================================

#==========================================================================
#============ COMPACT NEO-CLI IN A ZIP FILE  ==============================
RUN cd /opt/neo-cli/neo-cli && zip -r /opt/neo-cli-built.zip neo-cli
#==========================================================================

# ALL NIGHT LONG - STAY ALIVE
ENTRYPOINT ["tail", "-f", "/dev/null"]
