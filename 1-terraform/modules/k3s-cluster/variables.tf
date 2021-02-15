variable "sshkeys" {
  description = "ssh keys to drop onto each vm"
  type = string
}

variable "mac_addresses" {
  description = "List of mac addresses for cluster nodes"
  type        = list(string)
}

variable "name_prefix" {
  description = "Prefix for node names"
  type = string
}

variable "cores" {
  description = "number of cores to give each vm"
  type = number
}

variable "memory" {
  description = "amount of memory in MB give each vm"
  type = number
}

variable "ssh_user" {
  description = "user to put ssh keys under"
  type = string
}

variable "bridge" {
  description = "bridge to use for network"
  type = string
}

variable "storage_size" {
  description = "amount of storage to give nodes"
  type = string
}

variable "storage_pool" {
  description = "storage pool to use for disk"
  type = string
}

variable "target_node" {
  description = "node to deploy on"
  type = string
}

variable "template_name" {
  description = "template to use"
  type = string
}
