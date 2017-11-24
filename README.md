# neo-integration-tests

## to modify in other repo
Modify neo-privatenet-docker docker_build.sh so that we can choose to install a locally supplied neo-cli distribution to download to image

## overview
1. in docker container 
    a. git clone neo branch to test
    b. git clone neo-cli
    c. remove package from neo-cli and replace with local reference
    d. git publish neo-cli to zip 
2. Copy zip from docker to neo-privatenet-docker folder
3. Remove neo-privnet running containers
4. Remove neo-privnet image
5. docker_build.sh
6. docker_run_and_create_wallet.sh
7. create snapshot of image (and upload?)
8. loop through all tests (nose? pytest?)
    a. stop privatenet
    b. restore snapshot
    c. run/assert test
