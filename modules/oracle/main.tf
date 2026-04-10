terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 6.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

# ── Existing VCN ───────────────────────────────────────────────────
resource "oci_core_vcn" "adguard_vcn" {
  compartment_id = var.compartment_id
  display_name   = "adguard-vcn"
  cidr_blocks    = ["10.0.0.0/16"]
}

# ── Existing Subnet ────────────────────────────────────────────────
resource "oci_core_subnet" "adguard_subnet" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.adguard_vcn.id
  display_name   = "private subnet-adguard-vcn"
  cidr_block     = "10.0.1.0/24"
}

# ── Existing Compute Instance ──────────────────────────────────────
resource "oci_core_instance" "adguard_oracle" {
  compartment_id      = var.compartment_id
  availability_domain = "axoJ:PHX-AD-1"
  display_name        = "adguard-oracle"
  shape               = "VM.Standard.A1.Flex"

  shape_config {
    ocpus         = 4
    memory_in_gbs = 24
  }

  source_details {
    source_type = "image"
    source_id   = var.ubuntu_image_ocid
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.adguard_subnet.id
    assign_public_ip = true
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }

  lifecycle {
    ignore_changes = [
      source_details,
      metadata,
      create_vnic_details
    ]
  }
}
