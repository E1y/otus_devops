variable app_disk_image {
    description = "Disk image"
    default     = "raddit-app-base"
}
variable private_key_path {
    description = "Path to the private key used for ssh access"
    default     = "~/.ssh/appuser"
}
variable public_key_path {
    description = "Path to the public key used for ssh access"
    default     = "~/.ssh/appuser.pub"
}
