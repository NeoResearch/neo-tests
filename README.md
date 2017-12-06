# neo-integration-tests

## how to run

1. Install docker
1. Run `.setup_test_image.sh` to build an image
1. Run tests `sudo ../.local/bin/pytest` . Must be admin to access docker.

## to modify in other repo

Modify neo-privatenet-docker docker_build.sh so that we can choose to install a locally supplied neo-cli distribution to download to image

## overview

1. in docker container
    1. git clone neo branch to test
    1. git clone neo-cli
    1. remove package from neo-cli and replace with local reference
    1. git publish neo-cli to zip
1. Copy zip from docker to neo-privatenet-docker folder
1. Remove neo-privnet running containers
1. Remove neo-privnet image
1. docker_build.sh
1. docker_run_and_create_wallet.sh
1. create snapshot of image
1. loop through all tests (pytest)
    1. stop privatenet
    1. restore snapshot
    1. run/assert test
