
# 🚀 Terraform - EC2 & ALB Module

### 📌 Overview

This project provisions AWS infrastructure using Terraform.
It leverages custom modules for VPC, EC2, Security Groups, ALB and EIP to create a scalable and a highly available AWS environment

### 🛠️ Tech Stack

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![IaC](https://img.shields.io/badge/IaC-%2300C4B3.svg?style=for-the-badge&logo=databricks&logoColor=white)


### ✨ Features

- VPC Module → Creates VPC, public, private, and database subnets, route tables and associations, NAT Gateway, Elastic IP and internet gateway. Refer the git repo for VPC module and example - [vpc-module](https://github.com/ritushinde36/terraform-projects/tree/master/Project2-vpc-module)

- EC2, Security Group ,EIP Module → Launches EC2 instances and bastion hosts in the configured VPC & subnets. Manages ingress/egress rules for Bastion and private instances.Associates Elastic IPs with EC2 instances.Refer the git repo for this module and example - [ec2-sg-eip-module](https://github.com/ritushinde36/terraform-projects/tree/master/Project3-EC2-SG-EIP-module)

- ALB Module - Creates a DNS name to forward traffic to the EC2 instances present in a subnet across multiple availability zones



### 📂 Project Structure

```
Project3-EC2-SG-EIP-module/
├── modules/
│   ├── ec2-module/                     # EC2 instance creation
│   │   ├── data.tf                     # Data sources for fetching latest AMI
│   │   ├── ec2.tf                      # EC2 resource definitions
│   │   ├── output.tf                   # Outputs (instance IDs, public IPs, private IPs)
│   │   └── variables.tf                # Input variables for EC2 module
│   │
│   ├── eip-module/                     # Elastic IP assignment to instance
│   │   ├── eip.tf                      # Elastic IP resource definition
│   │   ├── output.tf                   # Outputs (EIP Public IP)
│   │   └── variables.tf                # Input variables for EIP module
│   │
│   ├── sg-module/                      # Security groups
│   │   ├── data.tf                     # Data sources (VPC ID)
│   │   ├── sg.tf                       # Security group and ingress/egress rules resource definitions
│   │   ├── output.tf                   # Outputs (SG ID)
│   │   └── variables.tf                # Input variables for SG module
│   │
│   ├── vpc-module/                     # VPC + networking
│   │   ├── vpc.tf                      # VPC resource definition
│   │   ├── subnets.tf                  # Public, private, and DB subnet creation
│   │   ├── internet-gateway.tf         # Internet Gateway resource
│   │   ├── nat-gateway.tf              # NAT Gateway resource in each Public subnet
│   │   ├── route_table.tf              # Route tables and associations
│   │   ├── elastic-ip.tf               # Elastic IP for NAT Gateway in each Public subnet
│   │   ├── variables.tf                # Input variables for VPC module
│   │
│   ├── alb-module/                     # Application Load Balancer
│   │   ├── alb.tf                      # ALB resource definition
│   │   ├── output.tf                   # Outputs
│   │   └── variables.tf                # Input variables for ALB module
│   │
│   └── clb-module/                     # Classic Load Balancer
│       ├── clb.tf                      # CLB resource definition and example usage
│       ├── output.tf                   # Outputs
│       └── variables.tf                # Input variables for CLB module
│
├── Private_Key/                        # SSH keys for EC2 access
│
├── resource-information/               # Infra documentation
│   └── vpc-creation-details.txt        # Info about VPC after creation
│
├── user_data/                          # EC2 user data scripts
│   └── private_user_data_script.sh     # Script for private instance bootstrap
│
├── main.tf                             # Root module configuration (calls modules)
├── variables.tf                        # Global input variables
├── versions.tf                         # Provider + Terraform version constraints
├── local.tf                            # Local values for reuse in configs
│
├── ec2.auto.tfvars                     # Variable file for EC2 module
├── sg.auto.tfvars                      # Variable file for SG module
├── vpc.auto.tfvars                     # Variable file for VPC module
├── alb.auto.tfvars                     # Variable file for ALB module
│
├── terraform.tfvars                    # Default variables
│
├── README.md                           # Project documentation
└── Project4-EC2-ALB.png                # Architecture diagram

```

### 📖 Prerequisites

- Terraform Version ≥ 1.8.3
- AWS provider version ≥ 6.4.0
- AWS CLI configured with valid credentials

### ⚙️ Usage 

1. Clone the repository
```
git clone https://github.com/ritushinde36/terraform-projects.git
cd Project4-EC2-ALB-module
```

2. Refer the [main.tf](./main.tf)
 configuration file as an example.
It is creating the following resources - 
    - VPC
    - Bastion host present in the public subnets
    - EC2 private hosts present in the private subnets
    - Bastion security group that will allow ssh access from anywhere
    - EC2 security group that will only allow ssh and http access from the vpc cidr block
    - Elastic IP for the bastion host
    - null resources that will -
        - copy the pem file onto the bastion host , so ssh is possible from bastion host to the EC2 private host
        - update the permissions of the .pem file
        - store the VPC details on the local machine executing this terraform code
    - ALB that will route traffic to the EC2 instances in the private subnet
    - ALB security group that will allow http traffic as ingress
    - Target group containing both the the EC2 instances in the private subnets
    - ALB listener attached to the ALB that forward http traffic to the Target Group




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

### 📤 Terraform Outputs

1. EC2 Instance Creation - Provisioned EC2 instances running in the target subnets.  
![alt text](./images/ec2.png)

2. Application Load Balancer (ALB) DNS - Public DNS of the ALB routing traffic to EC2 instances in us-east-1a and us-east-1b  
![alt text](./images/alb-1a.png)  
![alt text](./images/alb-1b.png)

3. Target Group Association and Load Balancer Health Checks - Target group attached to the ALB, forwarding traffic to EC2 instances in us-east-1a and us-east-1b as well as Health status of registered EC2 instances behind the ALB.   
![alt text](./images/tg.png)  


### 🔧 Inputs  

#### 📦 VPC Module (vpc-module)

| Name                      | Type   | Default | Description                                       |
| ------------------------- | ------ | ------- | ------------------------------------------------- |
| `vpc_cidr_block`          | string | n/a     | CIDR block for the VPC                            |
| `vpc_name`                | string | TF\_VPC | Name to assign to the VPC                         |
| `avail_zones`             | list(string)   | n/a     | List of availability zones to deploy subnets into |
| `public_subnet_cidrs`     | list(string)   | n/a     | List of public subnet CIDR blocks                 |
| `private_subnet_cidrs`    | list(string)   | n/a     | List of private subnet CIDR blocks                |
| `database_subnet_cidrs`   | list(string)   | n/a     | List of database subnet CIDR blocks               |
| `enable_internet_gateway` | bool   | false   | Whether to create an Internet Gateway             |
| `enable_NAT_gateway`      | bool   | false   | Whether to create a NAT Gateway                   |


#### 🔐 Security Group Module (sg-module)
| Name                         | Type   | Default | Description                                                                      |
| ---------------------------- | ------ | ------- | -------------------------------------------------------------------------------- |
| `security_group_name`        | string | Example_SG     | Name of the Security Group                                                       |
| `security_group_description` | string | Example_SG     | Description of the Security Group                                                |
| `vpc_id`                     | string | null     | VPC ID in which to create the Security Group                                     |
| `ingress_rules`              | list(map(string))   | n/a     | List of ingress rules (maps with from\_port, to\_port, ip\_protocol, cidr\_ipv4) |
| `egress_rules`               | list(map(string))   | n/a     | List of egress rules (maps with ip\_protocol, cidr\_ipv4)                        |

#### 💻 EC2 Module (ec2-module)
| Name                      | Type   | Default  | Description                                          |
| ------------------------- | ------ | -------- | ---------------------------------------------------- |
| `ec2_instance_type`       | string | n/a | Instance type for EC2                                |
| `ec2_instance_name`       | string | Example_EC2      | Name to assign to the EC2 instance                   |
| `ec2_instance_count`      | number | 1        | Number of EC2 instances to launch                    |
| `ec2_security_group_ids`  | list(string)   | []      | List of security group IDs to attach to the instance |
| `ec2_instance_subnet_ids` | list(string)   | n/a      | Subnet IDs in which to launch the instance(s)        |
| `ec2_instance_ami`        | string | null      | AMI ID to use for the EC2 (optional)   instance                   |
| `ec2_key_name`            | string | n/a      | SSH key name to attach to the EC2 instance           |
| `ec2_user_data`           | string | null     | User data script (optional)                          |

#### 🌐 Elastic IP Module (eip-module)
| Name              | Type   | Default | Description                                             |
| ----------------- | ------ | ------- | ------------------------------------------------------- |
| `ec2_instance_id` | string | n/a     | ID of the EC2 instance to associate with the Elastic IP |
| `elastic_ip_name` | string | n/a     | Name tag for the Elastic IP                             |


### ⚖️ Application Load Balance Module (alb-module)

| Name                       | Type   | Default | Description                                        |
| -------------------------- | ------ | ------- | -------------------------------------------------- |
| `app_lb_name`              | string | Example-ALB     | Name of the Application Load Balancer              |
| `app_lb_port`              | number | n/a      | Listener port for ALB                              |
| `app_lb_protocol`          | string | n/a    | Listener protocol for ALB                          |
| `app_lb_target_group_name` | string | Example-TG     | Name of the target group                           |
| `alb_vpc_id`               | string | n/a     | VPC ID for the ALB                                 |
| `app_lb_tg_instance_ids`   | list(string)   | n/a     | EC2 instance IDs to register with the target group |
| `app_lb_sg_ids`            | list(string)   | n/a     | Security group IDs for the ALB                     |
| `app_lb_subnet_ids`        | list(string)   | n/a     | Subnet IDs for ALB (usually public)                |
| `is_alb_internal`          | bool   | false   | Whether ALB is internal                            |



### 🗺️ Architecture Diagram

The following diagram shows the architecture created by the examples using the custom modules:

![image info](./Project4-EC2-ALB.png)

### 🙋 Author  

**Ritu Shinde**  

- 📧 [Email](mailto:shinderitu36@gmail.com)  
- 💼 [LinkedIn](https://www.linkedin.com/in/ritu-shinde-345a98323)  
- 💻 [GitHub](https://github.com/ritushinde36)  
- 🌐 [Blog](https://ritushinde.hashnode.dev/)  


