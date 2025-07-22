output "vpc_id" {
  value = module.vpc.vpc_id
}
output "alb_dns" {
  value = module.ec2.alb_dns
}
output "rds_endpoint" {
  value = module.database.rds_endpoint
}
