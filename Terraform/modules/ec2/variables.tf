# ec2/variables.tf
variable "ami" { 
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type (e.g., t2.micro)"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID to associate with the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "user_data" {
  description = "Optional user data script for EC2 instance startup"
  type        = string
  default     = ""
}

variable "name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "ec2-instance"
}
