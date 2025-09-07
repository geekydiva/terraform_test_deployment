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
