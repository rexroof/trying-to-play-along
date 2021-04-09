resource "linode_stackscript" "podman" {
  label       = "rex-podman"
  description = "sets up podman"
  script      = <<EOF
#!/bin/bash
#
# script!
#

# add podman registry
echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/testing/xUbuntu_20.10/ /' | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:testing.list
curl -fsSL https://download.opensuse.org/repositories/devel:kubic:libcontainers:testing/xUbuntu_20.10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/devel_kubic_libcontainers_testing.gpg > /dev/null

apt-get update && apt-get install -y golang podman

useradd -m -s /bin/bash admin

# install/build CNI plugins that podman needs
cd /tmp
git clone https://github.com/containernetworking/plugins.git plugins
cd /tmp/plugins
./build_linux.sh
mkdir -p /usr/libexec/cni
cp bin/* /usr/libexec/cni


# reboot after this script exits?
$(shutdown -r +1) &

EOF
  images      = ["linode/ubuntu20.10"]
  rev_note    = "initial version"
}

resource "linode_instance" "podman-linode" {
  image           = "linode/ubuntu20.10"
  label           = "Podman-Example"
  region          = "us-east"
  type            = "g6-standard-2"
  authorized_keys = [var.ssh_key]
  root_pass       = var.root_pwd
  stackscript_id  = linode_stackscript.podman.id
}
