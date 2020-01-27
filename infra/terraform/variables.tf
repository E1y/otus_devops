variable "project" {
    description = "Project ID in Google Cloud Platform."
}

variable "region" {
    description = "Change region for instance"
}

variable "zone" {
    description = "Change zone for instance"
}

variable "machine_type" {
    description = "Instance configuration"
}

variable "disk_image" {
    description = "Whitch use disk image"
}

variable "ssh_user" {
    description = "User used for ssh access"
}

variable "private_key_path" {
    description = "Path to the private key used for ssh access."
}

variable "public_key_path" {
    description = "Path to the public key used for ssh access."
}