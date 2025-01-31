## Install alat tempur
```bash
sudo apt update && sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
```
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

## Update
```bash
sudo apt update && sudo apt install -y docker-ce
```

## Aktifkan docker
```bash
sudo systemctl start docker
```
```bash
sudo systemctl enable docker
```

## Install file privasea ke docker
```bash
sudo docker pull privasea/acceleration-node-beta
```

## Buat folder Privasea
```bash
mkdir -p /privasea/config && cd /privasea
```

## Buat kunci node, lalu buat password "123"
```bash
sudo docker run -it -v "/privasea/config:/app/config"  \privasea/acceleration-node-beta:latest ./node-calc new_keystore
```

## Salin addressnya, caranya tinggal klik 2 kali di namanya terus paste ke notepad

## Dibawah address itu file keystore nya, salin juga, sama juga

## Masuk ke folder
```bash
cd /privasea/config && ls
```

## Ganti nama keystorenya jadi "wallet_keystore"
```bash
mv ./NAMA_FILE_AWALAN_UTC  ./wallet_keystore 
```

## Cek namanya udah keganti jadi "wallet_keystore" apa belum
```bash
ls
```

## Setting node di dashboard, ambil faucet, paste faucet arb sepolia ke address node dikit 0.001 eth arb
```bash
https://deepsea-beta.privasea.ai/privanetixNode
```

## Switch to the program running directory
```bash
cd /privasea/
```

## Jalankan node
```bash
sudo docker run  -d   -v "/privasea/config:/app/config" \-e KEYSTORE_PASSWORD=123 \privasea/acceleration-node-beta:latest
```

## Salin outputnya, klik 2 kali, paste di notepad

## Cek node
```bash
sudo docker logs -f OUTPUT_TADI
```

## Stop nodenya
```bash
sudo docker ps -q --filter "ancestor=privasea/acceleration-node-beta:latest" | xargs --no-run-if-empty docker stop
```
```bash
sudo docker ps | grep privasea/acceleration-node-beta:latest
```

