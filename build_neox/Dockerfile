# Use an official Golang image to build Geth
FROM golang:1.22 as builder

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y build-essential

# Clone the go-ethereum repository (Neo X fork)
COPY ./go-ethereum /app/go-ethereum
WORKDIR /app/go-ethereum

# Build the geth binary
RUN make geth

# Create a minimal image to run the node
FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
	    screen \
    && rm -rf /var/lib/apt/lists/*

# Copy the built binary
COPY --from=builder /app/go-ethereum/build/bin/geth /usr/local/bin/geth

# Create necessary directories
RUN mkdir -p $NODE_DIR

# Copy the genesis file
COPY --from=builder /app/go-ethereum/config/genesis_testnet.json /root/genesis_testnet.json
COPY --from=builder /app/go-ethereum/config/genesis_mainnet.json /root/genesis_mainnet.json

# On docker run, start the consensus nodes
CMD ["/bin/bash", "/opt/run.sh"]
