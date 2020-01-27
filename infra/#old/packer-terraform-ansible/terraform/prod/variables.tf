variable project {
    description = "Project ID"
}
variable region {
    description = "Region"
    default = "europe-west3"
}
variable app_disk_image {
    description = "Disk image"
    default     = "raddit-app-base"
}
variable db_disk_image {
    description = "Disk image"
    default     = "raddit-db-base"
}
variable private_key_path {
    description = "Path to the private key used for ssh access"
}
variable public_key_path {
    description = "Path to the public key used for ssh access"
}