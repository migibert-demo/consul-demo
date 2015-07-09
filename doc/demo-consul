=====================================================================
====                    Overview                                 ====
=====================================================================
Fonctionnalités:
-> Service discovery
-> Healthcheck
-> Key Value Store
-> ACL
-> Events

Gossip protocol
Consensus protocol

Chaque agent supporte 3 protocoles de communication
-> RPC  (8400) -> administration
-> HTTP (8500) -> administration
-> DNS  (8600) -> consommation


=====================================================================
====                   Commandes DNS                             ====
=====================================================================
[tag.]<service>.service[.datacenter][.domain]
<node>.node.<datacenter>.<domain>

DNS Interface
dig @127.0.0.1 -p 8600 web.service.consul

Avec dnsmasq en tant que DNS forwarder (cf /etc/dnsmasq.d/10-consul)
dig web.service.consul

curl web.service.consul


=====================================================================
====                  Maintenance mode                           ====
=====================================================================
Sur l'un des webservers:

consul maint -enable -reason "Application upgrade v1 to v2" -service web
consul maint

curl -X PUT http://localhost:8500/v1/agent/service/register -d '{ "ID": "web", "Name": "web", "Tags": ['v2'], "Port": 80, "HTTP": "localhost", "Interval": "10s" }'
consul maint -disable -service web
consul maint

dig v1.web.service.consul
dig v2.web.service.consul
console web

=====================================================================
====                     Healthchecks                            ====
=====================================================================
sudo service apache2 stop
dig web.service.consul
console web
sudo service apache2 start


=====================================================================
====               Distributed key/value store                   ====
=====================================================================
TODO