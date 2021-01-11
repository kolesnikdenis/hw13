
variable "instance_count" {
  default = "2"
}

variable "instance_tags_name" {
  type = list
  default = ["srv-1", "srv-2", "srv-3"]
}

