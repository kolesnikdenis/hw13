locals { 
  common_tags= {
    Purpose = "Education"
    Project = "Hillel"
    Class = " Class 17"
  }
}

variable "instance_count" {
  default = "1"
  description = "number of instances by default = 1"
}

 

variable "instance_tags_name" {
  type = list
  description = "Default description name on instances"
  default = ["srv-module_def"]
}

variable "my_instance_type" {
  type = string
  default = "t2.micro"
  description = "My default instance: t2.micro"
}

variable "aip_attach" {
  type = bool
  default = false
  description = "Selector for ElasticIP  true= create and attach"
}

 
/*resource "aws_key_pair" "this" {
  key_name   = "this-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1abZTORZfmcoFvncNfzCF7ZOfmtdlylfkcR7NmaCGFHkcYiw/CbLFFQHrv2bWZlcTjBI1128JpBXxKGCnLcGNpu/cugKehEpOvZFNzzrwz8AQJ+ZELznBYUzGnCdwZPdofHCflTO5/ZXE2Inzm4S3EjhJkWS0LCepyFduyrPvlY24XAViR0vNx6PCVs+6DvOOOrmmiGc2+JS2oeTEU2kBROFqj0zsz2G8IxFuHyFDwXq6P4t729M+DgwbgrtTc9HZUg8bvluz66HvJlXKRCPtyRc5KtbDHtRi2E21mJvV1OOoGzJILuvqh8zNdWlVaGbXNpXYtHKAGwnffruwGnZ7 aniaml@animal-pc"
}*/


//variable "my_instance_type" { type = string }

//variable "aip_attach" { type = bool(string) }

//variable "instance_type" { type = string }

//variable "instance_tags" { type = list(string) }
