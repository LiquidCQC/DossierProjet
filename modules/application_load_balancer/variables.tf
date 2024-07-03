variable "tags_alb" {
  type = map(any)
}
variable "security_groups" {
  type = list(any)
}
variable "name" {
  type = string
}
variable "subnets" {
  type = list(any)
}

variable "is_internal" {
  type    = bool
  default = false
}

