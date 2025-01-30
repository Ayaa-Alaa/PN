#!/bin/bash

# Step 1: Install Docker
echo "Installing Docker..."
sudo apt update && sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce

# Step 2: Start and Enable Docker
echo "Starting and Enabling Docker..."
sudo systemctl start docker
sudo systemctl enable docker

# Step 3: Install Privasea into Docker
echo "Pulling Privasea Docker image..."
docker pull privasea/acceleration-node-beta

# Step 4: Setting Node
echo "Setting up Privasea Node..."
sudo su <<EOF
mkdir -p /privasea/config && cd /privasea
docker run -it -v "/privasea/config:/app/config" privasea/acceleration-node-beta:latest ./node-calc new_keystore
cd /privasea/config
ls
mv ./UTC--2025-01-06T06-11-07.GANTI_DENGAN_NAMA_KUNCI_FILE ./wallet_keystore
ls
EOF

# Step 6: Run Node
echo "Running Privasea Node..."
cd /privasea/
docker run -d -v "/privasea/config:/app/config" -e KEYSTORE_PASSWORD=123 privasea/acceleration-node-beta:latest

# Check Node logs
docker logs -f PASTE_OUTPUT_PID_NODE_ANDA

# Step 7: Handle Node Error
echo "If Node Error occurs..."
docker ps -q --filter "ancestor=privasea/acceleration-node-beta:latest" | xargs --no-run-if-empty docker stop
docker ps | grep privasea/acceleration-node-beta:latest

echo "Setup Complete!"
