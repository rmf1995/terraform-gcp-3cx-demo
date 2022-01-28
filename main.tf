terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.8.0"
    }
  }
}

provider "google" {
  credentials = file("gcp-account.json")

  project = "project-ID"
  region  = "europe-west2"
  zone    = "europe-west2-a"
}

resource "google_compute_network" "default" {
  name = "customers-3cx"
}

module "customer1" {
  source = "./customer1"
}

module "customer2" {
  source = "./customer2"
}
