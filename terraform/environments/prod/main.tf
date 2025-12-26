module "web_security_group" {

  source = "../../modules/security_group"

  name   = "web-prod"
  vpc_id = var.vpc_id

  ingress_rules = [
    {
      from_port = 443
      to_port   = 443
      protocol  = "tcp"
      cidrs     = ["10.0.0.0/8"]
    },
    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidrs     = ["10.0.0.0/8"]
    }
  ]
}

module "anchor_security_group" {

  source = "../../modules/security_group"

  name   = "anchor-prod"
  vpc_id = var.vpc_id

  ingress_rules = [
    {
      from_port = 443
      to_port   = 443
      protocol  = "tcp"
      cidrs     = ["10.0.0.0/8"]
    },
    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidrs     = ["10.0.0.0/8"]
    }
  ]
}

module "workflow_instances" {
  for_each = var.workflow_instances

  source = "../../modules/ec2_instance"

  name_prefix        = each.value.name_prefix
  sequence_number    = each.value.sequence_number
  ami_id             = var.ami_id
  instance_type      = each.value.instance_type
  subnet_id          = each.value.subnet_id
  c_disk_size        = each.value.c_disk_size
  d_disk_size        = each.value.d_disk_size

  security_group_ids = [
    module.web_security_group.security_group_id
  ]

  tags = {
    Environment = "prod"
  }
}

module "anchor_instances" {
  for_each = var.anchor_instances

  source = "../../modules/ec2_instance"

  name_prefix        = each.value.name_prefix
  sequence_number    = each.value.sequence_number
  ami_id             = var.ami_id
  instance_type      = each.value.instance_type
  subnet_id          = each.value.subnet_id
  c_disk_size        = each.value.c_disk_size
  d_disk_size        = each.value.d_disk_size

  security_group_ids = [
    module.anchor_security_group.security_group_id
  ]

  tags = {
    Environment = "prod"
  }
}
