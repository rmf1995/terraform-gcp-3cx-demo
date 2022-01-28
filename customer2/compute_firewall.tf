resource "google_compute_firewall" "customers-3cx" {
  name          = "${local.customer_name}-firewall-rules"
  network       = "customers-3cx"
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080", "1000-2000"]
  }

  target_tags = ["${local.customer_name}"]
}

