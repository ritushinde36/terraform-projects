
# 🚀 Terraform – Multi-AZ EC2 Deployment with Latest AMI

### 📌 Overview

This Terraform project automates the deployment of EC2 instances across all availability zones in a region, using the latest Amazon Machine Image (AMI) and ensuring that the chosen instance type is supported in each zone.

### 🛠️ Tech Stack

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![IaC](https://img.shields.io/badge/IaC-%2300C4B3.svg?style=for-the-badge&logo=databricks&logoColor=white)


### ✨ Features

- Automated AMI Selection – Dynamically fetches the most recent AMI available using the `data` block

- Smart Availability Zone Targeting – Identifies zones that support the given instance type using the `data` block to deploy instances only where compatible

- Multi-AZ Deployment – Ensures high availability by launching instances in multiple zones using the `resource` block

- Deployment Insights – Outputs a map showing each availability zone with its corresponding instance ID using the `output` block

- Secure – Attaches a security group that permits only essential traffic SSH (port 22), HTTP (port 80), and HTTPS (port 443).

- Self-Configuring Instances – User data script automatically installs Apache HTTPD and displays the availability zone name on the default webpage.
### 📂 Project Structure

terraform-ec2-multi-az/  
├── README.md # Project documentation  
├── provider.tf # Terraform + AWS provider configs  
├── variables.tf # Input variables  
├── outputs.tf # Output values (AZ → Instance ID map)  
  
├── ami.tf # Fetch latest AMI  
├── availability_zones.tf # Fetch supported AZs for instance type  
├── ec2.tf # EC2 deployment in supported AZs  
├── security_group.tf # Security group with ingress/egress rules  

├── user_data.sh # Apache installation script  
└── .gitignore # Ignore .terraform, tfstate, etc.  
### 📂 Project Structure

terraform-ec2-multi-az/  
├── README.md # Project documentation  
├── provider.tf # Terraform + AWS provider configs  
├── variables.tf # Input variables  
├── outputs.tf # Output values (AZ → Instance ID map)  
  
├── ami.tf # Fetch latest AMI  
├── availability_zones.tf # Fetch supported AZs for instance type  
├── ec2.tf # EC2 deployment in supported AZs  
├── security_group.tf # Security group with ingress/egress rules  

├── user_data.sh # Apache installation script  
└── .gitignore # Ignore .terraform, tfstate, etc.  
### 📖 Prerequisites

- Terraform Version ≥ 1.8.3
- AWS provider version ≥ 6.3.0
- AWS CLI configured with valid credentials
- IAM permissions for EC2, VPC, and Security Groups

### ⚙️ Usage 

1. Clone the repository
```
git clone https://github.com/<your-username>/<your-repo>.git
cd <project_name>
```

2. Initialize Terraform
```
terraform init
```

3. Preview the resources
```
terraform plan
```

4. Deploy the infrastructure
```
terraform apply
```

5. Access the EC2 Instances

Use the public IP of any deployed instance.

The default webpage will show the availability zone where it is running.

6. Destroy resources (when done)
```
terraform destroy
```

### 🔑 Outputs

AZ → Instance ID Map – Displays each availability zone along with the deployed instance ID for quick reference.

### 🙋 Author  

**Ritu Shinde**  

- 📧 [Email](mailto:shinderitu36@gmail.com)  
- 💼 [LinkedIn](https://www.linkedin.com/in/ritu-shinde-345a98323)  
- 💻 [GitHub](https://github.com/ritushinde36)  
- 🌐 [Blog](https://ritushinde.hashnode.dev/)  