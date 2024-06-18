packer {
  required_plugins {
    vmware = {
      version = "~> 1"
      source = "github.com/hashicorp/vmware"
    }
  }
}


variable "cpus" {
  type    = string
  default = "2"
}

variable "disk_size" {
  type    = string
  default = "51200"
}

variable "headless" {
  type    = bool
  default = false
}

variable "hostname" {
  type    = string
  default = "debian"
}

variable "iso_checksum_debian_12" {
  type    = string
  default = "md5:f8ac298b2e86445c4b79728748ce2f00"
}

variable "iso_urls_debian_12" {
  type    = list(string)
  default = ["/Users/m1xxos/Downloads/debian-12.5.0-arm64-DVD-1.iso"]
}

variable "memory" {
  type    = string
  default = "4096"
}

variable "ssh_password" {
  type    = string
  default = ""
}

variable "ssh_username" {
  type    = string
  default = "m1xxos"
}

variable "vm_name" {
  type    = string
  default = "debian_22.04_64-bit"
}

source "vmware-iso" "debian-12" {
  boot_command     = [
    "c<wait>",
    "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{.HTTPIP}}:{{.HTTPPort}}/\"",
    "<enter><wait>",
    "initrd /casper/initrd",
    "<enter><wait>",
    "boot",
    "<enter>"
  ]
  boot_wait         = "10s"
  disk_size         = "${var.disk_size}"
  cdrom_adapter_type = "sata"
  guest_os_type     = "debian-12"
  headless          = "${var.headless}"
#   http_directory    = "../debian-12/http"
  iso_checksum      = "${var.iso_checksum_debian_12}"
  iso_urls          = "${var.iso_urls_debian_12}"
  output_directory  = "${var.vm_name}"
  shutdown_command  = "echo '${var.ssh_password}' | sudo -S shutdown -P now"
  ssh_password      = "${var.ssh_password}"
  ssh_port          = 22
  ssh_timeout       = "8000s"
  ssh_username      = "${var.ssh_username}"
  vm_name           = "${var.vm_name}"
  memory            = "${var.memory}"
  cpus              = "${var.cpus}"
  usb               = "true"
  snapshot_name     = "Installed"
  vmx_data = {
    "annotation"    : "Packer version: ${packer.version}|0D|0AVM creation time: ${formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())}|0D|0AUsername: ${var.ssh_username}|0D|0APassword: ${var.ssh_password}",
  }
}

build {
  sources = ["source.vmware-iso.debian-12"]

#   provisioner "shell" {
#     execute_command = "echo '${var.ssh_password}' | {{ .Vars }} sudo -S -E bash '{{ .Path }}'"
#     scripts         = [
#         "../scripts/setup.sh",
#         "../scripts/install_docker.sh", 
#         "../scripts/disable_ipv6.sh"
# 		]
#   }

#   provisioner "shell" {
#     execute_command = "{{ .Vars }} bash '{{ .Path }}'"
#     scripts         = [
#         "../scripts/act-clean-debian_12.sh",
#         "../../scripts/user-setup.sh"
#     ]
#   }
  
#   provisioner "shell" {
#     execute_command = "echo '${var.ssh_password}' | {{ .Vars }} sudo -S -E bash '{{ .Path }}'"
#     scripts         = [
#         "../scripts/cleanup.sh"
#     ]
#   }
}