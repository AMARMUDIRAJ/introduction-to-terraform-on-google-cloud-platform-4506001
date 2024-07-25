data "google_compute_image" "ubuntu" {
  most_recent                 = true
  project                     = var.image_project
  family                      = var.image_family
}

resource "google_compute_network" "app" {
  name                      = var.network_name
  auto_create_subnetwork    = false 
}

resource "google_compute_subnetwork" "app-subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.network_ip_range
  region        = var.region
  network       = google_compute_network.app.id
}


resource "google_compute_instance" "app" {
  name         = var.app_name
  machine_type = var.machine_type

  
  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }
  network_interface {
   subnetwork = google_compute_subnetwork.app.name
   access_config {
      # Leave empty for dynamic public IP
    }
  }  

  all_stopping_for_update = true
}