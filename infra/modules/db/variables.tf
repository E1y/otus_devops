variable db_disk_image {
    description = "Disk image"
    default     = "raddit-db-base"
}
variable public_key_path {
    description = "Path to the public key used for ssh access"
    default     = "~/.ssh/appuser.pub"
}