# hello-fabric-sdk-node


## Quick Start on Centos 7

1. node npm
```
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
sudo yum -y install nodejs
sudo yum install gcc-c++ make
node -v
npm -v
```
>node runtime LTS version 8.9.0 or higher, up to 9.0 ( Node v9.0+ is not supported )  
>npm tool version 5.5.1 or higher  

2. fabric-sdk-node
```
git clone https://github.com/hyperledger/fabric-sdk-node.git
cd fabric-sdk-node
npm install 
*** npm rebuild
```

3. run e2e

*Two terminal*

*terminal A*
``` 
cd test/fixtures
docker-compose up
```
*terminal B*
``` 
node test/integration/e2e.js
```

4. clean
```
terminal A (ctrl+c)
*** docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi -f $(docker images | grep "dev\|none\|test-vp\|peer[0-9]-" | awk '{print $3}')
```
