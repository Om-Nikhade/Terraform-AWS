# DevOps Project to Automate Infrastructure on AWS UsinProject Overview

This project involves using Terraform, an Infrastructure as Code (IaC) tool, to automate the provisioning of key AWS infrastructure components. The goal is to create a Virtual Private Cloud (VPC) environment in AWS, complete with an EC2 instance, subnet, Internet Gateway, Route Table, Route Table Association, and Security Group. By defining the infrastructure in a .tf configuration file, the entire setup process becomes repeatable, scalable, and version-controlled.g Terraform 

## Key Objectives
- Infrastructure as Code: Demonstrate the power of Terraform to manage AWS resources declaratively.
- AWS Resource Provisioning: Automatically provision an EC2 instance, along with a VPC, subnet, and associated networking components.
- Security Best Practices: Implement a Security Group to restrict access to the EC2 instance, allowing only necessary traffic (e.g., SSH and HTTP).
- Automation and Reusability: Provide a reusable Terraform configuration that can be adapted for other projects or environments.

![Alt text](https://github.com/Om-Nikhade/Terraform-AWS/blob/main/Images/image.png)

![Alt text](https://github.com/Om-Nikhade/Terraform-AWS/blob/main/Images/image-1.png)

## Terraform Installed

Check out the official website to install Terraform here 

- AWS CLI Installed

- Navigate to the IAM dashboard on AWS, then select "Users."

- Enter the username and proceed to the next step.

- Assign permissions by attaching policies directly, opting for "Administrator access," and then create the user.

- Locate "Create access key" in user settings, and choose the command line interface (CLI) option to generate an access key.

- View or download the access key and secret access key either from the console or via CSV download.

![Alt text](https://github.com/Om-Nikhade/Terraform-AWS/blob/main/Images/image-2.png)

![Alt text](https://github.com/Om-Nikhade/Terraform-AWS/blob/main/Images/image-3.png)

![Alt text](https://github.com/Om-Nikhade/Terraform-AWS/blob/main/Images/image-5.png)

![Alt text](https://github.com/Om-Nikhade/Terraform-AWS/blob/main/Images/image-6.png)

![Alt text](https://github.com/Om-Nikhade/Terraform-AWS/blob/main/Images/image-7.png)

![Alt text](https://github.com/Om-Nikhade/Terraform-AWS/blob/main/Images/image-8.png)
