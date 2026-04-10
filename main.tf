provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

module "cloudflare" {
  source = "./modules/cloudflare"

  cloudflare_api_token  = var.cloudflare_api_token
  cloudflare_zone_id    = var.cloudflare_zone_id
  cloudflare_account_id = var.cloudflare_account_id
  tunnel_id             = var.tunnel_id
}

module "oracle" {
  source = "./modules/oracle"

  tenancy_ocid     = var.oci_tenancy_ocid
  user_ocid        = var.oci_user_ocid
  fingerprint      = var.oci_fingerprint
  private_key_path = var.oci_private_key_path
  region           = var.oci_region
  compartment_id   = var.oci_compartment_id
  ssh_public_key   = var.oci_ssh_public_key
}
