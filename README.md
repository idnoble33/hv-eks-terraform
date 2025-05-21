# Hiive EKS Terraform Project

This project sets up a containerized NGINX service running on AWS EKS using Terraform.

## 📦 Features

- Custom VPC with public and private subnets
- EKS cluster with managed node group
- Kubernetes deployment of NGINX with a LoadBalancer

---

## 🚀 Deployment Instructions

### ✅ Prerequisites

- Terraform >= 1.3
- AWS CLI configured (`aws configure`)
- `kubectl` installed
- AWS IAM permissions to create EKS and networking

---

### 📁 Steps to Deploy

1. Clone this repo:
```bash
git clone https://github.com/YOUR_GITHUB/hv-eks-terraform.git
cd hv-eks-terraform
