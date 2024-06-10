# Acme Corp Minecraft Server Setup

Welcome to the Acme Corp Minecraft Server setup guide! This repository contains scripts and instructions to fully automate the provisioning, configuration, and setup of a Minecraft server on AWS.

## Requirements

To run this pipeline, you will need:
- **AWS Account**: Credentials configured via AWS CLI.
- **AWS CLI**: Version 2.0+ [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- **Terraform**: Version 1.0+ [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- **Ansible**: Version 2.9+ (Optional) [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- **nmap**: Version 7.80+ [Install nmap](https://nmap.org/book/inst-windows.html)
- **SSH Key Pair**: For accessing the EC2 instance if needed.

## Overview

The process involves:
1. Setting up a GitHub repository for version control.
2. Writing infrastructure provisioning scripts using Terraform.
3. Provisioning AWS EC2 resources.
4. Configuring the Minecraft server using Ansible and bash scripts.
5. Ensuring the server restarts properly and resolves shutdown issues.

## Tutorial

### 1. Clone the Repository

```sh
git clone https://github.com/yourusername/acme-minecraft-server.git
cd acme-minecraft-server
```

### 2. Configure AWS CLI

Ensure your AWS CLI is configured with the necessary credentials.

```sh
aws configure
```

### 3. Provision Infrastructure with Terraform

Navigate to the `terraform` directory and apply the configuration.

```sh
cd terraform
terraform init
terraform apply
```

### 4. Configure the Minecraft Server

If you're using Ansible, run the playbook to set up the Minecraft server.

```sh
cd ansible
ansible-playbook setup-minecraft.yml -i inventory
```

### 5. Connect to the Minecraft Server

Find the public IP address of your EC2 instance and connect to the Minecraft server.

```sh
nmap -sV -Pn -p T:25565 <instance_public_ip>
```

### 6. Testing and Validation

Ensure the server auto-starts and shuts down properly. Test connecting to the server with a Minecraft client.

## Resources and Sources

- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [Terraform Documentation](https://www.terraform.io/docs)
- [Ansible Documentation](https://docs.ansible.com/ansible/latest/index.html)
- [Minecraft Server Setup](https://minecraft.gamepedia.com/Tutorials/Setting_up_a_server)

## Scripts

### Terraform

- **main.tf**: Defines the infrastructure resources.
- **variables.tf**: Contains variable definitions.
- **outputs.tf**: Specifies output values.

### Ansible (Optional)

- **setup-minecraft.yml**: Playbook to configure the Minecraft server.
- **inventory**: Ansible inventory file.

### Shell Script

- **setup.sh**: Shell script for initial setup and configuration.