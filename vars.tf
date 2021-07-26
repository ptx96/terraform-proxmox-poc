variable "pm_api_url" {
  description = "The URL for Proxmox endpoint"
  default     = "https://192.168.1.100:8006/api2/json"
}

variable "pm_user" {
  description = "The user for Proxmox"
  default     = "alegrey91@pve"
}

variable "pm_password" {
  description = "The pwd for Proxmox user"
  default     = "clastix123"
}
