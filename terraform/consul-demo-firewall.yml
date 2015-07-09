resource "openstack_fw_firewall_v1" "consul-demo-firewall" {
    name = "consul-demo-firewall"
    policy_id = "${openstack_fw_policy_v1.consul-demo-policy.id}"
}

resource "openstack_fw_policy_v1" "consul-demo-policy" {
    name = "consul-demo-policy"
    rules = [
        "${openstack_fw_rule_v1.out-allow-icmp.id}",
        "${openstack_fw_rule_v1.out-allow-tcp.id}",
        "${openstack_fw_rule_v1.out-allow-udp.id}",
        "${openstack_fw_rule_v1.in-allow-ssh.id}",
        "${openstack_fw_rule_v1.in-allow-dns.id}",
        "${openstack_fw_rule_v1.in-allow-http.id}"
    ]
}

resource "openstack_fw_rule_v1" "out-allow-udp" {
    name = "out-allow-dns"
    protocol = "udp"
    action = "allow"
}

resource "openstack_fw_rule_v1" "out-allow-tcp" {
    name = "out-allow-tcp"
    protocol = "tcp"
    action = "allow"
}

resource "openstack_fw_rule_v1" "out-allow-icmp" {
    name = "out-allow-icmp"
    protocol = "icmp"
    action = "allow"
}

resource "openstack_fw_rule_v1" "in-allow-ssh" {
    name = "in-allow-ssh"
    protocol = "tcp"
    action = "allow"
    destination_port = "22"
}

resource "openstack_fw_rule_v1" "in-allow-http" {
    name = "in-allow-http"
    protocol = "tcp"
    action = "allow"
    destination_port = "80"
}

resource "openstack_fw_rule_v1" "in-allow-dns" {
    name = "in-allow-dns"
    protocol = "udp"
    action = "allow"
    destination_port = "53"
}

