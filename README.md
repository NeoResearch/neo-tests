<h1 align="center">neo-integration-tests</h1>

## What is it

A set of tests designed to test correctness and performance of the Neo blockchain.
The repository comprises a set of scripts and docker containers to build and publish a private network, along with a set of python tests to run through.

This is a work in progress, areas to be improved:

- Investigate neo-blockchain files that can be altered and optimized;
- Investigate using docker compose and improve the image build process so it's more suitable for CI;
- Improve speed of build process, I suspect we can use cache a little more for our containers.

## How to build an image

1. Install docker
1. Build a new neo-cli, `cd docker-build-neo-cli` and then `.docker_build_run_copy_stop` to build an image and copy cli to your local storage

## Start a local private network with new built neo-cli

1. Build privanet with modified files, starting from metachris/neo-privnet-with-gas:latest, `docker_build.sh`
1. Run and create a wallet with Neo and Gas `docker_run_and_create_wallet.sh` or simply run and enjoy a fresh consensus network `docker_run.sh` and `bash-priv.sh`
