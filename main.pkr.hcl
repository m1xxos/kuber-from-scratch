packer {
  required_plugins {
    vmware = {
      version = "~> 1"
      source = "github.com/hashicorp/vmware"
    }
  }
}

source "vmware-iso" "debian-12" {
  iso_url = "/Users/m1xxos/Downloads/debian-12.5.0-arm64-DVD-1.iso"
  iso_checksum = "md5:f8ac298b2e86445c4b79728748ce2f00"
  ssh_username = "root"
  ssh_password = "root"
  shutdown_command = "shutdown -P now"
  insecure_connection = true

  guest_os_type = "Debian 12.x 64-bit Arm"

  cpus = 4
  memory = 4096

  boot_command = [
     "<esc><wait>",
     "install <wait>",
     "file=/preseed/preseed.cfg <wait>",
     "debian-installer=en_US <wait>",
     "auto <wait>",
     "locale=en_US <wait>",
     "kbd-chooser/method=us <wait>",
     "fb=false <wait>",
     "debconf/frontend=noninteractive <wait>",
     "console-setup/ask_detect=false <wait>",
     "console-keymaps-at/keymap=us <wait>",
     "keyboard-configuration/xkb-keymap=us <wait>",
     "<enter><wait>"
  ]
  boot_wait               = "15s"

}

build {
  sources = ["sources.vmware-iso.debian-12"]

}
