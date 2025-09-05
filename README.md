
# 🚀 Terraform Projects


### 📌 Overview

This repository contains multiple hands-on Terraform projects designed to explore Infrastructure as Code (IaC) concepts using AWS. Each project focuses on a specific AWS service or architectural pattern, helping to build modular, reusable, and production-like infrastructure.

### 🛠️ Tech Stack

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![IaC](https://img.shields.io/badge/IaC-%2300C4B3.svg?style=for-the-badge&logo=databricks&logoColor=white)


###  📂 Project Overview


| Project                              | Focus Area           | Description |
| ------------------------------------ | -------------------- | ------------------------------------------------------------------------------------ |
| 1️⃣ Project1 – Multi-AZ EC2           | Compute              | Automates deployment of EC2 instances across all Availability Zones in a region using the latest AMI, ensuring the chosen instance type is supported in each zone. |
| 2️⃣ Project2 – VPC Module             | Networking           | Reusable Terraform module to provision a VPC network on AWS with core networking components for a secure and scalable infrastructure. |
| 3️⃣ Project3 – EC2 + SG + EIP Module  | Compute + Networking | Provisions AWS infrastructure using custom modules for VPC, EC2, Security Groups, and EIP to create a scalable and reusable environment. |
| 4️⃣ Project4 – EC2 + ALB Module       | Load Balancing       | Provisions AWS infrastructure with VPC, EC2, Security Groups, ALB, and EIP to build a scalable and highly available AWS environment. |
| 5️⃣ Project5 – EC2 + ALB Project      | Load Balancing       | Demonstrates an application architecture where the ALB uses path-based routing to direct incoming traffic to specific EC2 instances. |
| 6️⃣ Project6 – RDS Module             | Database             | Demonstrates an application architecture with an ALB (path-based routing) directing traffic to EC2 instances and provisioning an RDS instance for persistence. |
| 7️⃣ Project7 – ASG + SNS Module       | Scaling + Monitoring | Provisions an ALB distributing traffic across EC2 instances in an Auto Scaling Group. A Target Tracking Policy ensures dynamic scaling. CloudWatch Alarms trigger SNS email notifications for scaling events. |
| 8️⃣ Project8 – S3 Static Website      | Storage + Hosting    | Provisions an Amazon S3 bucket to host a static website using Terraform. Configures the bucket for static website hosting and applies required policies for public access. |
| 9️⃣ Project9 – S3 + DynamoDB Backend  | Terraform Backend    | Configures remote Terraform backend with S3 for state storage and DynamoDB for state locking to prevent concurrent operations. |



### ⚙️ Skills & Tools

- Terraform: Modules, variables, outputs, remote backend, state management

- AWS: EC2, VPC, ALB, RDS, S3, DynamoDB, Auto Scaling, SNS

- Best Practices: High availability, modular architecture, reusable infrastructure code, version control (GitHub)

### 🙋 Author  

**Ritu Shinde**  

- 📧 [Email](mailto:shinderitu36@gmail.com)  
- 💼 [LinkedIn](https://www.linkedin.com/in/ritu-shinde-345a98323)  
- 💻 [GitHub](https://github.com/ritushinde36)  
- 🌐 [Blog](https://ritushinde.hashnode.dev/)  


