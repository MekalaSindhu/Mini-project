# VPC module
module "vpc" {
  source             = "./vpc"
  vpc_cidr_block     = var.vpc_cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr= var.private_subnet_cidr
  availability_zone  = var.availability_zone
}

# EC2 module
# MAIN TERRAFORM FILE



# VPC MODULE

module "vpc" {
  source              = "./vpc"
  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}


# EC2 MODULE

module "ec2" {
  source            = "./ec2"
  
  # VPC / Networking
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  public_sg_id      = module.vpc.public_sg_id
  private_sg_id     = module.vpc.private_sg_id
  
  # Key pair
  key_name          = var.key_name
}
# S3 MODULE
module "s3" {
  source      = "./s3"
  bucket_name = var.bucket_name
}


# OUTPUTS

output "public_ec2_ip" {
  value       = module.ec2.public_ec2_ip
  description = "Public IP of the bastion host EC2 instance"
}

output "private_ec2_ip" {
  value       = module.ec2.private_ec2_ip
  description = "Private IP of the internal EC2 instance"
}

output "s3_bucket_name" {
  value       = module.s3.bucket_name
  description = "Name of the created S3 bucket"
}

module "ec2" {
  source            = "./ec2"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  public_sg_id      = module.vpc.public_sg_id
  private_sg_id     = module.vpc.private_sg_id
  key_name          = var.key_name
}

# S3 module
module "s3" {
  source      = "./s3"
  bucket_name = var.bucket_name
}

# Outputs
output "public_ec2_ip" {
  value       = module.ec2.public_ec2_ip
  description = "Public IP of bastion host"
}

output "private_ec2_ip" {
  value       = module.ec2.private_ec2_ip
  description = "Private IP of private instance"
}

output "s3_bucket_name" {
  value       = module.s3.bucket_name
  description = "S3 bucket created"
}
