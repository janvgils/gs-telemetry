
## OVA installation description

The installation is based upon Debian amd64 Buster installation.

```
Language: English US
Location: Netherlands
Locales: United States: en_US.UTF-8
Keyboard, keymap: American English

Memory size: 4Gb
Disk size 16Gb (VMDK, so compatible with VMware)

Hostname: gs-telemetry
Domain: (empty)

root password: gs-telemetry

New user: lab
Password: telemetry

All files in one single partition              

partition #1 primary 14.4GB f ext4 /
partition #5 logical 2.0 GB f swap

VirtualBox Guest Addition installed

Network configuration:

The VM is using the NAT VirtualBox interface and has a ssh port forward.
When you want to connect the VM ssh port you use the following command:

```

`ssh -l lab -p 2222 <VirtualBox host ip address>`
