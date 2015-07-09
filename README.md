# consul-demo

Instantiation and provisioning of consul-demo environment (on an openstack platform)

You can spawn your own consul-demo environment following these steps:

Prerequisites:
- You have a tenant on an openstack platform
- In this tenant, you have a router with a gateway defined
- You have a keypair

Then, change the vars default values to match your environment (your keypair name, your router id, and your floating ip pool).

You are finally ready to bootstrap your environment executing 
```./bootstrap.sh <path_to_your_private_key> <remote_user_name>```

Play your demo

Destroy the environment with 
```./destroy.sh```
