<p align="center">
    <img
      src="https://github.com/NeoResearch/neoresearch.github.io/blob/master/assets/images/logo/Gemcut-butterfly/butterfly-banner.png?raw=true"
      >
</p>

<h1 align="center">neo-cli clients assert</h1>

This is the basic template for asserting neo-cli differences.

Currently, it is able to verify storage differences.

**Guidelines**

## System requirements
These scripts have been tested for Ubuntu-18-04.

Bassicaly, you will need docker and docker-compose.
Follow the installation instruction provided at [https://github.com/NeoResearch/neocompiler-eco](https://github.com/NeoResearch/neocompiler-eco)

## A1) Download the most updated chain
Download the chain from [http://sync.ngd.network/](http://sync.ngd.network/).
Alternativelly, you can let it sync though P2P.

## A2) Build and Run

`rpc_dev_start.sh` will start clients with custom .zip

`rpc_start.sh` will start clients by downloading them from links
