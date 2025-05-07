# Terraform AWS Infrastructure Projects

This repository contains basic infrastructure-as-code (IaC) projects using Terraform to provision AWS resources.

## 📦 Projects

### 1. EC2 Instance Provisioning
- Launches a t2.micro Amazon Linux EC2 instance in AWS
- Creates a security group allowing HTTPS, HTTP, and SSH access
- Uses an AWS Key Pair for secure access

### 2. S3 Bucket with Versioning
- Creates a versioned S3 bucket with tags

## 🛠️ Technologies Used
- **Terraform** (v1.11.4)
- **AWS** (EC2, S3)
- Terraform AWS provider
- Local state (no remote backend configured)

## 🚀 Usage

1. Clone the repo:
   ```bash
   git clone https://github.com/florita1/infra-start.git
   cd infra-start/terraform/EC2 or infra-start/terraform/S3
   
2. Initialize Terraform:
   ```bash
   terraform init

3. Review the plan:
   ```bash
   terraform plan

4. Apply the configuration:
   ```bash
   terraform apply
   
5. Destroy resources (when finished):
   ```bash
   terraform destroy

## Project Structure
```
infra-start/
├── terraform/
│   ├── EC2/
│   │   └── CreateEc2.tf
│   └── S3/
│       └── CreateS3.tf
└── README.md

