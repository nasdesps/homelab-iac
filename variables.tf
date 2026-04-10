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
