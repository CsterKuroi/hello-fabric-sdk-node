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

- **Option :** :lollipop: Use a locally hosted Hyperledger Fabric Network - [instructions](./docs/use_local_hyperledger.md)

<a name="installchaincode"></a>

### 3. Install and Instantiate Chaincode

- **Option :** :lollipop: Install and instantiate chaincode with the SDK locally - [instructions](./docs/install_chaincode_locally.md)

<a name="hostmarbles"></a>

### 4. Host Marbles
- **Option :** :lollipop: Host marbles locally - [instructions](./docs/host_marbles_locally.md)

***

<a name="use"></a>

# Use Marbles

1. Open up your favorite browser and browse to [http://localhost:3001](http://localhost:3001) 



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
