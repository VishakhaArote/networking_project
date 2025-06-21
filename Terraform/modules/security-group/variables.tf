variable "name" {
  description = "Name tag for the Security Group"
  type        = string
}

variable "description" {
  description = "Description for the Security Group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to associate with the Security Group"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
