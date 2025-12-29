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

variable "anchor_name_prefix" {
  description = "Name prefix for anchor instances"
  type        = string
  default     = "anchor"
}

variable "workflow_name_prefix" {
  description = "Name prefix for workflow instances"
  type        = string
  default     = "workflow"
}