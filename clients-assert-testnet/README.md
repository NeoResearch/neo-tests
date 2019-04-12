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
Edit the file `mainnet-chain-unzip.sh` with this link from [http://sync.ngd.network/](http://sync.ngd.network/) to the `chain.acc` file.
Alternativelly, one can pick other `CDN` available links.

## A2) Build and Run

`rpc_start.sh` will do its job

## Specifications

* A door will be opened at 10332 - JSON-RPC via HTTP
* A door will be opened at 10333 - P2P via TCP

Node recommended specifications can be found here [http://docs.neo.org/en-us/node/introduction.html](http://docs.neo.org/en-us/node/introduction.html)
## Security aspects

Important security and vuneralbility precautions can be obtained by following the tips available at [https://github.com/CityOfZion/standards/blob/master/nodes.md](https://github.com/CityOfZion/standards/blob/master/nodes.md).
