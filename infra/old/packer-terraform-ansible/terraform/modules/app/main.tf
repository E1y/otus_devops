resource "google_compute_instance" "app" {
    name            = "raddit-app"
    machine_type    = "f1-micro"
    zone            = "europe-west3-b"
    tags            = ["raddit-app"]
    boot_disk {
        initialize_params {
            image = "${var.app_disk_image}"
        }
    }
    network_interface {
        network = "default"
        access_config {
            nat_ip  = "${google_compute_address.app_ip.address}"
        }
    }
    metadata = {
        sshKeys = "appuser:${file(var.public_key_path)}"
    }
    connection {
        host    = self.network_interface.0.access_config.0.nat_ip
        type    = "ssh"
        user    = "appuser"
        private_key = "${file(var.private_key_path)}"
        agent   = false
    }
}

resource "google_compute_address" "app_ip" {
    name    = "reddit-app-ip"
}

resource "google_compute_firewall" "firewall_puma" {
    name    = "allow-puma-default"
    network = "default"
    allow {
        protocol    = "tcp"
        ports       = ["9292"]
    }
    source_ranges   = ["0.0.0.0/0"]
    target_tags     = ["raddit-app"]

}