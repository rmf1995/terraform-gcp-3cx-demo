resource "google_compute_address" "static" {
  name = "${local.customer_name}-ipv4"
}

data "google_compute_image" "debian_image" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance" "instance_with_ip" {
  name         = "${local.customer_name}-3cx-1"
  machine_type = local.machine_type

  tags = ["${local.customer_name}"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }

  network_interface {
    network = "customers-3cx"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
}