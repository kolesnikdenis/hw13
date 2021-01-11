resource "aws_instance" "this" {
  count         = "${var.instance_count}" 
  ami                    = "ami-076676d7ab2e49066"
  instance_type          = ( var.my_instance_type )
  vpc_security_group_ids = [aws_security_group.this.id]
  tags                   =  merge( local.common_tags, { "Name" = "${element(var.instance_tags_name, count.index)}  ${count.index+1} of ${var.instance_count}"} )
  key_name               = aws_key_pair.this.key_name
}

resource "aws_eip" "this" {
  count = ( var.aip_attach ? 1 : 0 )
  instance = aws_instance.this[*].id
  tags = local.common_tags 
}

resource "aws_security_group" "this" {
  name_prefix = "temporary"
  tags = local.common_tags
  description = " temporary SG for hillel class 17"
  egress { 
   from_port = 0 
   to_port = 0
   protocol  = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}

resource "aws_security_group_rule" "SSH" {
  description = "Allow ssh"
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "http" {
  description = "Allow http"
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "https" {
  description = "Allow http"
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}

resource "aws_key_pair" "this" {
  key_name   = "this-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1abZTORZfmcoFvncNfzCF7ZOfmtdlylfkcR7NmaCGFHkcYiw/CbLFFQHrv2bWZlcTjBI1128JpBXxKGCnLcGNpu/cugKehEpOvZFNzzrwz8AQJ+ZELznBYUzGnCdwZPdofHCflTO5/ZXE2Inzm4S3EjhJkWS0LCepyFduyrPvlY24XAViR0vNx6PCVs+6DvOOOrmmiGc2+JS2oeTEU2kBROFqj0zsz2G8IxFuHyFDwXq6P4t729M+DgwbgrtTc9HZUg8bvluz66HvJlXKRCPtyRc5KtbDHtRi2E21mJvV1OOoGzJILuvqh8zNdWlVaGbXNpXYtHKAGwnffruwGnZ7 aniaml@animal-pc"
}

output "instance_pub_ip" {
  value = aws_instance.this[*].public_ip
  sensitive = false
}

output "instance_pub_dns"{ 
  value = aws_instance.this[*].public_dns
}

output "elastic_ip" {
  value = aws_eip.this.*.public_ip
}