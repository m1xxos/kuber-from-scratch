# kuber-from-scratch vagrant machines

Short repo to use vagrant vms from Russia using vmware provider

## 1) Install Vagrant VMware Utility

Download plugin from https://developer.hashicorp.com/vagrant/install/vmware

## 2) Install Vagrant VMware plugin

Download latest stable release https://github.com/hashicorp/vagrant-vmware-desktop/releases

At the time of writing it is https://github.com/hashicorp/vagrant-vmware-desktop/releases/tag/desktop-v3.0.3

Install using

```shell
vagrant plugin install --plugin-clean-sources vagrant vagrant-vmware-desktop-3.0.3.gem
```

## 3) Download vagrant box

Download vmware_desktop box from https://app.vagrantup.com/bento/boxes/debian-12

## 4) install vagrant box

```shell
vagrant box add bento/debian-12 {{path to vagrant box from step 3}}
```

## 5) Do vagrant up in directory with Vagrantfile

```shell
vagrant up --provider vmware_desktop
```

---
Tested on macOS Version 14.5 (23F79)

Vagrant-vmware-desktop version desktop-v3.0.3

Debian12 box version v202404.23.0