<<<<<<< HEAD
# 🌐 Three-Tier Web Application Infrastructure with Terraform

This project demonstrates a fully automated and scalable **three-tier architecture** on AWS using **Terraform**.  
It includes a **frontend load balancer**, **Nginx-based application layer**, and a **backend RDS database**, all provisioned through Infrastructure as Code (IaC).

>  

---

---

## Features

-  **Modular structure** with separate Terraform modules for:
  - VPC (with public/private subnets)
  - EC2 (App Layer with Nginx)
  - ALB (Application Load Balancer)
  - RDS (Relational Database Service)
-  **Nginx installed automatically** on EC2 using `user_data` script.
-  **Highly available and secure** using:
  - Public/Private Subnet isolation
  - NAT Gateway and Internet Gateway
  - Security Groups for controlled traffic
-  **Scalable design** using `count` to launch multiple EC2 instances.
-  **Output variables** for visibility into deployed resources.

---

##  Technologies Used

- **Terraform** (IaC)
- **AWS** (VPC, EC2, ALB, RDS, Security Groups)
- **Nginx** (Application Layer)
- **Ubuntu** or **Amazon Linux** AMI

---





=======
# terraform-3tier-architecture-
>>>>>>> 7b9bab29281cad107ae777ed67a50074a64a617c
