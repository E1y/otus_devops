resource "google_compute_instance" "db" {
    name            = "reddit-db"
    machine_type    = "f1-micro"
    zone            = "europe-west3-b"
    tags            = ["raddit-db"]
    boot_disk {
        initialize_params {
            image   = "${var.db_disk_image}"
        }
    }
    network_interface {
        network = "default"
        access_config {}
    }
    metadata = {
        sshKeys = "appuser:${file(var.public_key_path)}"
    }
}

resource "google_compute_firewall" "firewall_mongo" {
    name = "allow-mongo-default"
    network = "default"
    allow {
        protocol = "tcp"
        ports = ["27017"]
    }
    target_tags = ["raddit-db"]
    source_tags = ["raddit-app"]
}
