// example of a single instance creation

//resource "google_compute_instance" "vm_instance" {
//  name         = "terraform-instance"
//  machine_type = "f1-micro"
//
//  boot_disk {
//    initialize_params {
//      image = "debian-cloud/debian-9"
//    }
//  }
//
//  network_interface {
//    # A default network is created for all GCP projects
//    network = "default"
//    access_config {
//    }
//  }
//
//  metadata = {
//    ssh-keys = "${var.ssh-key-account-name}:${file(var.ssh-public-key-location)}"
//  }
//}
