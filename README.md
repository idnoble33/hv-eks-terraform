Great — here is the final version of the `README.md` file for your Hiive EKS Terraform project. It's production-ready, clear, and structured for technical reviewers:

---

```markdown
# 🚀 HV EKS Terraform Project

This repository contains a complete Terraform configuration to deploy a **containerized NGINX service** on **Amazon Elastic Kubernetes Service (EKS)**. It provisions all required infrastructure components, making it easy to spin up a production-grade Kubernetes cluster on AWS.

---

## 📦 What's Included

- ✅ VPC with public and private subnets across availability zones
- ✅ Internet Gateway and route tables for connectivity
- ✅ EKS cluster (control plane)
- ✅ Managed node group for compute
- ✅ Kubernetes deployment of NGINX
- ✅ External Load Balancer for public access

---

## 📁 Folder Structure

```

hv-eks-terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── versions.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── eks/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── app/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── README.md

````

---

## 🚀 Quick Start Guide

### ✅ Prerequisites

- Terraform v1.4+
- AWS CLI configured (`aws configure`)
- IAM permissions to create EKS, VPC, IAM, EC2, etc.
- `kubectl` installed and configured

---

### ⚙️ Deploy in 5 Steps

#### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/hv-eks-terraform.git
cd hv-eks-terraform
````

#### 2. Initialize Terraform

```bash
terraform init
```

#### 3. Deploy the infrastructure

```bash
terraform apply -auto-approve
```

⏳ This may take 15–25 minutes — EKS provisioning takes time.

#### 4. Configure `kubectl` to use the new cluster

```bash
aws eks --region <your-region> update-kubeconfig --name hv-eks-cluster
```

#### 5. Verify everything is up

```bash
kubectl get nodes
kubectl get svc
```

---

## 🌐 Access the App

After deployment, run:

```bash
kubectl get svc nginx-service
```

Find the **EXTERNAL-IP** in the output and open it in your browser to see the running NGINX server.

---

## 📌 Design Decisions

### Modular Infrastructure

Each Terraform module is reusable and independent:

* `vpc`: Creates a multi-AZ VPC with public/private subnets
* `eks`: Deploys an EKS cluster with managed node groups
* `app`: Deploys a simple NGINX Kubernetes deployment and service

### Best Practices Followed

* Subnets tagged for EKS auto-discovery (`kubernetes.io/cluster/...`)
* IAM roles scoped with AWS-managed EKS policies
* Node group configured with `t3.medium` and proper EC2 permissions
* External and internal subnets differentiated for ELB purposes

---

## 🔧 Tools & Versions

| Tool      | Version         |
| --------- | --------------- |
| Terraform | >= 1.4          |
| AWS EKS   | Kubernetes 1.32 |
| kubectl   | Latest stable   |

---

## 🧼 Tear Down

To delete all resources and avoid charges:

```bash
terraform destroy -auto-approve
```

---

## 📸 Screenshot

> *(Optional: Include a screenshot of your EKS dashboard or the NGINX landing page here)*

---

## 🧑‍💻 Author

**Idowu** — created for the Hv Infrastructure Take-Home Interview


