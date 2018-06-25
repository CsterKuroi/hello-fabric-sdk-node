docker rm $(docker ps -aq)

docker rmi -f $(docker images | grep "dev\|none\|test-vp\|peer[0-9]-" | awk '{print $3}')

docker ps -a

docker images
