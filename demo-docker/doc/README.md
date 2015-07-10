
# Start consul server(s)
export HOST_IP=$(ip addr | grep eth0 | grep inet | awk '{ split($2, str, "/"); print str[1] }')

sudo docker run -d -h node1 -v /mnt:/data -p 8300:8300 -p 8301:8301 -p 8301:8301/udp -p 8302:8302 -p 8302:8302/udp -p 8400:8400 -p 8500:8500 -p 172.17.42.1:53:53/udp progrium/consul -server -advertise $HOST_IP -bootstrap-expect 1

# Start registrator
sudo docker run -d -v /var/run/docker.sock:/tmp/docker.sock --name registrator -h registrator progrium/registrator:latest consul://$HOST_IP:8500

# Add services
for i in {1..10}; do sudo docker run -d --name service-$i -P jlordiales/python-micro-service; done


-> Les ports sont exposés
curl http://localhost:8500/v1/agent/services | python -m json.tool

-> Et le DNS mis à jour
docker run --dns 172.17.42.1 --dns 8.8.8.8 --dns-search service.consul --rm --name ping_test -it busybox
$ ping python-micro-service.service.consul