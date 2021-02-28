provider "proxmox" {
  pm_tls_insecure = "true"
}

resource "proxmox_vm_qemu" "vm" {
  clone       = var.template_name
  ciuser      = var.ssh_user
  cores       = var.cores
  count       = length(var.mac_addresses)
  cpu         = "kvm64"
  desc        = "Terraform managed VM"
  hotplug     = "network,disk,usb,memory"
  ipconfig0   = "ip=dhcp"
  memory      = var.memory
  name        = "${var.name_prefix}-${count.index}"
  numa        = true
  onboot      = true
  os_type     = "cloud-init"
  scsihw      = "virtio-scsi-pci"
  sockets     = 1
  ssh_user    = var.ssh_user
  sshkeys     = var.sshkeys
  target_node = var.target_node

  disk {
    size    = var.storage_size
    storage = var.storage_pool
    type    = "scsi"
    format  = "qcow2"
  }

  network {
    bridge  = var.bridge
    macaddr = var.mac_addresses[count.index]
    model   = "virtio"
  }
}
