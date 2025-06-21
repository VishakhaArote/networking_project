
# --- VPC Module ---
module "vpc" {
  source               = "./modules/vpc"
  name                 = var.name_prefix
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  availability_zone    = var.availability_zone
}

# --- Security Group Module ---
module "security_group" {
  source      = "./modules/security-group"
  name        = "${var.name_prefix}-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  
  depends_on = [module.vpc]
}

# Call EC2 module
module "ec2" {
  source            = "./modules/ec2"
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnet_id
  security_group_id  = module.security_group.sg_id
  key_name          = var.key_name
  user_data         = var.user_data
  name              = "${var.name_prefix}-ec2"
}
