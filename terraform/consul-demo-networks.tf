provider "openstack" {
    insecure = true
}

variable "router_id" {
    default = "3292fe33-0243-4bca-8acc-b7731ec4298e"
}

variable "keypair_name" {
    default = "cd-demo"
}

variable "floatingip_pool" {
    default = "PublicNetwork-02"
}


resource "openstack_networking_network_v2" "consul-demo-net" {
    name = "consul-demo-net"
}

resource "openstack_networking_subnet_v2" "consul-demo-subnet" {
    network_id = "${openstack_networking_network_v2.consul-demo-net.id}"
    cidr = "172.16.0.0/24"
    ip_version = 4
}

resource "openstack_networking_router_interface_v2" "net-interface-consul-demo" {
    router_id = "${var.router_id}"
    subnet_id = "${openstack_networking_subnet_v2.consul-demo-subnet.id}"
}

resource "openstack_networking_floatingip_v2" "orchestrator_floating_ip" {
    pool = "${var.floatingip_pool}"
}

resource "openstack_networking_floatingip_v2" "consul_server_floating_ip" {
    pool = "${var.floatingip_pool}"
}