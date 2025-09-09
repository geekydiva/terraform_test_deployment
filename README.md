<<<<<<< HEAD
# Endpoint and Route53 Resolver Test Environment

## Overview
This environment is designed to support training and testing of **Amazon VPC Endpoints** and **Route 53 Resolver** configurations.  
It simulates a real-world integration with Active Directory (AD) for name resolution and connectivity.

## Components

- **VPC Endpoints**  
  Provides private connectivity to AWS services without traversing the public internet.

- **VPC Peering to AD VPC**  
  Enables secure communication between the training VPC and the Active Directory VPC for DNS and authentication scenarios.

- **Outbound Resolver**  
  Configured to forward DNS queries from workloads inside the training VPC to the AD DNS servers.

- **Test EC2 Instances**  
  - **Linux instance** for command-line DNS and network testing.  
  - **Windows instance** for GUI-based and AD-aware testing.  
  - Both instances are provisioned with a **Systems Manager (SSM) role** attached, allowing remote management without requiring SSH/RDP.  
  - Instances are launched using my **existing key pair** and tagged with my name for identification.

## Objectives
- Demonstrate how to deploy and configure VPC Endpoints.  
- Show how Route 53 Resolver outbound rules forward DNS queries to AD.  
- Validate connectivity across peered VPCs.  
- Test connectivity and name resolution using both Linux and Windows EC2s.  
- Provide a sandbox for experimenting with resolver rules and troubleshooting.

## Prerequisites
- AWS account with permissions to create VPCs, Route 53 resolvers, VPC endpoints, and EC2 instances.  
- Access to an AD VPC or lab environment for peering.  
- IAM role or credentials with sufficient privileges.  
- A valid **EC2 key pair** in the target AWS Region.  

## Next Steps
1. Provision the base VPC and subnets.  
2. Establish VPC peering with the AD VPC.  
3. Deploy endpoints and resolvers.  
4. Launch the Linux and Windows EC2 instances with the SSM role.  
5. Configure DNS forwarding rules.  
6. Test name resolution and connectivity from both servers.  

=======
# Terraform Test Deployment (AWS)

Disposable AWS environment for experimenting with networking, compute, and Route 53 Resolver.  
Designed to be easy to spin up and tear down.

> ⚠️ **Costs**: Creating VPCs, NAT gateways, EC2, and Resolver endpoints can incur charges. Destroy when done.

---

## What this deploys (at a glance)

- **Networking** (VPC scaffolding: subnets/RTs/IGW/NAT as configured)
- **Compute** (sample EC2 or similar test resources)
- **Route 53 Resolver** (outbound endpoint and forwarder rule(s), plus VPC associations)

The repository is organized as:


*(See repo file list on GitHub for the latest.)* :contentReference[oaicite:0]{index=0}

---

## Prerequisites

- **Terraform** ≥ 1.5 (or OpenTofu equivalent)
- **AWS account** with permissions to create VPC, EC2, IAM, and Route 53 Resolver resources
- **AWS CLI** configured (`aws configure`) or SSO/assumed role
- An **SSH key pair** if an instance/key is required by your variables

---

## Quick start

```bash
# Clone
git clone https://github.com/geekydiva/terraform_test_deployment.git
cd terraform_test_deployment

# (Optional) pick a profile/region (example)
export AWS_PROFILE=default
export AWS_REGION=us-east-1

# Initialize providers & modules
terraform init

# Create a tfvars with your settings
cp example.auto.tfvars.example example.auto.tfvars  # if present
# ...or create your own .auto.tfvars (see "Configuration" below)

# Plan and apply
terraform plan -out=tf.plan
terraform apply "tf.plan"
>>>>>>> d67e752083f58824db7d2550555acd478ca8cd95
