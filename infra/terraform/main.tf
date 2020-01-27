provider "google" {
    project         = var.project
    region          = var.region
}
resource "google_compute_instance" "gitlab" {
    name            = "gitlab-ci"
    machine_type    = var.machine_type
    zone            = var.zone
    tags            = ["gitlab-ci"]
    boot_disk {
        initialize_params {
            image = var.disk_image
        }
    }

    network_interface {
        network = "default"
        access_config {}
    }

    metadata = {
        ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
    }

    connection {
        host    = self.network_interface.0.access_config.0.nat_ip
        type    = "ssh"
        user    = file(var.ssh_user)
        private_key =file(var.private_key_path)
        agent   = false
    }
}