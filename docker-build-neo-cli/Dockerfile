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
#==========================================================================
#========================== ALL THE MAGIC IS HERE =========================
WORKDIR /opt/neoLib/src/Neo.CLI
RUN dotnet restore
RUN dotnet publish -c Release -f net7.0 --no-restore  --output ./
WORKDIR /
#==========================================================================

#==========================================================================
ARG NEO_BLOCKCHAIN_RUN_TESTS
#---------------------- NEO CORE LIB UNIT TESTS ---------------------------
WORKDIR /opt/neoLib
ARG COVERAGE_OUTPUT_FOLDER=/opt/neoLib/coverage-join/
ARG COVERAGE_FILE_NAME=coverage.net7.0.json
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet format --verify-no-changes --verbosity diagnostic);  fi
RUN find tests -name *.csproj | xargs -I % dotnet add % package coverlet.msbuild
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test ./tests/Neo.ConsoleService.Tests         /p:CollectCoverage=true /p:CoverletOutput=$COVERAGE_OUTPUT_FOLDER);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test ./tests/Neo.Cryptography.BLS12_381.Tests /p:CollectCoverage=true /p:CoverletOutput=$COVERAGE_OUTPUT_FOLDER /p:MergeWith=$COVERAGE_OUTPUT_FOLDER$COVERAGE_FILE_NAME);  fi
RUN mv /opt/neoLib/coverage-join/coverage.json /opt/neoLib/coverage-join/coverage.net7.0.json
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test ./tests/Neo.UnitTests                    /p:CollectCoverage=true /p:CoverletOutput=$COVERAGE_OUTPUT_FOLDER /p:MergeWith=$COVERAGE_OUTPUT_FOLDER$COVERAGE_FILE_NAME);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test ./tests/Neo.VM.Tests                     /p:CollectCoverage=true /p:CoverletOutput=$COVERAGE_OUTPUT_FOLDER /p:MergeWith=$COVERAGE_OUTPUT_FOLDER$COVERAGE_FILE_NAME);  fi
RUN if [ "$NEO_BLOCKCHAIN_RUN_TESTS" = "true" ] ; then (dotnet test ./tests/Neo.Json.UnitTests               /p:CollectCoverage=true /p:CoverletOutput=/opt/neoLib/coverage/lcov  /p:MergeWith=$COVERAGE_OUTPUT_FOLDER$COVERAGE_FILE_NAME /p:CoverletOutputFormat=lcov);  fi
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

# Now it is submodule deps - Removing the existing directory
RUN rm -r /opt/neo-modules/neo
# Copying the new library into place
RUN cp -r /opt/neoLib /opt/neo-modules/neo
# Getting the git version of the module
RUN cd /opt/neoLib && echo "Current neoLib last commit is: $(git rev-parse HEAD)"
# Getting the git version of the submodule
RUN cd /opt/neo-modules && echo "Current neo-modules last commit is: $(git rev-parse HEAD)"

# Create plugins folder inside Neo.CLI to be built
RUN mkdir /opt/neoLib/src/Neo.CLI/Plugins/

# Do everything and copy plugins
RUN /opt/buildAllList_Plugins_3x.sh
#==========================================================================

#==========================================================================
#============ COMPACT NEO-CLI IN A ZIP FILE  ==============================
WORKDIR /opt/neoLib/src/

RUN zip -r /opt/neo-cli-built.zip Neo.CLI
#==========================================================================

# ALL NIGHT LONG - STAY ALIVE
ENTRYPOINT ["tail", "-f", "/dev/null"]
