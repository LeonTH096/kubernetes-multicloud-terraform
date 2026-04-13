> **⚠️ This project has been superseded by [devops-project-2026](https://github.com/LeonTH096/devops-project-2026).**
>
> This repo used custom Terraform modules written from scratch — an approach I moved away from
> after working with official community modules (Babenko `terraform-aws-modules`, Azure Verified Modules)
> in production. The new project uses battle-tested official modules, Terragrunt, Helm, and
> production-grade patterns that reflect how senior engineers actually build infrastructure.
>
> **This repository is archived and no longer maintained.**

# Kubernetes Multi-Cloud Infrastructure

Production-grade Kubernetes infrastructure deployed across **Azure (AKS)** and **AWS (EKS)** using Terraform, demonstrating cloud-agnostic DevOps practices and multi-cloud expertise.

> **Portfolio Highlight:** This project showcases the ability to design and implement identical Kubernetes infrastructure across multiple cloud providers, emphasizing infrastructure-as-code principles and cloud platform knowledge.

---

## 🎯 Project Overview

This repository contains parallel implementations of a complete Kubernetes infrastructure on both Azure and AWS, following infrastructure-as-code best practices and cloud-native architecture patterns.

### 🌟 Why Multi-Cloud?

- **Cloud Agnostic Skills**: Demonstrates deep understanding of both major cloud platforms
- **Architectural Thinking**: Shows ability to abstract infrastructure patterns across providers
- **Real-World Relevance**: Many enterprises use multi-cloud strategies
- **Portfolio Differentiation**: Goes beyond single-cloud tutorials

---

## 🏗️ Architecture

### Azure Implementation (AKS)
```
Azure Resource Group
├── Virtual Network (10.0.0.0/16)
│   ├── AKS Subnet
│   ├── Services Subnet
│   └── Network Security Groups
├── Azure Container Registry (ACR)
├── Azure Kubernetes Service (AKS)
│   ├── System Node Pool
│   └── User Node Pool
└── Storage Account (Terraform State)
```

### AWS Implementation (EKS)
```
AWS VPC (10.0.0.0/16)
├── Public Subnets (Multi-AZ)
├── Private Subnets (Multi-AZ)
├── Internet Gateway & NAT Gateways
├── Security Groups
├── Elastic Container Registry (ECR)
├── Elastic Kubernetes Service (EKS)
│   ├── Managed Node Groups
│   └── Fargate Profiles (optional)
└── S3 Bucket (Terraform State)
```

**Detailed Architecture:** 
- [Azure Architecture](azure/docs/architecture.md)
- [AWS Architecture](aws/docs/architecture.md)

---

## 🛠️ Tech Stack

**Infrastructure as Code:**
- Terraform (modular design, reusable modules)
- Cloud-provider specific: Azure RM, AWS Provider

**Cloud Platforms:**
- **Azure**: AKS, ACR, VNet, NSGs
- **AWS**: EKS, ECR, VPC, Security Groups

**Container Orchestration:**
- Kubernetes (both managed services)

**CI/CD & DevOps:**
- GitHub Actions (planned)
- GitOps workflows (planned)

---

## 📁 Repository Structure
```
kubernetes-multicloud-terraform/
├── azure/                      # Azure AKS implementation
│   ├── terraform/
│   │   ├── modules/           # Reusable Azure modules
│   │   │   ├── networking/    # VNet, Subnets, NSGs
│   │   │   ├── acr/          # Container Registry
│   │   │   ├── aks/          # Kubernetes cluster
│   │   │   └── storage/      # State storage
│   │   └── environments/
│   │       └── dev/          # Development environment
│   ├── kubernetes/           # K8s manifests for Azure
│   └── docs/                 # Azure-specific docs
│
├── aws/                       # AWS EKS implementation
│   ├── terraform/
│   │   ├── modules/          # Reusable AWS modules
│   │   │   ├── networking/   # VPC, Subnets, Security Groups
│   │   │   ├── ecr/         # Container Registry
│   │   │   ├── eks/         # Kubernetes cluster
│   │   │   └── storage/     # State storage
│   │   └── environments/
│   │       └── dev/         # Development environment
│   ├── kubernetes/          # K8s manifests for AWS
│   └── docs/                # AWS-specific docs
│
└── docs/                     # Cross-cloud documentation
    ├── architecture.md       # Overall architecture
    ├── cost-comparison.md    # Azure vs AWS costs
    └── deployment-guide.md   # Deployment instructions
```

---

## 📋 Prerequisites

- **Cloud CLIs:**
  - Azure CLI (`az`) - for Azure deployment
  - AWS CLI (`aws`) - for AWS deployment
- **Infrastructure Tools:**
  - Terraform >= 1.14
  - kubectl >= 1.34
- **Authentication:**
  - Azure: `az login`
  - AWS: `aws configure` or AWS SSO
- **Version Control:**
  - Git

---

## 🚀 Quick Start

### Azure Deployment
```bash
# Navigate to Azure environment
cd azure/terraform/environments/dev

# Authenticate
az login

# Initialize Terraform
terraform init

# Plan infrastructure
terraform plan

# Deploy (when ready)
terraform apply

# Get AKS credentials
az aks get-credentials --resource-group <rg-name> --name <aks-name>
kubectl get nodes
```

### AWS Deployment
```bash
# Navigate to AWS environment
cd aws/terraform/environments/dev

# Authenticate (if using SSO)
aws sso login --profile <your-profile>

# Initialize Terraform
terraform init

# Plan infrastructure
terraform plan

# Deploy (when ready)
terraform apply

# Get EKS credentials
aws eks update-kubeconfig --name <cluster-name> --region eu-west-1
kubectl get nodes
```

---

## 🗺️ Development Roadmap

### ✅ Phase 1: Foundation (Completed)
- [x] Multi-cloud repository structure
- [x] Azure networking module
- [x] Project documentation

### 🔄 Phase 2: AWS Infrastructure (In Progress)
- [ ] AWS VPC networking module
- [ ] ECR module
- [ ] EKS cluster module
- [ ] Remote state configuration

### 📅 Phase 3: Azure Completion
- [ ] Complete AKS module
- [ ] ACR integration
- [ ] Azure deployment testing

### 📅 Phase 4: Application Layer
- [ ] Sample microservices
- [ ] Ingress controllers
- [ ] Monitoring (Prometheus/Grafana)

### 📅 Phase 5: Automation
- [ ] GitHub Actions CI/CD
- [ ] Terraform validation workflows
- [ ] Security scanning
- [ ] Cost estimation automation

---

## 💰 Cost Considerations

**Azure (estimated):**
- AKS cluster: ~€70-100/month
- ACR Basic: ~€5/month
- Networking: ~€10-20/month

**AWS (estimated):**
- EKS cluster: ~$75-100/month
- ECR: ~$0.10/GB stored
- NAT Gateways: ~$30-45/month

**💡 Cost Optimization:**
- Use smallest node sizes for development
- Destroy infrastructure when not in use (`terraform destroy`)
- Leverage free tiers where available

> **Note:** This project uses ephemeral infrastructure - deploy when learning, destroy when done!

---

## 📚 Documentation

- [Overall Architecture](docs/architecture.md)
- [Azure vs AWS Comparison](docs/cost-comparison.md)
- [Deployment Guide](docs/deployment-guide.md)
- [Azure Specific Docs](azure/docs/)
- [AWS Specific Docs](aws/docs/)

---

## 🔒 Security

- Network segmentation with dedicated subnets
- Security Groups / NSGs for traffic control
- RBAC for Kubernetes access
- Private endpoints for container registries (optional)
- Secrets management best practices

---

## 🤝 About This Project

This is a **portfolio project** demonstrating:
- Multi-cloud infrastructure expertise
- Terraform module design patterns
- Kubernetes deployment strategies
- Cloud-agnostic DevOps thinking
- Infrastructure-as-code best practices

Built as part of professional development in cloud-native technologies and DevOps practices.

---

## 📝 License

MIT License - See [LICENSE](LICENSE)

---

## 👤 Author

**Leonardo Colangelo**
- **Location:** Torino, Italy
- **GitHub:** [@LeonTH096](https://github.com/LeonTH096)
- **LinkedIn:** [leonardocolangelo](https://linkedin.com/in/leonardocolangelo)

**Certifications:**
- AWS Certified Solutions Architect - Associate
- Azure Network Engineer Associate

---

⭐ **If you find this project useful or interesting, please give it a star!**

*Building cloud-native infrastructure, one Terraform module at a time.*
