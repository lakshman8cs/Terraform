resource "google_compute_instance" "cloud-vm" {
  name         = var.instance_name
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar", "flaskapp-vm"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }
  #Define the network interface
  network_interface {
    network    = google_compute_network.lakshman-network.id
    subnetwork = google_compute_subnetwork.lakshman-subnetwork.id

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    app = "python"
  }

  # we need to use depends_on to ensure the subnetwork and random_string has been created
  depends_on = [
    google_compute_subnetwork.lakshman-subnetwork,
  ]
}

#subnetwork
resource "google_compute_subnetwork" "lakshman-subnetwork" {
  name          = var.subnetwork-name
  ip_cidr_range = var.ip_cidr_range
  region        = "us-central1"
  network       = google_compute_network.lakshman-network.id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }

  # We need to use depends_on to ensure the network has been created
  depends_on = [
    google_compute_network.lakshman-network
  ]
}


#network
resource "google_compute_network" "lakshman-network" {
  name                    = var.vpc-name
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "flask-fw" {
  name    = "flask-firewall"
  network = google_compute_network.lakshman-network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["5050","22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["flaskapp-vm"]
}
