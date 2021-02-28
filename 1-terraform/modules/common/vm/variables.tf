variable "sshkeys" {
  type    = string
  default = ""
}

variable "mac_addresses" {
  type    = list(string)
  default = []
}

variable "name_prefix" {
  type    = string
  default = "vm"
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2048
}

variable "ssh_user" {
  type    = string
  default = "terraform"
}

variable "bridge" {
  type    = string
  default = "vmbr0"
}

variable "storage_size" {
  type    = string
  default = "25G"
}

variable "storage_pool" {
  type    = string
  default = "local-lvm"
}

variable "target_node" {
  type    = string
  default = "pve"
}

variable "template_name" {
  type    = string
  default = "template"
}

variable "disk_format" {
  type    = string
  default = "qcow2"
}