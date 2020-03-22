# variables.tf

variable "aws_region" {
  description = "The AWS region things are created in"
  type        = "string"
  default     = "us-east-1"
}

variable "aws_vpc_id" {
  description = "vpc_id where we create security group"
  type        = "string"
  default     = "vpc-054f54f388ade16e6"

}

variable "Traffic_Manager_IPs" {
  description = "Traffic Manager IPs list"
  type    = list(string)
  default = ["64.94.228.128/28", "216.52.39.0/24", "107.22.159.192/28" ]

}

variable "North_America_IPs" {
  description = "North America monitoring server ips"
  type    = list(string)
  default = ["69.71.111.140/32","69.71.111.141/32","207.126.59.91/32"]

}

variable "South_Central_America_IPs" {
  description = "South/Central  America monitoring server ips"
  type    = list(string)
  default = ["200.85.152.87/32","200.85.152.89/32","200.155.158.42/32"]

}

variable "EUROPE_IPs" {
  description = "List of Ips in EUROPE"
  type    = list(string)
  default = ["213.130.49.203/32", "213.130.49.205/32"]

}

variable "Asia-Pacific_IPs" {
  description = "List opf IPs in Asia-Pacific"
  type    = list(string)
  default = ["103.19.90.28/32", "103.19.90.29/32"]

}
