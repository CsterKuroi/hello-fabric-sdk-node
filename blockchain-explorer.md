# blockchain-explorer

## Requirements

Following are the software dependencies required to install and run hyperledger explorer
* nodejs 8.11.x (Note that v9.x is not yet supported)
* PostgreSQL 9.5 or greater

## Clone Repository

Clone this repository to get the latest using the following command.

```
cd /etc
git clone https://github.com/hyperledger/blockchain-explorer.git
```

## PostgreSQL 9.6
```
yum install -y https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
yum install -y postgresql96-server postgresql96-contrib
/usr/pgsql-9.6/bin/postgresql96-setup initdb
systemctl start postgresql-9.6
systemctl enable postgresql-9.6

vim /var/lib/pgsql/9.6/data/pg_hba.conf
```

```
# "local" is for Unix domain socket connections only
local   all             all                                     peer
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
# IPv6 local connections:
host    all             all             ::1/128                 trust
```

then

```
systemctl restart postgresql-9.6
```

## Database Setup
```
sudo -u postgres psql

\i app/persistence/postgreSQL/db/explorerpg.sql
\i app/persistence/postgreSQL/db/updatepg.sql

\l
\d
```

## Fabric Configure Hyperledger Explorer
```
cd /etc/blockchain-explorer/app/platform/fabric

vim config.json
```

>
	{
	"network-config": {
		"org1": {
			"name": "peerOrg1",
			"mspid": "Org1MSP",
			"peer1": {
				"requests": "grpc://127.0.0.1:7051",
				"events": "grpc://127.0.0.1:7053",
				"server-hostname": "peer0.org1.example.com"
			},
			"admin": {
				"key": "/root/fabric-samples/basic-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore",
				"cert": "/root/fabric-samples/basic-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts"
			}
		}
	},
	"channel": "mychannel",
	"orderers":[
				{
				"mspid": "OrdererMSP",
				"server-hostname":"orderer.example.com",
				"requests":"grpc://127.0.0.1:7050"
				}
				],
	"keyValueStore": "/root/.hfc-key-store/",
	"configtxgenToolPath": "fabric-path/fabric-samples/bin",
	"SYNC_START_DATE_FORMAT":"YYYY/MM/DD",
	"syncStartDate":"2018/01/01",
	"eventWaitTime": "30000",
	"license": "Apache-2.0",
	"version": "1.1"
	}

## Build Hyperledger Explorer
```
cd /etc/blockchain-explorer
npm install

cd /etc/blockchain-explorer/app/test
npm install
npm run test

cd /etc/blockchain-explorer/client/
npm install
npm test -- -u --coverage
npm run build
```

## Run Hyperledger Explorer
```
cd /etc/blockchain-explorer
./start.sh
```
- Launch the URL http://localhost:8080 on a browser.


## troubleshooting

```
DROP INDEX IF EXISTS transaction_chaincode_proposal_input_idx;
```


## Restart

```
cd /etc/blocvkchain-explorer
./stop.sh

sudo -u postgres psql

\i app/persistence/postgreSQL/db/explorerpg.sql
\i app/persistence/postgreSQL/db/updatepg.sql
DROP INDEX IF EXISTS transaction_chaincode_proposal_input_idx;

\l
\d
\q

./start.sh
```
