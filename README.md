<p align="center">
  <img
    src="http://res.cloudinary.com/vidsy/image/upload/v1503160820/CoZ_Icon_DARKBLUE_200x178px_oq0gxm.png"
    width="125px;">
</p>

<h1 align="center">neo-integration-tests</h1>

## What is it

This project is an ongoing branch of [AshRolls/neo-integration-tests](https://github.com/AshRolls/neo-integration-tests).
It could be possible merged in a near future, as well as merging improved features released from the original master.

Here, the main focus is on establishing a set of parameters that will be subjected to optimization and statical analyses in order to check [neo-cli](https://github.com/neo-project/neo-cli) consensous capabilities.


This project was initially described as a set of tests designed to test correctness and performance of the Neo blockchain.
In this sense, the repository comprises a set of scripts and docker containers to build and publish a private network, along with a set of python tests to run through.

This is a work in progress, areas to be improved:

- Identify parameters that could be optimized and change consensous behaviors;
- Create an automatic procedure for easily set this variables and report characteristics of the network;
- Investigate using docker compose and improve the image build process so it's more suitable for CI.
- Improve speed of build process, I suspect we can use cache a little more for our containers.

## How to build an image

1. Install docker
1. Run `.setup_test_image.sh` to build an image

## How to run tests

1. Run tests `sudo ../.local/bin/pytest` (must be admin to access docker)
