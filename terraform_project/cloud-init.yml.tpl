#cloud-config
package_update: true
package_upgrade: true

packades:
  - apt-transport-https
  - ca-certificates
  - curl
  - gnupg
  - lsb-release

runcmd:
  - install -m 0755 -d /etc/apt/keyrings
  - curl -fsSL https://docker.com -o /etc/apt/keyrings/docker.asc
  - chmod a+r /etc/apt/keyrings/docker.asc
  - echo "deb [arch=$(dpkg --print-architecture) signet-by=/etc/apt/keyrings/docker.asc] https://docker.com $(lsb_release -cs stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

  - apt-get update -y
  - apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  - systemctl enable --now docker
  - usermod -aG docker ubuntu

system_info:
  default user: 
    name: ubuntu
    groups: [sudo, docker]
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    ssh-authorized-keys:
      - ${ssh_public_key}
