#!/bin/bash
source /opt/env-repositories.sh

(cd /opt/neoLib/; dotnet clean)
(cd /opt/neo-modules/; dotnet clean)
(cd /opt/neo-modules/; dotnet build --configuration Release)
