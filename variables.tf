variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Zone ID for prajwolbikramadhikari.com.np"
  type        = string
}

variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string
}

variable "tunnel_id" {
  description = "Cloudflare tunnel ID"
  type        = string
  sensitive   = true
}

variable "oci_tenancy_ocid" {
  type      = string
  sensitive = true
}

variable "oci_user_ocid" {
  type      = string
  sensitive = true
}

variable "oci_fingerprint" {
  type = string
}

variable "oci_private_key_path" {
  type    = string
  default = "~/.oci/oci_api_key.pem"
}

variable "oci_region" {
  type    = string
  default = "us-phoenix-1"
}

variable "oci_compartment_id" {
  type      = string
  sensitive = true
}

variable "oci_ssh_public_key" {
  type      = string
  sensitive = true
}
