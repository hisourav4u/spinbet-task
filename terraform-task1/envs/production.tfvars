# VPC configuration
vpc_name = "production-vpc"
vpc_cidr = "10.1.0.0/16"
public_subnets = {
  "public-1" = { cidr = "10.1.1.0/24", az = "us-east-1a" }
  "public-2" = { cidr = "10.1.2.0/24", az = "us-east-1b" }
}
private_subnets = {
  "private-1" = { cidr = "10.1.3.0/24", az = "us-east-1a" }
  "private-2" = { cidr = "10.1.4.0/24", az = "us-east-1b" }
}

# EC2 configuration
default_ami_id = "ami-0c55b159cbfafe1f0"

ec2_instances = {
  "instance-1" = {
    instance_type = "t3.medium"
    subnet_type   = "public"
    subnet_name   = "public-1"
    key_name      = "pem-key"
    tags = {
      Environment = "production"
      Role        = "web"
    }
  },
  "instance-2" = {
    instance_type = "t3.large"
    subnet_type   = "private"
    subnet_name   = "private-1"
    key_name      = "pem-key"
    tags = {
      Environment = "production"
      Role        = "app"
    }
  }
}

# RDS configuration
rds_instances = {
  "mysql-main" = {
    engine                = "mysql"
    engine_version        = "8.0"
    instance_class        = "db.t3.medium"
    allocated_storage     = 100
    username              = "admin"
    password              = "Pass123!"
    db_name               = "maindb"
    publicly_accessible   = false
    subnet_names          = ["private-1", "private-2"]
    multi_az              = true  # Enabled for high availability in production
    tags = {
      Environment = "production"
      Service     = "mysql-database"
    }
  }
}
