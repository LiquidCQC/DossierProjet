module "subnet-rds-priv-1a" {
  source      = "./modules/subnet"
  vpc_id      = module.my_vpc.my_vpc_id
  cidr_subnet = "172.16.5.0/24"
  az_subnet   = "eu-west-3a"
  public      = false
  tags_subnet = {
    Name = "restoproch-priv-rds-eu-west-3a",
    Kind = "production"
  }


}

# output "subnet-rds-priv-1a-id" {
#   value = module.subnet-rds-priv-1a.subnet_id
# }

module "subnet-rds-priv-1b" {
  source      = "./modules/subnet"
  vpc_id      = module.my_vpc.my_vpc_id
  cidr_subnet = "172.16.6.0/24"
  az_subnet   = "eu-west-3b"
  public      = false
  tags_subnet = {
    Name = "restoproch-priv-rds-eu-west-3b",
    Kind = "production"
  }


}

# output "subnet-rds-priv-1b-id" {
#   value = module.subnet-rds-priv-1b.subnet_id
# }
# rt association
module "rt_ass_rds_priv_1a" {
  source         = "./modules/rt_association"
  subnet_id      = module.subnet-rds-priv-1a.subnet_id
  route_table_id = module.private_rt.rt_id
}
module "rt_ass_rds_priv_1b" {
  source         = "./modules/rt_association"
  subnet_id      = module.subnet-rds-priv-1b.subnet_id
  route_table_id = module.private_rt.rt_id
}

# security group for rds 

module "sg_rds" {
  source = "./modules/security_group"

  ingress_rules = [
    {
      description     = "allow on 3306"
      from_port       = 3306
      to_port         = 3306
      protocol        = "tcp"
      cidr_blocks     = null
      security_groups = [module.sg_app_server.sg_id]
    }

  ]
  vpc_id         = module.my_vpc.my_vpc_id
  sg_name        = "restoproch_sg_rds"
  sg_description = "SG for rds"
  egress_rules = [
    {
      description     = "allow"
      from_port       = 3306
      to_port         = 3306
      protocol        = "tcp"
      cidr_blocks     = null
      security_groups = [module.sg_app_server.sg_id]
    }
  ]
  #security_groups = var.security_groups_app_server
  tags_sg = {
    Name = "restoproch-db-sg",
    Kind = "production"
  }
}

# output "sg_rds_id" {
#   value = module.sg_rds.sg_id
# }

# resource "aws_db_subnet_group" "subnet_group" {
#   name       = "restoproch-main"
#   subnet_ids = [module.subnet-rds-priv-1a.subnet_id,module.subnet-rds-priv-1b.subnet_id]

#   tags = {
#     Name = "My restoproch-DB subnet group"
#   }
# }

module "db_subnet_group" {
  source                  = "./modules/subnet_group"
  subnet_ids_subnet_group = [module.subnet-rds-priv-1a.subnet_id, module.subnet-rds-priv-1b.subnet_id]
  subnet_group_name       = "restoproch-main"
  tags_subnet_group = {
    Name = "My restoproch-DB subnet group"
    Kind = "production"
  }
}

# output subnet_group_id {
#   value = aws_db_subnet_group.subnet_group.id
# }

# rds

module "db" {
  source                 = "./modules/rds"
  identifier_name        = "restoproch-db"
  allocated_storage      = 10
  db_name                = "mydb"
  username               = var.username
  db_password            = "bAwDh3ooQ4duG-V3PG9"
  vpc_security_group_ids = [module.sg_rds.sg_id]
  tags_rds = {
    Name = "restoproch-db",
    Kind = "production"
  }
  subnet_group_name = module.db_subnet_group.subnet_group_id #"${aws_db_subnet_group.subnet_group.name}"
}