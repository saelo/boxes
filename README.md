Boxes
=====

Collection of vagrant files, packer configurations and various shell scripts to manage virtual machines for different purposes.

Prerequisites
-------------
To use this repository you'll at least need [vagrant](https://www.vagrantup.com/) and VirtualBox.
If you want to build your own base images you'll also need [packer](https://packer.io/).

How to use this repo
--------------------
There are three main parts in this repository:

1. Packer configurations to build vagrant boxes (in packer/)
2. Provisioning scripts (in scripts/)
3. Virtual machine profiles containing at least a Vagrantfile (everything else)


With this spinning up a webserver in a VM can be as easy as

```bash
cd ./websrv
vagrant up
```

And you'll have an apache webserver serving the content in ./websrv/webroot/ to you on http://localhost:8000.

Getting the base images
-----------------------
Before being able to use the VM profiles you'll need some base images (called [boxes](https://docs.vagrantup.com/v2/boxes.html)) for vagrant to use. You can either build those yourself using packer or use public images from e.g. [here](https://vagrantcloud.com/hashicorp) by changing the box name in the Vagrantfiles (e.g. change "ubuntu-14.04-amd64" to "ubuntu/trusty64" to use the official ubuntu 14.04 vagrant box).

Building the boxes yourself with packer is straight forward:

```bash
cd packer/ubuntu-14.04-amd64
packer-io build ubuntu-14.04-amd64.json
# and, to register the new box with vagrant:
vagrant box add ubuntu-14.04-amd64 ubuntu-14.04-amd64_virtualbox.box
```

Note: You may want to change the keyboard layout and timezone settings for the boxes.

If you're using different boxes be sure to change the config.vm.box setting in the Vagrantfiles.
