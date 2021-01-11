
module "create_instance" {
  instance_count              = "${var.instance_count}"
  instance_tags_name = "${var.instance_tags_name}"
  source             = "./mod/create_instance"
}


