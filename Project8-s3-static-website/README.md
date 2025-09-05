
# 🚀 Static Website Hosting on AWS S3 with Terraform


### 📌 Overview

This project provisions an **Amazon S3 bucket** to host a **static website** using Terraform.  

It leverages a custom Terraform module (s3-static-website) to provision an S3 bucket, configure it for static website hosting, and apply the required policies for public access.

### 🛠️ Tech Stack

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![IaC](https://img.shields.io/badge/IaC-%2300C4B3.svg?style=for-the-badge&logo=databricks&logoColor=white)


### ✨ Features

- Provisions an **S3 bucket** for static website hosting  
- **Enables versioning** to track and retain object history  
- Configures the necessary **ACLs** and **bucket policies**  
- Grants **public read access** for website content delivery  
- Uploads an `index.html` file as the **default landing page**

### 📂 Project Structure

```
Project8-s3-static-website/
├── index_file/  
│   └── index.html                   # Landing page for the static website  
├── modules/  
│   └── s3-static-website/           # Custom S3 static website module  
│       ├── s3.tf                    # Resource definitions (S3 bucket, ACLs, policy) 
│       ├── variables.tf             # Module input variables  
│       └── output.tf                # Module outputs (bucket name, website URL)   
├── main.tf                          # Root Terraform config (calls module)  
├── variables.tf                     # Root input variables  
├── output.tf                        # Root output values  
├── versions.tf                      # Provider + Terraform version constraints
├── terraform.tfvars                 # Variable values for this project  
└── README.md                        # Project documentation                       
```

### 📖 Prerequisites

- Terraform Version ≥ 1.8.3
- AWS provider version ≥ 6.4.0
- AWS CLI configured with valid credentials

### ⚙️ Usage 

1. Clone the repository
```
git clone https://github.com/ritushinde36/terraform-projects.git
cd Project8-s3-static-website
```

2. Refer the [main.tf](./main.tf)
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

### 🔧 Inputs  

#### 🌍 S3 Static Website Module Inputs  (s3-static-website)
| Name             | Type   | Default | Description                                                                 |
| ---------------- | ------ | ------- | --------------------------------------------------------------------------- |
| `s3_bucket_name` | string | n/a     | Name of the S3 bucket to host the static website (must be globally unique). |
| `s3_bucket_tags` | map(string)    | n/a    | Key-value map of tags to assign to the S3 bucket.                           |
| `s3_index_path`  | string | n/a     | Path to the `index.html` file that serves as the landing page.              |

### 🙋 Author  

**Ritu Shinde**  

- 📧 [Email](mailto:shinderitu36@gmail.com)  
- 💼 [LinkedIn](https://www.linkedin.com/in/ritu-shinde-345a98323)  
- 💻 [GitHub](https://github.com/ritushinde36)  
- 🌐 [Blog](https://ritushinde.hashnode.dev/)  


