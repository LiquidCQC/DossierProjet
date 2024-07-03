#Project region
variable "region" {
  type = string
}
############################
#vpc
variable "tags_vpc" {
  type = map(any)
}

variable "cidr_vpc" {
  type = string
}

#############################
#subnet-1-public-eu-west-3a

# variable vpc_id {
#     type=string
# }

variable "cidr_subnet_1" {
  type = string
}

variable "az_subnet_1" {
  type = string
}

variable "tags_subnet_1" {
  type = map(any)
}

variable "public_1" {
  type = bool
}

#############################
#subnet-2-public-eu-west-3b

# variable vpc_id {
#     type=string
# }

variable "cidr_subnet_2" {
  type = string
}

variable "az_subnet_2" {
  type = string
}

variable "tags_subnet_2" {
  type = map(any)
}

variable "public_2" {
  type = bool
}

#############################
#subnet-3-public-eu-west-3a

# variable vpc_id {
#     type=string
# }

variable "cidr_subnet_3" {
  type = string
}

variable "az_subnet_3" {
  type = string
}

variable "tags_subnet_3" {
  type = map(any)
}

variable "public_3" {
  type = bool
}

#############################
#subnet-4-public-eu-west-3a

# variable vpc_id {
#     type=string
# }

variable "cidr_subnet_4" {
  type = string
}

variable "az_subnet_4" {
  type = string
}

variable "tags_subnet_4" {
  type = map(any)
}

variable "public_4" {
  type = bool
}

#############################
#igw

variable "tags_igw" {
  type = map(any)
}

##############################
#route_table

variable "rt_tags_pub" {
  type = map(any)
}
variable "rt_cidr_block_pub" {
  type = string
}

#route_table
variable "rt_tags_priv" {
  type = map(any)
}
variable "rt_cidr_block_priv" {
  type = string
}
##############################
#eip
variable "tags_eip" {
  type = map(any)
}
##############################
#nat
variable "tags_nat" {
  type = map(any)
}
##############################
#sg_alb_web

variable "ingress_rules_web" {
  type = list(any)
}
variable "sg_name_web" {
  type = string
}
variable "egress_rules_web" {
  type = list(any)
}
variable "sg_description_web" {
  type = string
}
# variable "security_groups_web" {
#   type = list(any)
# }
variable "tags_sg_web" {
  type = map(any)
}
##############################
#sg_alb_app
variable "ingress_rules_app" {
  type = list(any)

}
variable "sg_name_app" {
  type = string
}
variable "egress_rules_app" {
  type = list(any)
}
variable "sg_description_app" {
  type = string
}
# variable "security_groups_app" {
#   type = list(any)
# }
variable "tags_sg_app" {
  type = map(any)
}
##############################
#sg_web_server

variable "sg_name_web_server" {
  type = string
}
variable "egress_rules_web_server" {
  type = list(any)
}
variable "sg_description_web_server" {
  type = string
}
variable "tags_sg_web_server" {
  type = map(any)
}
##############################
#sg_app_server

variable "sg_name_app_server" {
  type = string
}
variable "egress_rules_app_server" {
  type = list(any)
}
variable "sg_description_app_server" {
  type = string
}
variable "tags_sg_app_server" {
  type = map(any)
}
##############################
#web alb
variable "tags_alb_web" {
  type = map(any)
}

#app alb
variable "tags_alb_app" {
  type = map(any)
}

##############################
#target group 
variable "tags_app_tg" {
  type = map(any)
}
variable "tags_web_tg" {
  type = map(any)
}

variable "username" {
  type = string
}

variable "db_password" {
  description = "Password for the database admin"
  type        = string
}

##############################
#sns
variable "email" {
  type = string
}

variable "kms_key_id" {
  type = string
}

##############################
# cloudwatch
variable "alarm_name" {
  description = "The descriptive name for the alarm. This name must be unique within the user's AWS account."
  type        = string
}

variable "alarm_description" {
  description = "The description for the alarm."
  type        = string
  default     = null
}

variable "comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold."
  type        = string
}
variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
}
variable "threshold" {
  description = "The value against which the specified statistic is compared."
  type        = number
  default     = null
}

variable "threshold_metric_id" {
  description = "If this is an alarm based on an anomaly detection model, make this value match the ID of the ANOMALY_DETECTION_BAND function."
  type        = string
  default     = null
}

variable "unit" {
  description = "The unit for the alarm's associated metric."
  type        = string
  default     = null
}

variable "metric_name" {
  description = "The name for the alarm's associated metric. See docs for supported metrics."
  type        = string
  default     = null
}

variable "namespace" {
  description = "The namespace for the alarm's associated metric. See docs for the list of namespaces. See docs for supported metrics."
  type        = string
  default     = null
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = string
  default     = null
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  type        = string
  default     = null
}

variable "actions_enabled" {
  description = "Indicates whether or not actions should be executed during any changes to the alarm's state. Defaults to true."
  type        = bool
  default     = true
}

variable "datapoints_to_alarm" {
  description = "The number of datapoints that must be breaching to trigger the alarm."
  type        = number
}

variable "dimensions" {
  description = "The dimensions for the alarm's associated metric."
  type        = map(string)
}

variable "alarm_actions" {
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type        = list(string)
  default     = null
}

variable "insufficient_data_actions" {
  description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type        = list(string)
  default     = null
}

variable "ok_actions" {
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type        = list(string)
  default     = null
}

variable "extended_statistic" {
  description = "The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100."
  type        = string
  default     = null
}

# CodePipeline

variable "codestar_connection_arn" {
  description = "The ARN of the CodeStar connection"
  type        = string
}

variable "repo_owner" {
  description = "The owner of the repository"
  type        = string
}

variable "repo_name" {
  description = "The name of the repository"
  type        = string
}

variable "branch_name" {
  description = "The branch name of the repository"
  type        = string
}

variable "pipeline_name" {

  type = string
}
variable "artifact_store_bucket_arn" {
  type = string
}

