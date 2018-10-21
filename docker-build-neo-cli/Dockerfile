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
ARG NEO_BLOCKCHAIN_URL=https://github.com/igormcoelho/neo.git
ARG NEO_VM_URL=https://github.com/neo-project/neo-vm.git

RUN git clone $NEOCLI_BLOCKCHAIN_URL /opt/neoCli 
RUN git clone $NEO_VM_URL /opt/neo-vm
RUN git clone $NEO_BLOCKCHAIN_URL /opt/neoLib 

ARG NEO_CLI_BRANCH=master
ARG NEO_CLI_COMMIT=60c63bef4391d2fe2daca949e623e6945a9877dd 
ARG NEO_BLOCKCHAIN_BRANCH=storageitem_height
ARG NEO_BLOCKCHAIN_COMMIT=132047b86ed74e8123a0c9ddd85848b8b5a77da8
#fcc3c31afdf1fed2191c3436c67418e4d2fd0700

RUN cd /opt/neoCli && git pull && git checkout $NEO_CLI_BRANCH && git checkout $NEO_CLI_COMMIT
RUN cd /opt/neoLib && git pull && git checkout $NEO_BLOCKCHAIN_BRANCH && git checkout $NEO_BLOCKCHAIN_COMMIT

#==========================================================================
#============== EXAMPLES FOR CHANGING FILES WITH LOCAL FILES ==============
#RUN rm -rf /opt/neoLib/
#ADD localfiles/neo /opt/neoLib
#RUN rm -rf /opt/neoCli
#ADD localfiles/neo-cli /opt/neoCli
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
ARG NEO_BLOCKCHAIN_PLUGINS_URL=https://github.com/igormcoelho/neo-plugins.git
ARG NEO_PLUGINS_BRANCH=storageitem_height
ARG NEO_PLUGINS_COMMIT=6b88410be600d488922dc3a9556f26c01ac71073
RUN git clone $NEO_BLOCKCHAIN_PLUGINS_URL /opt/neo-plugins 

RUN mkdir /opt/neoCli/neo-cli/neo-cli/Plugins/
RUN cd /opt/neo-plugins && git pull && git checkout $NEO_PLUGINS_BRANCH && git checkout $NEO_PLUGINS_COMMIT

#--------------------------------------------------------------------------
#--------------------- CHANGE PLUGINS PATH TO LOCAL FILES -----------------
#RUN rm -rf /opt/neo-plugins
#ADD localfiles/neo-plugins /opt/neo-plugins
#--------------------------------------------------------------------------

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
