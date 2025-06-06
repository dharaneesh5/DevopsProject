# 2-Tier AWS Architecture with Terraform

## Overview

This project implements a 2-tier architecture in AWS using Terraform. It includes a public-facing web tier and a private backend tier for Running Applications and storing data.

---

## Architecture Diagram

![image alt](https://github.com/dharaneesh5/DevopsProject/blob/4a1056d79b8b40b3298e997597fccfe267cbd25f/2-tire-application/Screenshot%202025-05-26%20113317.png)

---

## Components

- *VPC*: Custom Virtual Private Cloud with public and private subnets.
- *Internet Gateway*: Provides internet access to public subnet.
- *Public Subnet*:
  - EC2 instances (Web/App servers)
  - Application Load Balancer (ALB)
- *Private Subnet*:
  - EC2 instances or RDS (Database servers)
- *Route Tables*: Proper routing between subnets and to/from internet.
- *Security Groups*: Secure the instances by allowing only necessary traffic.

---

## Features

- Infrastructure as Code using Terraform
- Multi-AZ deployment for high availability
- Secure architecture using private subnets
- Scalable setup with ALB and optional Auto Scaling

---

## Prerequisites

- AWS CLI configured
- Terraform installed
- IAM user with appropriate permissions

---

## How to Deploy

```bash
# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Apply configuration
terraform apply
