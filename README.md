# networking_project
Networking Project Assignment



## Overview

This project automates cloud infrastructure provisioning and application deployment using key DevOps tools: **Terraform**, **Ansible**, **Docker**, and **GitHub Actions**. It provisions AWS EC2 instances, configures them, deploys a Dockerized Flask web application, and manages continuous deployment through a CI/CD pipeline.

---

## Tools and Technologies

- **Terraform** – Infrastructure as Code tool for AWS resource provisioning
- **Ansible** – Automation tool used for configuring servers and deploying software
- **Docker** – Containerization platform to run the Flask web app
- **GitHub Actions** – CI/CD tool to automate deployment and configuration steps
- **AWS (EC2, VPC, S3, DynamoDB)** – Cloud platform and services used for deployment
- **Flask** – Lightweight Python web framework

---
## Part 1: Infrastructure Provisioning (Terraform)

### Objective

Provision AWS cloud infrastructure using Terraform with modular code design. This includes a VPC, security groups, and an EC2 instance.

### File Structure

**Root Directory:**

- `main.tf` – Calls all modules (vpc, security_group, ec2)
- `backend.tf` – Configures S3 remote backend and DynamoDB locking
- `outputs.tf` – Exposes public IP and other outputs

**Module Structure:**

- `modules/vpc/`
  - `main.tf` – Defines VPC, subnets, internet gateway, and routing
  - `variables.tf` – Input variables for the VPC module
  - `outputs.tf` – VPC-related outputs (e.g., subnet IDs, VPC ID)

- `modules/security_group/`
  - `main.tf` – Defines security group with ingress on ports 22 (SSH) and 5000 (Flask)
  - `variables.tf` – Input variables like allowed ports and CIDRs
  - `outputs.tf` – Outputs the security group ID

- `modules/ec2/`
  - `main.tf` – Launches EC2 instance using Ubuntu AMI
  - `variables.tf` – Key pair name, instance type, SG/VPC references
  - `outputs.tf` – Outputs the instance's public IP

### Notes

- Modular architecture enhances reusability and separation of concerns.
- State is stored in a secure S3 bucket with locking provided by DynamoDB.
- Resources are provisioned in the correct order via module dependency chaining.

### Run Instructions

```bash
terraform init
terraform plan
terraform apply





---

## Part 2: Configuration Management (Ansible)

### Objective

Install Docker, Git, and set up the Flask app on the provisioned EC2 instance.

### Files

- `Ansible/playbook.yml`

### Tasks

- Install Docker and enable service
- Install Git
- Clone Flask app repo
- Build and run the Docker container

### Run Instructions

```bash
ansible-playbook -i inventory playbook.yml
```

### Notes

- Uses SSH key stored in GitHub Secrets for access
- Docker runs on port `5000`

---

## Part 3: Docker Application Deployment

### Objective

Containerize and deploy a basic Flask web application.

### Files

- `DockerApp/app.py` – Flask app logic
- `DockerApp/requirements.txt` – Dependencies
- `DockerApp/Dockerfile` – Container image definition
- `DockerApp/templates/index.html` – Web template

### Dockerfile Summary

```dockerfile
FROM python:3.9
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]
```

### Run Instructions (within EC2 instance)

```bash
docker build -t flask-app .
docker run -d -p 5000:5000 flask-app
```

---

## Part 4: CI/CD Pipeline (GitHub Actions)

### Objective

Automate the provisioning and deployment workflow using GitHub Actions.

### Files

- `.github/workflows/deploy.yml`

### Key Features

- Manual trigger (workflow_dispatch) with `apply` or `destroy`
- Terraform: init, plan, apply/destroy
- Ansible: EC2 configuration and Docker deployment

### GitHub Secrets Required

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `EC2_SSH_KEY`
- `EC2_SSH_USER`

---

## Project Execution Order

1. Push code to GitHub
2. Trigger GitHub Actions workflow with `apply`
3. EC2 is provisioned via Terraform
4. Ansible sets up the server and deploys Flask app

---

## Authors

- Student Name: Vishakha Sadashiv Arote
- University: Dublin Business School
- Course: Msc in Cybersecurity

---

## License

 per project requirement
