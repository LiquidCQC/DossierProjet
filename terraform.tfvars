#Project region
region = "eu-west-3"
###################
#vpc
tags_vpc = {
  Name = "RestoProch",
  Kind = "production"
}
cidr_vpc = "172.16.0.0/16"

######################
#subnet-1-public-eu-west-a
#vpc_id
cidr_subnet_1 = "172.16.1.0/24"
az_subnet_1   = "eu-west-3a"
public_1      = "true"
tags_subnet_1 = {
  Name = "restoproch-pub-eu-west-3a",
  Kind = "production"
}


#######################
#subnet-2-public-eu-west-3b
cidr_subnet_2 = "172.16.2.0/24"
az_subnet_2   = "eu-west-3b"
public_2      = "true"
tags_subnet_2 = {
  Name = "restoproch-pub-eu-west-3b",
  Kind = "production"
}


#######################
#subnet-1-private-eu-west-a
cidr_subnet_3 = "172.16.3.0/24"
az_subnet_3   = "eu-west-3a"
public_3      = "false"
tags_subnet_3 = {
  Name = "restoproch-priv-eu-west-3a",
  Kind = "production"
}

#######################
#subnet-2-private-eu-west-3b
cidr_subnet_4 = "172.16.4.0/24"
az_subnet_4   = "eu-west-3b"
public_4      = "false"
tags_subnet_4 = {
  Name = "restoproch-priv-eu-west-3b",
  Kind = "production"
}

#######################
#igw
tags_igw = {
  Name = "restoproch-igw",
  Kind = "production"
}

##############################
#route_table
rt_tags_pub = {
  Name = "restoproch-rt-public",
  Kind = "production"
}
rt_cidr_block_pub = "0.0.0.0/0"

#route_table
rt_tags_priv = {
  Name = "restoproch-rt-private",
  Kind = "production"
}
rt_cidr_block_priv = "0.0.0.0/0"

##############################
#eip
tags_eip = {
  Name = "restoproch-eip-1",
  Kind = "production"
}

##############################
#nat
tags_nat = {
  Name = "restoproch-nat-1",
  Kind = "production"
}
##############################
#sg_alb_web
sg_name_web = "web-app-alb-sg"
tags_sg_web = {
  Name = "restoproch-web-app-alb-sg",
  Kind = "production"
}
ingress_rules_web = [
  {
    description     = "allow on 443"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  },
  {
    description     = "allow on 80"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]

egress_rules_web = [
  {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]
sg_description_web = " SG for WEB ALB"

##############################
#sg_alb_web
sg_name_app = "application-alb-sg"
tags_sg_app = {
  Name = "restoproch-application-alb-sg",
  Kind = "production"
}
ingress_rules_app = [
  {
    description     = "allow on 443"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  },
  {
    description     = "allow on 80"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]

egress_rules_app = [
  {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]
sg_description_app = " SG for APP ALB"

##############################
#sg_web_server
sg_name_web_server = "web_server-sg"
tags_sg_web_server = {
  Name = "restoproch-web_server-sg",
  Kind = "production"
}
# ingress_rules_web_server = [
#   {
#     description = "allow on 443"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = null
#     security_groups       = [aws_security_group.alb-sg.id]
#   },
#   {
#     description = "allow on 80"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = null
#     security_groups       = [aws_security_group.alb-sg.id]
#   }
# ]

egress_rules_web_server = [
  {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]
sg_description_web_server = " SG for web_server"

##############################
#sg_app_server
sg_name_app_server = "app_server-sg"
tags_sg_app_server = {
  Name = "restoproch-app_server-sg",
  Kind = "production"
}
# ingress_rules_app_server = [
#   {
#     description = "allow on 443"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = null
#     security_groups       = [aws_security_group.alb-sg.id]
#   },
#   {
#     description = "allow on 80"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = null
#     security_groups       = [aws_security_group.alb-sg.id]
#   }
# ]

egress_rules_app_server = [
  {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]
sg_description_app_server = " SG for app_server"


##############################
#web alb
tags_alb_web = {
  Name = "restoproch-webtier-alb",
  Kind = "production"
}

#app alb
tags_alb_app = {
  Name = "restoproch-apptier-alb",
  Kind = "production"
}

##############################
#target group

tags_web_tg = {
  Name = "restoproch-webtier-tg",
  Kind = "production"
}

tags_app_tg = {
  Name = "restoproch-apptier-tg",
  Kind = "production"
}

##############################
#sns
email      = "restoproch@ecf.com"
kms_key_id = "alias/aws/sns"

##############################
# Cloudwatch
alarm_name          = "Alarm RestoProch"
alarm_description   = "Alarme RestoProch"
comparison_operator = "LessThanThreshold"
metric_name         = "HelthyHostCount"
namespace           = "AWS/ApplicationELB"
period              = "60"
statistic           = "average"
evaluation_periods  = 2
dimensions = {
  "name" = "value"
}
datapoints_to_alarm = 0
threshold           = 1


##############################
# Pipeline
# Iam
pipeline_name             = "restoproch-pipeline"
artifact_store_bucket_arn = "restoproch-artifact-bucket"
repo_name                 = "LiquidCQC"
repo_owner                = "reactapp2"
codestar_connection_arn   = "arn:aws:codestar-connections:eu-west-3:767397837946:connection/7d341efa-d767-4b05-983e-47efee90dae5"
branch_name               = "main"
