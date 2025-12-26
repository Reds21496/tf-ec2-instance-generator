variable "aws_region" {
  description = "AWS region"
  type        = string
  default = "us-east-1"
}

variable "vpc_id" {
  description = "VPC where EC2 instances will be created"
  type        = string
  default = "vpc-0571be13ac8d3a1be"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default = "ami-068c0051b15cdb816"
}

variable "workflow_instances" {
  type = map(object({
    name_prefix   = string
    sequence_number = string
    role          = string
    instance_type = string
    c_disk_size   = number
    d_disk_size   = number
    subnet_id     = string
  }))
}

variable "anchor_instances" {
  type = map(object({
    name_prefix   = string
    sequence_number = string
    role          = string
    instance_type = string
    c_disk_size   = number
    d_disk_size   = number
    subnet_id     = string
  }))
}