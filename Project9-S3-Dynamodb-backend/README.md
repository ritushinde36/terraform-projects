
# 🚀 Terraform Project with Remote Backend (S3 + DynamoDB)


### 📌 Overview

By default, Terraform stores its state file (`terraform.tfstate`) locally.  
However, in team environments, this can cause conflicts and inconsistencies.  

To address this:  
- The **state file** is stored remotely in an S3 bucket.  
- A **DynamoDB table** is used for **state locking** to prevent multiple users from running conflicting Terraform operations at the same time.  

This setup is widely used in industry for **collaborative Terraform workflows**.


### 🛠️ Tech Stack

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![IaC](https://img.shields.io/badge/IaC-%2300C4B3.svg?style=for-the-badge&logo=databricks&logoColor=white)


### ✨ Features

- Uses the custom VPC Module to create the VPC.Refer the git repo for VPC module and example - [vpc-module](https://github.com/ritushinde36/terraform-projects/tree/master/Project2-vpc-module)
- **Remote state storage** in S3 for centralized and shared state management. Refer - [versions.tf](./versions.tf)
- **State locking** with DynamoDB to avoid race conditions in team deployments. Refer - [versions.tf](./versions.tf)
- **Team-friendly workflow** that enables safe collaboration across multiple engineers.  
- **Scalable and production-ready** setup widely adopted in industry practices.  


### 📂 Project Structure

```
Project9-S3-Dynamodb-backend/
├── modules/
│   └── vpc-module/                     # Custom VPC module 
│
├── vpc.tf                              # VPC resource definitions (calls vpc-module)
├── variables.tf                        # Input variables
├── versions.tf                         # Provider + Terraform version constraints
│
└── README.md                           # Project documentation                 
```

### 📖 Prerequisites

- Terraform Version ≥ 1.8.3
- AWS provider version ≥ 6.4.0
- AWS CLI configured with valid credentials

### ⚙️ Usage 

1. Clone the repository
```
git clone https://github.com/ritushinde36/terraform-projects.git
cd Project9-S3-Dynamodb-backend
```

2. Refer the [vpc.tf](./vpc.tf)
 configuration file as an example.

3. Initialize Terraform
```
terraform init
```

4. Preview the resources
```
terraform plan
```

5. Deploy the infrastructure
```
terraform apply
```

6. Destroy resources (when done)
```
terraform destroy
```

### 🙋 Author  

**Ritu Shinde**  

- 📧 [Email](mailto:shinderitu36@gmail.com)  
- 💼 [LinkedIn](https://www.linkedin.com/in/ritu-shinde-345a98323)  
- 💻 [GitHub](https://github.com/ritushinde36)  
- 🌐 [Blog](https://ritushinde.hashnode.dev/)  


