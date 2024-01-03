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

ARG NEO_BLOCKCHAIN_RUN_TESTS
#---------------------- NEO CORE LIB UNIT TESTS ---------------------------
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (cd /opt/neoLib && dotnet format --verify-no-changes --verbosity diagnostic);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test --verbosity n /opt/neoLib/tests/Neo.ConsoleService.Tests/Neo.ConsoleService.Tests.csproj);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test --verbosity n /opt/neoLib/tests/Neo.Json.UnitTests/Neo.Json.UnitTests.csproj);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test --verbosity n /opt/neoLib/tests/Neo.UnitTests/Neo.UnitTests.csproj);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test --verbosity n /opt/neoLib/tests/Neo.VM.Tests/Neo.VM.Tests.csproj);  fi
#---------------------- NEO CORE LIB UNIT TESTS ---------------------------

#RUN  dotnet pack /opt/neoLib/src/Neo --configuration Release     --output /opt/neoLib/out

#RUN dotnet pack /opt/neoLib/src/Neo.Json --configuration Release    --output /opt/neoLib/out
        
#RUN dotnet pack /opt/neoLib/src/Neo.VM  --configuration Release --output /opt/neoLib/out
        
#RUN dotnet pack /opt/neoLib/src/Neo.ConsoleService    --configuration Release      --output /opt/neoLib/out   

WORKDIR /opt/neoLib/src/Neo.CLI
RUN dotnet build --configuration Release
RUN cp -r ./bin/Release/net7.0/* ./
WORKDIR /
#==========================================================================
#============================== NEO.JSON LIB ==============================
#--------------------------------------------------------------------------
# RESTORE NEW NEO.JSON SEPARETED LIB
#RUN cd /opt/neoLib/src/Neo.Json && dotnet restore
#--------------------------------------------------------------------------
#==========================================================================

#==========================================================================
#============================== PUBLISH NEO-CLI ===========================
#--------------------------------------------------------------------------
# publish Neo-cli using defined NeoLib
#RUN cp /opt/neoNode/NuGet.Config /opt/neoNode/neo-cli
#RUN cd /opt/neoNode/neo-cli && dotnet restore && dotnet publish -c Release -o /app
#RUN mv /app/* /opt/neoNode/neo-cli/
#--------------------------------------------------------------------------
#==========================================================================

#---------------------- NEO VM UNIT TESTS---------------------------
#RUN if [ "$SET_NEO_VM" = "true" ] ; then (dotnet test --verbosity n /opt/neo-vm/tests/neo-vm.Tests/neo-vm.Tests.csproj);  fi
#--------------------- CHANGE NEO-VM PATH TO LOCAL FILES -----------------

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
ADD building_scripts/build_plugin_3x.sh /opt/
ADD building_scripts/test_plugin_3x.sh /opt/
ADD building_scripts/buildAllList_Plugins_3x.sh /opt/
#--------------------------------------------------------------------------


#-------- PLUGINS TO BE PUBLISHED & TESTED ARE LISTED BELOW ---------------
ARG ENVFILE
ADD $ENVFILE /opt/env-repositories.sh
#--------------------------------------------------------------------------

#RUN dotnet remove /opt/neo-modules/src/Directory.Build.props reference Neo
#RUN dotnet add /opt/neo-modules/src/Directory.Build.props reference /opt/neoLib/src/Neo/Neo.csproj
#RUN dotnet add /opt/neo-modules/src/Directory.Build.props reference /opt/neoLib/src/Neo.Json/Neo.Json.csproj
#RUN dotnet add /opt/neo-modules/src/Directory.Build.props reference /opt/neoLib/src/Neo.VM/Neo.VM.csproj
#THIS SYMBOLIC LINK IS A WORKAROUND BECAUSE OF THE RELATIVE PATH WHEN ADDING A REFERENCE
#RUN rm -r /opt/neoLib/src/Neo/bin /opt/neoLib/src/Neo/obj
#RUN rm -r /opt/neoLib/src/Neo.Json/bin /opt/neoLib/src/Neo.Json/obj
#RUN rm -r /opt/neoLib/src/Neo.VM/bin /opt/neoLib/src/Neo.VM/obj
#RUN ln -s /opt/neoLib/ /opt/neo-modules/

#SED IS ALSO WORKROUND
#RUN sed -i 's+.*Include="Neo".*+<PackageReference Include="\\opt\\neoLib\\src\\neo\\neo.csproj" />+g' /opt/neo-modules/src/Directory.Build.props
#RUN cat /opt/neo-modules/src/Directory.Build.props

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
