#public subnet
resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_subnet
  availability_zone       = var.az_subnet
  map_public_ip_on_launch = var.public
  tags                    = var.tags_subnet
}

# #private subnet
# resource "aws_subnet" "private_subnet" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "172.16.1.0/24"
#   availability_zone = "eu-west-3a"
#   map_public_ip_on_launch = "false"
#   tags = {
#     Name = "restoproch-pub-eu-west-3a",
#     Kind = "production"
#   }
# }