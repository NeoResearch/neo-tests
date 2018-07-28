<p align="center">
    <img
      src="http://res.cloudinary.com/dnh3we6el/image/upload/v1519941321/NeoResearch-Logo.png"
      width="125px;">
</p>

<h1 align="center">neo-tests</h1>

## Connecting, integrating, testing and analyzing

This project has its main focus on establishing a set of parameters that will be subjected to optimization and statistical analyses in order to check Neo Consensus and Blockchain capabilities.
The current C# client is used as the main tool for interacting with the Blockchain and Run the Consensus.
In this sense, the private blockchain created using the tools available here is created with new modified characteristics from [neo blockchain](https://github.com/neo-project/neo/), with assist of the procedures inside folder `docker-build-neo-cli`.
Thus, this repository comprises a set of scripts and docker containers to build a modified [neo-cli](https://github.com/neo-project/neo-cli) client and integrate it
with different tools from the Neo Ecosystem, perhaps, those that are already integrated in the [NeoCompiler Eco(system)](https://github.com/NeoResearch/neocompiler-eco).

### Goal

It posses the potential of:
  * Improve performance of the Neo Blockchain;
  * Find optimization opportunities;
  * Promote didactic tools for developers to comprehend core concepts of the Neo Blockchain.

## Possible improvements

* Identify parameters that could be optimized and their impact on consensus behavior:
  - Check bottlenecks: on opcodes (.avm) readings execution; decoding transactions; communicating; changing view; broadcasting; among other.
  - Verify robustness: check the possibility of executing a graph optimization problem (using mathematical programming models of metaheuristics inspired procedures), described on the ongoing project [ODBFT](https://github.com/NeoResearch/ODBFT), which would balance find a consensus that balance efficiency and risk.  
* Create an automatic procedure for easily set these variables and report characteristics of the network:
  - Automatic CPU time reporting on the aforementioned points;
  - Automatic reports on the interaction with different interfaces of Neo ecosystem.
* Run several batches of experiments:
  - Involve different Neo developers in order to execute this containers and report their results;
  - Possible, design a competition and co-working scheme for granting prizes to those that performed outstanding reports.
* Integrate this project into a self-adaptive TestNet:
  - Testnet would be reset sporadically and nodes would get new parameters;
  - All nodes would receive necessary amount of Neo and GAS for serving as consensus or acting in the network as normal users.
  - In this sense, neo-cli nodes would automatically synchronize and try to find the most suitable set of parameters.  
* As mentioned in the original project:
  - Investigate using docker compose and improve the image build process so it's more suitable for CI;
  - Improve speed of build process, suspect we can use cache a little more for our containers.

## How to build and Run

TODO - UPDATE DESCRIPTION

### Simple and easy - Build everything and generated a personalized NeoCompiler Ecosystem

This procedure requires two steps (A1 and -A2 or A3-), all of them described below.

#### A1 - Create a modified neo-cli with modified neo-blockchain or neo-cli files

1. Go to `docker-build-neo-cli` folder
1. Execute the script `docker_build_run_copy_stop.sh`
  - As result, a new `neo-cli-built` will be copied to this folder

#### A2 - Run a private net with a modified neo-cli csharp nodes

1. Clone [NeoCompiler Eco(system)](https://github.com/NeoResearch/neocompiler-eco) and follow the guidelines for installing necessary packages:

1. Adjust the NeoCompiler Eco path at variable `PATH_CSHARP_NODES` in the script `build_neo_csharp_nodes_with_builtNeoCli.sh` and `build_everything_neocompiler.sh`

1. Run `build_everything_neocompiler.sh` or
1. Run `build_neo_csharp_nodes_with_builtNeoCli.sh`
  1. Start the NeoCompiler Eco as usual. Go to the NeoCompiler Eco main folder and execute `build_everything.sh`


## Drawing messages from NEO Consensus: consensus-draw

<p align="center">
    <img
      src="./consensus-draw/view-sample.png"
      width="420px;">
</p>

### How to use
RUN: `python -m SimpleHTTPServer 10000`

ACCESS: `localhost:10000`

### Example
Current example is loaded from `example-logs.js`, which is parsed automatically.

## NeoResearch 2018
