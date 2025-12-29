variable "name_prefix" {
  type = string
  description = "Name prefix for the EC2 instance"
}

variable "sequence_number" {
  type = string
  description = "Sequence number for the EC2 instance"
}

variable "ami_id" {
  type = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type = string
  description = "EC2 instance type (e.g., t3.micro)"
}

variable "subnet_id" {
  type = string
  description = "Subnet ID where the instance will be launched"
}

variable "security_group_ids" {
  type = list(string)
  description = "List of security group IDs to attach to the instance"
}

variable "c_disk_size" {
  type = number
  description = "Size in GB for the root (C) disk"
}

variable "d_disk_size" {
  type = number
  description = "Size in GB for the D data disk"
}

variable "tags" {
  type = map(string)
  description = "Map of tags to apply to the EC2 instance"
}

variable "ebs_tags" {
  type = map(string)
  description = "Map of tags to apply to the EBS volumes"
}

