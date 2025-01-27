provider "google" {
  project = "testing-gcp-sys"
  region  = "asia-northeast1"
  zone    = "asia-northeasysst1-a"
}

#####==============================================================================
##### vpc module call.
#####==============================================================================
module "vpc" {
  source                                    = "git::https://github.com/SyncArcs/terraform-google-vpc.git?ref=master"
  name                                      = "app"
  environment                               = "test"
  routing_mode                              = "REGIONAL"
  mtu                                       = 1500
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
}

#####==============================================================================
##### Firewall module call.
#####==============================================================================
module "firewall" {
  source      = "./../"
  name        = "app"
  environment = "test"
  network     = module.vpc.vpc_id
  ingress_rules = [
    {
      name          = "allow-tcp-http-ingress"
      description   = "Allow TCP, HTTP ingress traffic"
      disabled      = false
      direction     = "INGRESS"
      priority      = 1000
      source_ranges = ["0.0.0.0/0"]
      allow = [
        {
          protocol = "tcp"
          ports    = ["22", "80"]
        }
      ]
    }
  ]
}