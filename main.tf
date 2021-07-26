resource "proxmox_vm_qemu" "proxmox_vm" {
  desc        = "VM created by IaC POC"
  count       = 1
  name        = "clastix-vm-${count.index}"
  target_node = "pve"
  clone       = "kubelab-template"
  os_type     = "cloud-init"
  #cores       = 2
  sockets     = "1"
  cpu         = "host"
  memory      = 2048
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  agent       = 0
  disk {
    size     = "20G"
    type     = "scsi"
    storage  = "VM_SSD"
    iothread = 0
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  # Cloud Init Settings (Change the IP range and the GW to suit your needs)
  #  ipconfig0 = "ip=10.10.10.15${count.index + 1}/24,gw=10.10.10.1"
  #sshkeys = <<EOF
  #${SSHPERSONALPUBLICKEY}  
  #EOF
}