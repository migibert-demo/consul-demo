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