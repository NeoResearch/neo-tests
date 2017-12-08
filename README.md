<p align="center">
  <img
    src="http://res.cloudinary.com/vidsy/image/upload/v1503160820/CoZ_Icon_DARKBLUE_200x178px_oq0gxm.png"
    width="125px;">
</p>

<h1 align="center">neo-integration-tests</h1>

## What is it

A set of tests designed to test correctness and performance of the Neo blockchain. The repository comprises a set of scripts and docker containers to build and publish a private network, along with a set of python tests to run through.

This is a work in progress, areas to be improved :-

- Many more tests needed.
- Invesigate using docker compose and improve the image build process so it's more suitable for CI.
- Improve speed of build process, I suspect we can use cache a little more for our containers.

## How to build an image

1. Install docker
1. Run `.setup_test_image.sh` to build an image

## How to run tests

1. Run tests `sudo ../.local/bin/pytest` (must be admin to access docker)
