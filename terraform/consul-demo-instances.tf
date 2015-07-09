resource "openstack_compute_instance_v2" "instance-orchestrator" {
    name = "orchestrator"
    image_name = "ubuntu-14.04_x86_64"
    flavor_name = "1_vCPU_RAM_512M_HD_10G"
    key_pair = "${var.keypair_name}"
    floating_ip = "${openstack_networking_floatingip_v2.orchestrator_floating_ip.address}"
    network = {
        uuid = "${openstack_networking_network_v2.consul-demo-net.id}"
    }
    depends_on = ["openstack_networking_router_interface_v2.net-interface-consul-demo"]
    depends_on = ["openstack_networking_floatingip_v2.orchestrator_floating_ip.address"]
}

resource "openstack_compute_instance_v2" "instance-consul-server-1" {
    name = "consul-server-1"
    image_name = "ubuntu-14.04_x86_64"
    flavor_name = "1_vCPU_RAM_512M_HD_10G"
    key_pair = "${var.keypair_name}"
    floating_ip = "${openstack_networking_floatingip_v2.consul_server_floating_ip.address}"
    network = {
        uuid = "${openstack_networking_network_v2.consul-demo-net.id}"
    }
    depends_on = ["openstack_networking_router_interface_v2.net-interface-consul-demo"]
    depends_on = ["openstack_networking_floatingip_v2.consul_server_floating_ip.address"]
}

resource "openstack_compute_instance_v2" "instance-consul-server-2" {
    name = "consul-server-2"
    image_name = "ubuntu-14.04_x86_64"
    flavor_name = "1_vCPU_RAM_1G_HD_10G"
    key_pair = "${var.keypair_name}"
    network = {
        uuid = "${openstack_networking_network_v2.consul-demo-net.id}"
    }
    depends_on = ["openstack_networking_router_interface_v2.net-interface-consul-demo"]
}

resource "openstack_compute_instance_v2" "instance-consul-server-3" {
    name = "consul-server-3"
    image_name = "ubuntu-14.04_x86_64"
    flavor_name = "1_vCPU_RAM_1G_HD_10G"
    key_pair = "${var.keypair_name}"
    network = {
        uuid = "${openstack_networking_network_v2.consul-demo-net.id}"
    }
    depends_on = ["openstack_networking_router_interface_v2.net-interface-consul-demo"]
}

resource "openstack_compute_instance_v2" "instance-web-server-1" {
    name = "web-server-1"
    image_name = "ubuntu-14.04_x86_64"
    flavor_name = "1_vCPU_RAM_1G_HD_10G"
    key_pair = "${var.keypair_name}"    
    network = {
        uuid = "${openstack_networking_network_v2.consul-demo-net.id}"
    }
    depends_on = ["openstack_networking_router_interface_v2.net-interface-consul-demo"]
}

resource "openstack_compute_instance_v2" "instance-web-server-2" {
    name = "web-server-2"
    image_name = "ubuntu-14.04_x86_64"
    flavor_name = "1_vCPU_RAM_1G_HD_10G"
    key_pair = "${var.keypair_name}"    
    network = {
        uuid = "${openstack_networking_network_v2.consul-demo-net.id}"
    }
    depends_on = ["openstack_networking_router_interface_v2.net-interface-consul-demo"]
}

resource "openstack_compute_instance_v2" "instance-web-server-3" {
    name = "web-server-3"
    image_name = "ubuntu-14.04_x86_64"
    flavor_name = "1_vCPU_RAM_1G_HD_10G"
    key_pair = "${var.keypair_name}"    
    network = {
        uuid = "${openstack_networking_network_v2.consul-demo-net.id}"
    }
    depends_on = ["openstack_networking_router_interface_v2.net-interface-consul-demo"]
}

output "output" {
    value = "consul_servers: ${openstack_compute_instance_v2.instance-consul-server-1.network.0.fixed_ip_v4},${openstack_compute_instance_v2.instance-consul-server-2.network.0.fixed_ip_v4},${openstack_compute_instance_v2.instance-consul-server-3.network.0.fixed_ip_v4}\nconsul_agents: ${openstack_compute_instance_v2.instance-web-server-1.access_ip_v4},${openstack_compute_instance_v2.instance-web-server-2.access_ip_v4},${openstack_compute_instance_v2.instance-web-server-3.access_ip_v4}\nwebservers: ${openstack_compute_instance_v2.instance-web-server-1.access_ip_v4},${openstack_compute_instance_v2.instance-web-server-2.access_ip_v4},${openstack_compute_instance_v2.instance-web-server-3.access_ip_v4}"
}

output "orchestrator" {
    value = "${openstack_networking_floatingip_v2.orchestrator_floating_ip.address}"
}