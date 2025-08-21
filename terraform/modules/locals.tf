locals {
  sufix = "${var.tags.project}-${terraform.workspace}"
  s3_suffix = "${var.tags.project}-${terraform.workspace}-s3"
}