import json
import sys

def target_data(data):
  return {
    "ubuntu-14.04-amd64": {
      "iso_url": "http://old-releases.ubuntu.com/releases/trusty/ubuntu-14.04-server-amd64.iso",
      "iso_checksum_type": "sha256",
      "iso_checksum": "946a6077af6f5f95a51f82fdc44051c7aa19f9cfc5f737954845a6050543d7c2",
      "boot_command": ubuntu_boot_command(data),
      "vbox_guest_os_type": "Ubuntu_64",
      "extra_scripts": ubuntu_extra_scripts(data),
    },
    "ubuntu-14.04-i386": {
      "iso_url": "http://old-releases.ubuntu.com/releases/trusty/ubuntu-14.04-server-i386.iso",
      "iso_checksum_type": "sha256",
      "iso_checksum": "976044842804eafc18390505508958b559c131211160ecae5e60694bdf171f78",
      "boot_command": ubuntu_boot_command(data),
      "vbox_guest_os_type": "Ubuntu",
      "extra_scripts": ubuntu_extra_scripts(data),
    },
    "ubuntu-14.10-amd64": {
      "iso_url": "http://releases.ubuntu.com/14.10/ubuntu-14.10-server-amd64.iso",
      "iso_checksum_type": "sha256",
      "iso_checksum": "f79edea19575e2cabb5ff9aeca787ea821fcfdbf81ce89823c26b020d9940956",
      "boot_command": ubuntu_boot_command(data),
      "vbox_guest_os_type": "Ubuntu_64",
      "extra_scripts": ubuntu_extra_scripts(data),
    },
    "ubuntu-14.10-i386": {
      "iso_url": "http://releases.ubuntu.com/14.10/ubuntu-14.10-server-i386.iso",
      "iso_checksum_type": "sha256",
      "iso_checksum": "e1c74e163b06e28bfd71ef322ce986fb6098d03704408f9dc2eaf3ef6f7f86b9",
      "boot_command": ubuntu_boot_command(data),
      "vbox_guest_os_type": "Ubuntu",
      "extra_scripts": ubuntu_extra_scripts(data),
    },
    "ubuntu-15.04-amd64": {
      "iso_url": "http://releases.ubuntu.com/15.04/ubuntu-15.04-server-amd64.iso",
      "iso_checksum_type": "sha256",
      "iso_checksum": "6501c8545374665823384bbb6235f865108f56d8a30bbf69dd18df73c14ccb84",
      "boot_command": ubuntu_boot_command(data),
      "vbox_guest_os_type": "Ubuntu_64",
      "extra_scripts": ubuntu_extra_scripts(data),
    },
    "ubuntu-15.04-i386": {
      "iso_url": "http://releases.ubuntu.com/15.04/ubuntu-15.04-server-i386.iso",
      "iso_checksum_type": "sha256",
      "iso_checksum": "f510169ddc03121d11a627ae3a231e1272d8e4d75f9ef76f73daa5b809c5b6d8",
      "boot_command": ubuntu_boot_command(data),
      "vbox_guest_os_type": "Ubuntu_64",
      "extra_scripts": ubuntu_extra_scripts(data),
    },
  }[data["target"]]

def ubuntu_boot_command(data):
  return [
    "<esc><esc><enter><wait>",
    "/install/vmlinuz ",
    "preseed/url=http://{{.HTTPIP}}:{{.HTTPPort}}/ubuntu/preseed.cfg ",
    "debian-installer=en_US auto locale=en_US kbd-chooser/method=us ",
    "passwd/username=vagrant ",
    "passwd/user-password=vagrant ",
    "passwd/user-password-again=vagrant ",
    "hostname={{.Name}} ",
    "time/zone=" + data["time_zone"] + " ",
    "fb=false debconf/frontend=noninteractive ",
    "keyboard-configuration/modelcode=SKIP keyboard-configuration/layout=USA ",
    "keyboard-configuration/variant=USA console-setup/ask_detect=false ",
    "initrd=/install/initrd.gz -- <enter>"
  ]

def ubuntu_extra_scripts(data):
  return [
    "scripts/debian/packages.sh",
  ]

def provider(data):
  return {
    "vbox": {
      "type": "virtualbox-iso",
      "guest_os_type": data["vbox_guest_os_type"],
      "disk_size": 50000,
      "guest_additions_mode": "upload",
      "vboxmanage": [
        [ "modifyvm", "{{.Name}}", "--memory", "512" ],
        [ "modifyvm", "{{.Name}}", "--cpus", "1" ]
      ]
    },
    "qemu": {
      "type": "qemu",
      "disk_size": 5000,
      "format": "qcow2",
      "headless": False,
      "accelerator": "kvm",
      "net_device": "virtio-net",
      "disk_interface": "virtio",
    },
  }[data["provider"]]

def provider_extra_scripts(data):
  return {
    "vbox": [
      "../scripts/common/reboot.sh",
      "../scripts/common/install-guest-additions.sh",
    ],
    "qemu": [],
  }[data["provider"]]

def template(data):
  data.update(target_data(data))
  vm_name = data["target"] + "-" + data["provider"]
  builder = {
    "vm_name": vm_name,
    "http_directory": "./",
    "output_directory": "output-" + vm_name,
    "iso_url": data["iso_url"],
    "iso_checksum_type": data["iso_checksum_type"],
    "iso_checksum": data["iso_checksum"],
    "ssh_username": "vagrant",
    "ssh_password": "vagrant",
    "ssh_port": 22,
    "ssh_wait_timeout": "86400s",
    "boot_wait": "10s",
    "boot_command": data["boot_command"],
    "shutdown_command": "sudo shutdown -P now",
  }
  builder.update(provider(data))
  return {
    "builders": [builder],
    "provisioners": [{
      "type": "shell",
      "execute_command": "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'",
      "scripts": data["extra_scripts"] + provider_extra_scripts(data) + [
        "../scripts/common/sudo.sh",
        "scripts/common/cleanup.sh",
      ]
    }],
    "post-processors": [{
      "type": "vagrant",
      "compression_level": "6",
      "output": vm_name + ".box",
    }],
  }

def usage():
  print >>sys.stderr, "Usage: {0} -f config_file\n  or   {0} [key=val [key=val ...]]".format(sys.argv[0])
  sys.exit(1)

if len(sys.argv) < 2:
  usage()
if sys.argv[1] == '-f':
  if len(sys.argv) != 3:
    usage()
  data = json.load(sys.argv[2])
else:
  data = {}
  for kv in sys.argv[1:]:
    k,v = kv.split("=",1)
    data[k] = v

print >>sys.stderr, "Config:"
print >>sys.stderr, json.dumps(data, indent=4, sort_keys=True)
print json.dumps(template(data), indent=4)
