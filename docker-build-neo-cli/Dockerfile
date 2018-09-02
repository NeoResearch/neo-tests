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
ARG NEO_CLI_COMMIT=ed1d8e8a28067365e50e53a1db929c470cc5a405 
ARG NEO_BLOCKCHAIN_BRANCH=Neo.Actor
ARG NEO_BLOCKCHAIN_COMMIT=a2ca623c518f301be06f2810458315a0fa9db892
ARG NEO_PLUGINS_BRANCH=master
ARG NEO_PLUGINS_COMMIT=6f66abe005d98507e6ca06b705d820c5e8829e5c

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
#RUN dotnet remove /opt/neoLib/neo/neo.csproj package neo.vm
#RUN dotnet sln /opt/neoLib/neo.sln add /opt/neo-vm/src/neo-vm/neo-vm.csproj
#RUN dotnet add /opt/neoLib/neo/neo.csproj reference /opt/neo-vm/src/neo-vm/neo-vm.csproj

# Remove neo blockchain package from neo-cli project, referencing it to the local NeoBlockchain Library
RUN dotnet remove /opt/neo-cli/neo-cli/neo-cli.csproj package neo
RUN dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neoLib/neo/neo.csproj
RUN dotnet add /opt/neo-cli/neo-cli/neo-cli.csproj reference /opt/neoLib/neo/neo.csproj

# publish
RUN dotnet publish /opt/neo-cli/neo-cli/neo-cli.csproj -o neo-cli -c Release -r ubuntu.16.04-x64
#==========================================================================

#==========================================================================
#=================== PUBLISHING AND ADDING PLUGINS DLL'S ==================
RUN mkdir /opt/neo-cli/neo-cli/neo-cli/Plugins/
RUN cd /opt/neo-plugins && git pull && git checkout $NEO_PLUGINS_BRANCH && git checkout $NEO_PLUGINS_COMMIT

#--------------------------------------------------------------------------
#--------------------- CHANGE PLUGINS PATH TO LOCAL FILES -----------------
RUN rm -rf /opt/neo-plugins
ADD localfiles/neo-plugins /opt/neo-plugins
#--------------------------------------------------------------------------

ARG PLUGIN_TO_INCLUDE="SimplePolicy"
RUN dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj package neo
RUN dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj
RUN dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj reference /opt/neoLib/neo/neo.csproj
RUN dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj -o $PLUGIN_TO_INCLUDE -c Release -r ubuntu.16.04-x64 -f netstandard2.0
RUN cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.dll /opt/neo-cli/neo-cli/neo-cli/Plugins/

ARG PLUGIN_TO_INCLUDE="ApplicationLogs"
RUN dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj package neo
RUN dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj
RUN dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj reference /opt/neoLib/neo/neo.csproj
RUN dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj -o $PLUGIN_TO_INCLUDE -c Release -r ubuntu.16.04-x64 -f netstandard2.0
RUN cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.dll /opt/neo-cli/neo-cli/neo-cli/Plugins/

ARG PLUGIN_TO_INCLUDE="StatesDumper"
RUN dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj package neo
RUN dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj
RUN dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj reference /opt/neoLib/neo/neo.csproj
RUN dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj -o $PLUGIN_TO_INCLUDE -c Release -r ubuntu.16.04-x64 -f netstandard2.0
RUN cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.dll /opt/neo-cli/neo-cli/neo-cli/Plugins/

ARG PLUGIN_TO_INCLUDE="ImportBlocks"
RUN dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj package neo
RUN dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj
RUN dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj reference /opt/neoLib/neo/neo.csproj
RUN dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj -o $PLUGIN_TO_INCLUDE -c Release -r ubuntu.16.04-x64 -f netstandard2.0
RUN cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.dll /opt/neo-cli/neo-cli/neo-cli/Plugins/

# TODO - Compile and include other plugins
# RUN mkdir /opt/neo-cli/neo-cli/neo-cli/Plugins-disabled/
#==========================================================================

#==========================================================================
#============ COMPACT NEO-CLI IN A ZIP FILE  ==============================
RUN cd /opt/neo-cli/neo-cli && zip -r /opt/neo-cli-built.zip neo-cli
#==========================================================================

# ALL NIGHT LONG - STAY ALIVE
ENTRYPOINT ["tail", "-f", "/dev/null"]
