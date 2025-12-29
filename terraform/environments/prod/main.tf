module "workflow_security_group" {

  source = "../../modules/security_group"

  name   = "workflow-prod-sg"
  vpc_id = var.vpc_id

  ingress_rules = [
    {
      from_port = 3389
      to_port   = 3389
      protocol  = "tcp"
      cidrs     = ["10.0.0.0/8"]
    },
    {
      from_port = 135
      to_port   = 135
      protocol  = "tcp"
      cidrs     = ["10.0.0.0/8"]
    },
    {
      from_port = 49152
      to_port   = 65535
      protocol  = "tcp"
      cidrs     = ["10.0.0.0/8"]
    },
    {
      from_port = 445
      to_port   = 445
      protocol  = "tcp"
      cidrs     = ["10.0.0.0/8"]
    },
    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidrs     = ["10.0.0.0/8"]
    },
    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidrs     = ["10.0.0.0/8"]
    },
    {
      from_port = 443
      to_port   = 443
      protocol  = "tcp"
      cidrs     = ["10.0.0.0/8"]
    },
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

  name   = "anchor-prod-sg"
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

# Workflow instances
module "workflow_instance_01" {
  source = "../../modules/workflow_instance"

  name_prefix        = var.workflow_name_prefix
  sequence_number    = "01"
  ami_id             = var.ami_id
  instance_type      = "t3.small"
  subnet_id          = ""
  c_disk_size        = 100
  d_disk_size        = 100

  security_group_ids = [
    module.workflow_security_group.security_group_id
  ]

  ebs_tags = {
    Environment = "prd"
    AppID       = "2222"
    CostString   = "prod-workflow"
  }

  tags = {
    Environment = "prd"
    AppID       = "2222"
    CostString   = "prod-workflow"
    Name        = "${var.workflow_name_prefix}01"
    ResourceName = "${var.workflow_name_prefix}01"
  }
}

module "anchor_instance_01" {
  source = "../../modules/anchor_instance"

  name_prefix        = var.anchor_name_prefix
  sequence_number    = "01"
  ami_id             = var.ami_id
  instance_type      = "t3.small"
  subnet_id          = ""
  c_disk_size        = 100
  d_disk_size        = 100

  security_group_ids = [
    module.anchor_security_group.security_group_id
  ]

    ebs_tags = {
    Environment = "prd"
    AppID       = "2222"
    CostString   = "prod-workflow"
  }

  tags = {
    Environment = "prd"
    AppID       = "2222"
    CostString   = "prod-anchor"
    Name        = "${var.anchor_name_prefix}01"
    ResourceName = "${var.anchor_name_prefix}01"
  }
}
