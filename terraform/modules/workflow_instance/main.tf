resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = false     

  root_block_device {
    volume_size = var.c_disk_size
    volume_type = "gp3"
  }

  ebs_block_device {
    device_name = "xvdf"
    volume_size = var.d_disk_size
    volume_type = "gp3"
  }

  tags = merge(
    {
      Name = "${var.name_prefix}${var.sequence_number}"
    },
    var.tags
  )
}
