output "54.193.195.187" {
  value       = module.ec2.public_ec2_ip
  description = "Public IP of bastion host"
}
output "172.31.13.23" {
  value       = module.ec2.private_ec2_ip
  description = "Private IP of private instance"
}
output "mini-dft-project-bucket" {
  value       = module.s3.bucket_name
  description = "S3 bucket created"
}

