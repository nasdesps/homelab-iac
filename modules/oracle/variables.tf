variable "tenancy_ocid" {
  type      = string
  sensitive = true
}

variable "user_ocid" {
  type      = string
  sensitive = true
}

variable "fingerprint" {
  type = string
}

variable "private_key_path" {
  type    = string
  default = "~/.oci/oci_api_key.pem"
}

variable "region" {
  type    = string
  default = "us-phoenix-1"
}

variable "compartment_id" {
  type      = string
  sensitive = true
}

variable "ubuntu_image_ocid" {
  type    = string
  default = ""
}

variable "ssh_public_key" {
  type      = string
  sensitive = true
}
