terraform {
  backend "local" {
    path = "proxmox_terraform.tfstate"
  }
}
