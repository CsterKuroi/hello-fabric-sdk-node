# marbles

### 1. Download Marbles
We need to download marbles to your local system.
- Run the following command:

	```
	git clone https://github.com/IBM-Blockchain/marbles.git --depth 1
	cd marbles
	```

- Great I'll meet you at step 2.
<a name="getnetwork"></a>

### 2. Get a Network
```
cd ~/fabric-samples/fabcar
./startFabric.sh
sudo npm install
node enrollAdmin.js
node registerUser.js
node query.js

cp hfc-key-store/* ~/.hfc-key-store
```

### 3. Install and Instantiate Chaincode

```
cd ~/marbles
npm install
vim config/connection_profile_local.json
```
```
{
	"name": "Docker Compose Network",
	"x-networkId": "not-important",
	"x-type": "hlfv1",
	"description": "Connection Profile for an Hyperledger Fabric network on a local machine",
	"version": "1.0.0",
	"client": {
		"organization": "Org1MSP",
		"credentialStore": {
			"path": "/$HOME/.hfc-key-store"
		}
	},
	"channels": {
		"mychannel": {
			"orderers": [
				"fabric-orderer"
			],
			"peers": {
				"fabric-peer-org1": {
					"x-chaincode": {}
				}
			},
			"chaincodes": [
				"marbles:v4"
			],
			"x-blockDelay": 10000
		}
	},
	"organizations": {
		"Org1MSP": {
			"mspid": "Org1MSP",
			"peers": [
				"fabric-peer-org1"
			],
			"certificateAuthorities": [
				"fabric-ca"
			],
			"x-adminCert": {
				"path": "/$HOME/fabric-samples/basic-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem"
			},
			"x-adminKeyStore": {
				"path": "/$HOME/fabric-samples/basic-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/"
			}
		}
	},
	"orderers": {
		"fabric-orderer": {
			"url": "grpc://localhost:7050"
		}
	},
	"peers": {
		"fabric-peer-org1": {
			"url": "grpc://localhost:7051",
			"eventUrl": "grpc://localhost:7053"
		}
	},
	"certificateAuthorities": {
		"fabric-ca": {
			"url": "http://localhost:7054",
			"httpOptions": {
				"verify": true
			},
			"registrar": [
				{
					"enrollId": "admin",
					"enrollSecret": "adminpw"
				}
			],
			"caName": null
		}
	}
}

```

```
cd ./scripts
node install_chaincode.js
node instantiate_chaincode.js
```

### 4. Host Marbles

```
npm install gulp -g
npm install

gulp marbles_local
```

### 5.Use Marbles

1. Open up your favorite browser and browse to [http://localhost:3001](http://localhost:3001) 

2. modify app.js `host` to `0.0.0.0`



> BTW：if you run into the issue like 
> 
> error: [Client.js]: Failed to load user "admin" from local key value store. Error: TypeError: privateKey.isPublic is not a function
    at _cryptoSuite.importKey.then.then (/home/yan/workspace/marbles/node_modules/fabric-client/lib/User.js:255:45)
error: [Client.js]: Failed to load an instance of requested user "admin" from the state store on this Client instance. Error: TypeError: privateKey.isPublic is not a function
    at _cryptoSuite.importKey.then.then (/home/yan/workspace/marbles/node_modules/fabric-client/lib/User.js:255:45)
error: [fcw] Failed to get enrollment marblesDockerComposeNetworkmychannelOrg1MSPfabricpeerorg1 TypeError: privateKey.isPublic is not a function
    at _cryptoSuite.importKey.then.then (/home/yan/workspace/marbles/node_modules/fabric-client/lib/User.js:255:45)
error: [fcw] could not format error
error: Exhausted all CAs. There are no more CAs to try.
error: could not enroll...
warn: Error enrolling admin
> 
> you may need copy hfc-key-store directory to your home directory $HOME/.hfc-key-store, and re-config the client.credentialStore.path of connection_profile_local.json
