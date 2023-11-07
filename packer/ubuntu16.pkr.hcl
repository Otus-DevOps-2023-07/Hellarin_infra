variable "folder_id" {
  type = string
  default = null
}

variable "service_account_key_file" {
  type = string
  default = null
}

variable "source_image_family" {
  type = string
  default = null
}

variable "ssh_username" {
  type = string
  default = null
}


source "yandex" "ubuntu16" {
service_account_key_file = var.service_account_key_file
folder_id = var.folder_id
source_image_family = var.source_image_family
image_name = "reddit-base-${formatdate("MM-DD-YYYY", timestamp())}"
image_family = "reddit-base"
ssh_username = var.ssh_username
platform_id = "standard-v1" 
use_ipv4_nat = "true"
}
build {
sources = ["source.yandex.ubuntu16"]


provisioner "shell" {
    name            = "ruby"
    script          = "./scripts/install_ruby.sh"
    execute_command = "sudo {{.Path}}"
  }

  provisioner "shell" {
    name            = "mongodb"
    script          = "./scripts/install_mongodb.sh"
    execute_command = "sudo {{.Path}}"
  }
}